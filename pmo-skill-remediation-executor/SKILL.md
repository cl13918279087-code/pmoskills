---
name: "pmo-skill-remediation-executor"
description: "根据PMO Agent/Skill验收测试报告的问题清单（P0/P1/P2），执行分优先级的整改修复。处理废弃Skill标注、内容增强、映射同步、Handoff协议添加、version字段批量添加、frontmatter全字段规范化（author/department/display_name/description）等典型修复任务。"
pack: "project-management-pack"
purpose: "根据验收测试报告，分优先级执行PMO Agent/Skill体系的整改修复，确保Skill Pack从\"发现问题\"到\"问题解决\"的完整闭环。"
inputs: ["验收测试报告路径(.docx)", "技能包根目录路径", "规划清单路径(xlsx)", "修复优先级偏好(默认P0→P1→P2)"]
outputs: ["修复完成的问题清单", "更新的SKILL.md文件列表", "更新的pack.yaml变更摘要", "整改执行报告(.docx)"]
handoffs: []
---

# pmo-skill-remediation-executor

## Purpose

根据PMO Agent/Skill验收测试报告识别的问题，执行分优先级的整改修复，将Skill Pack从"发现问题"状态推进到"问题已解决"状态。与 `pmo-skill-acceptance-testing` 形成上下游：测试 → 报告 → 确认 → 修复 → 复查。

## When to use this skill

- `pmo-skill-acceptance-testing` 输出的验收报告已确认问题，需要执行修复
- 需要对Skill Pack进行系统性整改（废弃标注、内容增强、映射同步等）
- Skill Pack因跨Agent协作导致的问题需要在多个Agent/Skill中同步修复
- 需要对多个Tier B/C骨架Skill进行银行业务定制化内容增强
- 验收测试报告揭示了**深层结构问题**（Orchestrator边界模糊、Agent Handoff空白、重复文件分裂），需要制定分阶段整改方案
- 需要生成结构化的**问题分析与整改方案报告**（.docx）供 stakeholders 评审

## 修复优先级定义

| 优先级 | 定义 | 典型修复类型 |
|--------|------|-------------|
| **P0** | 必须修复，影响上线 | 废弃Skill标注（deprecated标记）、缺失文件修复、内容严重空洞（<50行） |
| **P1** | 建议修复，影响体验 | 规划ID映射缺失、章节别名不完整、Agent间Handoff协议缺失 |
| **P2** | 优化建议 | version字段缺失、Tier A业务特色可进一步增强 |

## 问题分类决策框架

在开始修复前，首先需要对验收测试报告中的问题进行分类决策，确定每个问题是"快速修复"还是"深度重构"，以选择正确的修复模式。

### 问题分类树

```
问题判定流程：
  Step 1: 该Skill是否deprecated（废弃）？
    → 是：模式A（废弃标注）P0
    → 否：继续Step 2

  Step 2: 该Skill是否缺少## Procedure / ## Purpose / ## Quality Gates章节本体？
    → 是内容空洞（<100行Procedure）：模式B（内容增强）P0
    → 否（内容存在但使用中文章程名）：继续Step 3

  Step 3: 英文别名heading是否存在？
    → 是（有## Procedure等英文heading）：无需修复
    → 否（仅有中文章程名如## 目的）：模式J（CN-first章节别名补充）P1
      - 若同时有数字编号子章节（如## 1. 概述）：模式L（Procedure汇总章节补建）P1
    → 否（无## Purpose但有## 概述 + ## Overview）：检查互指锚点
      - 有 `> 本章节英文名为 ## 概述` → 通过
      - 无互指锚点 → 补充EN别名为primary，CN为alias（模式J2）

  Step 4: 是否存在broken跨章节引用？
    → 是（如`见 ## 1. 概述`，实际heading是`## 概述`）：模式K（引用修复）P1
    → 否：继续Step 5

  Step 5: 是否为Orchestrator Skill？
    → 是：需额外确认Procedure是否为编排型Procedure（见模式C补充说明）
    → 否：按Step 3处理
```

### 三阶段整改策略（问题修复优先级排序）

并非所有问题都应按P0→P1→P2的原始标注顺序修复——应按**依赖关系**重新排序：

| 阶段 | 问题类型 | 修复目标 | 典型模式 |
|------|---------|---------|---------|
| **立即（1-2天）** | 20项P1章节别名（8个活跃Skill） | 全部通过规范检测 | 模式C |
| **短期（3-5天）** | Orchestrator Procedure缺失 + Agent Handoff协议 | 可被Agent可靠调用 | 模式C + 模式E |
| **中期（1-2周）** | 重复文件清理 + C级Skill内容增强 + 版本管理 | 架构健康度优秀 | 模式B + 模式F |

**排序原则：**
- 立即阶段：所有不涉及内容重写的"纯别名补充"问题（模式C）
- 短期阶段：涉及跨Agent协调的结构性问题（Handoff协议、Orchestrator Procedure）
- 中期阶段：涉及多文件协调或内容大量重写的架构问题

### P1问题的四个子类（关键决策点）

**P1-Type1（别名缺失，内容充实）：** 中文章节存在且内容>500字，仅需在现有heading后插入英文别名heading
- 修复操作：在## 流程后插入## Procedure（不修改任何现有内容）
- 典型Skill：wbs-builder、stakeholder-comms-planner、scope-boundary-checker

**P1-Type2（章节本体缺失或严重不足）：** 中文章节内容本身不完整，或分散在数字编号子章节中无法被检测脚本识别
- 修复操作：需要建立Procedure汇总章节 + 补充Quality Gates章节（模式B+模式C）
- 典型Skill：milestone-planner（Procedure混在数字编号中，无Quality Gates）、cost-estimation-helper（Procedure存在但无英文别名，Quality Gates缺失）
- **判断标准：** Skill总字符数>5000但检测脚本仍报告Procedure缺失 → Procedure内容分散而非缺失，需建立Procedure入口章节

**P1-Type3（CN-first章节结构需双向别名）：** Skill以中文heading为主，但检测要求EN为primary
- 修复操作：建立CN/EN双向对称结构，EN为primary，CN降为别名（模式J2）
- 典型Skill：cost-estimation-helper、schedule-sequencer、etc-reestimation-helper
- **判断标准：** Skill有## 概述但无## Purpose，或有## 操作流程但无## Procedure

**P1-Type4（跨章节引用指向不存在的heading）：** Skill内部引用使用了数字编号子章节名（如## 1. 概述），而主heading是## 概述
- 修复操作：将`见 ## 1. 概述`替换为`（详见 ## 概述）`
- 典型Skill：cost-estimation-helper、schedule-sequencer、etc-reestimation-helper
- **判断标准：** 全局搜索`见 ## \d`或`（见 ## \d`，匹配到则为P1-Type4

## 典型修复任务模式

### 模式A：废弃Skill标注（P0）

当确认某Skill已被合并/替代时，需要修改3处：

1. **SKILL.md frontmatter** — 添加 `deprecated: true` 字段，Purpose末尾注明替代方案
2. **SKILL.md Purpose章节** — 末尾添加"⚠️ 已废弃，由[替代Skill名称]替代"
3. **pack.yaml** — 将该Skill的 `readiness: "available"` 改为 `readiness: "deprecated"`，添加 `deprecated_reason` 和废弃日期

```
示例：scope-boundary-checker + inclusions-exclusions-writer → scope-management
```

### 模式B：内容增强 — 批量骨架Skill重写（P0）

当多个Tier B/C Skill为59行通用模板时，需要为每个Skill重写Procedure章节为银行业务定制内容。

**执行策略：使用子Agent并行处理**

```
由于每个Skill重写相互独立，使用 delegate_task 并行分配给多个子Agent（max 3个并发）：
  - 子Agent 1: wbs-builder, earned-value-tracker, risk-register-builder
  - 子Agent 2: schedule-sequencer, milestone-planner, stakeholder-comms-planner
  - 子Agent 3: cost-estimation-helper, etc-reestimation-helper

每个子Agent任务需要提供：
  - 技能包目录路径
  - 所属Orchestrator的调用上下文（用于理解该Skill在链路中的角色）
  - 银行业务定制要求（具体到该Skill的流程细节）
  - 必须保留原有frontmatter，只重写body章节
```

**检查子Agent输出路径错误**：子Agent可能将文件写入错误路径（如技能包根目录而非 `skills/<skill-id>/`）。需要检查并从错误路径恢复。

```bash
# 检查Skill文件行数是否被重写（应 >100行，原59行骨架）
for skill in wbs-builder earned-value-tracker ...; do
  wc -l ~/.hermes/skills/project-management/skills/$skill/SKILL.md
done

# 如文件在错误路径，从错误路径恢复
cp /Users/clzxr/<skill-id>/SKILL.md ~/.hermes/skills/project-management/skills/<skill-id>/SKILL.md
```

### 模式C：章节别名补充（P0/P1）

当Skill使用中文章程名但检测脚本需要英文别名时，在对应位置插入英文别名：

```
在 "## 目的" 后插入 "## Purpose"
在 "## 触发时机" 后插入 "## When to use"
在 "## 质量门" 后插入 "## Quality Gates"
在 "## 流程" 后插入 "## Procedure"
```

**`## When to use` 别名的3种变体（易被忽略）：**

| 变体 | 正确修复 | 说明 |
|------|---------|------|
| `## When to use this skill` | 在其前插入 `## When to use` | 英文但非标准名，本轮发现11个Skill |
| `## Trigger this skill when` | 在其前插入 `## When to use` | 英文但非标准名，本轮发现10个Skill |
| `## 触发时机`（中文） | 在其前插入 `## When to use` | 中文，需同时有英文章节名才算通过 |

**批量修复策略（execute_code优先）：**

```python
# 使用execute_code批量处理21个Skills的## When to use别名缺失
# 避免逐个patch效率低下
base = "/path/to/skills/"
trigger_skills = [...]   # ## Trigger this skill when 型（10个）
wtu_skills = [...]       # ## When to use this skill 型（11个）

# 原则：在目标heading前插入 "## When to use\n" 即可
```

**Orchestrator Skill的特殊情况：**
对于Orchestrator类Skill（如cross-dept-solution-orchestrator、compliance-check），其Procedure章节名称可能使用业务描述性名称（如## Solution Generation Process、## Change Control Procedure），检测脚本无法自动识别为Procedure。

修复策略：
- 方案1：在现有业务Procedure章节**上方**插入标准## Procedure章节作为入口，下方保留原有业务名称章节作为中文章节别名
- 方案2：将现有业务名称章节改名为## Procedure（中文别名保留在括号中），同时添加## Procedure英文别名

**P1-Type2的特殊修复（Procedure内容分散）：**
对于milestone-planner、schedule-sequencer等将Procedure内容分散在数字编号子章节中的Skill，应在文件靠前位置建立## Procedure汇总段落，引用下方各数字编号子章节，然后在## Procedure汇总段落后插入## Procedure英文别名heading。

### 模式D：pack.yaml规划ID映射同步（P1）

当规划清单（xlsx）中有Skill ID编码，但pack.yaml缺少 `规划_id` 字段时，需要对照Excel补充。

```
映射规则：
  - PMO-S001~PMO-S020 → 对应原子Skill
  - PMC-001~PMC-009 → 对应PMC系列Skill
  - 补充规划 → 规划清单中无编号的新Skill

注意：P0废弃Skill（scope-boundary-checker → PMC-001）的规划ID应保留在pack.yaml，标注deprecated
```

### 模式E：Agent结构化Handoff协议添加（P1）

当Agent间缺乏明确的交接协议时，为每个Agent添加 `## Agent间结构化Handoff协议` 章节：

```
章节结构：
  1. Handoff角色定义（发起方/接收方/仲裁方）
  2. Handoff触发场景表（来源/触发条件/交接数据/确认机制/响应时效）
  3. Handoff状态机（pending → acknowledged → in_progress → completed/blocked）
  4. 错误处理与超时策略

不同Agent的触发场景数量不同：
  - 战略推动智能体：2-3个场景（规划包下发、升级接收）
  - 项目管控智能体：4-6个场景（最复杂，作为协调中枢）
  - 项目执行智能体：3-4个场景（上报/下发）
  - 项目检查智能体：3-4个场景（评审请求/合规上报）
```

### 模式F：version字段批量添加（P2）

当Skill的frontmatter缺少 `version` 字段时，批量添加：

```python
import os

skills_dir = "/path/to/skills"
for skill in os.listdir(skills_dir):
    path = f"{skills_dir}/{skill}/SKILL.md"
    if os.path.isfile(path):
        with open(path) as f:
            content = f.read()
        if "version:" not in content.split("---")[1]:
            # Add after 'pack:' line
            frontmatter = content.split("---")[1]
            lines = frontmatter.split("\n")
            new_lines = []
            for line in lines:
                new_lines.append(line)
                if line.strip().startswith("pack:"):
                    new_lines.append('version: "1.0"')
            new_frontmatter = "\n".join(new_lines)
            new_content = f"---\n{new_frontmatter}\n---" + "---".join(content.split("---")[2:])
            with open(path, "w") as f:
                f.write(new_content)
```

### 模式P：Frontmatter全字段规范化（author/department/display_name/description）同步外部平台规范（P1）

当SkillHub等外部平台对SKILL.md的frontmatter有规范要求时（如PDF规范要求补充display_name/description/author/department字段），批量同步更新技能包内所有SKILL.md的frontmatter。

**规范来源**（以SkillHub为例）：
| 字段 | 要求 |
|------|------|
| `name` | kebab-case英文名，作为唯一标识key |
| `display_name` | 必填，技能中文名称 |
| `description` | 必填，简短描述（必须中文） |
| `author` | 必填，作者邮箱 |
| `department` | 必填，所属部门完整名称或编码 |
| `version` | 选填，格式为v1.0.0 |

**执行步骤：**

**Step P.0 — 备份handoffs（前置，必做）**
> 批量重建frontmatter会丢失旧frontmatter中除name/pack/purpose/inputs/outputs外的所有字段，包括`handoffs`。6个编排链Skill（strategy-charter-orchestrator、wbs-schedule-milestone-orchestrator、earned-value-evm-orchestrator、project-oversight-risk-orchestrator、org-stakeholder-communication-orchestrator、cross-dept-solution-orchestrator）的handoffs必须提前从pack.yaml的`chain`字段备份：

```python
import yaml
with open("/path/to/pack.yaml") as f:
    pack = yaml.safe_load(f)
handoffs_backup = {
    s['id']: s['chain']
    for s in pack['skills']
    if s.get('chain')
}
# 得到6个编排链Skill的handoffs列表
```

**Step P.1 — 读取规范文件**
使用pdfplumber从PDF提取规范文本，或直接读取示例.md文件获取字段要求：
```python
import pdfplumber
pdf_path = "/path/to/规范.pdf"
with pdfplumber.open(pdf_path) as pdf:
    text = "\n".join(p.extract_text() or "" for p in pdf.pages)
```

**Step P.2 — 批量提取display_name和description**
每个Skill的display_name从body第一个 `# 标题` 提取，description从 `## Purpose/## 概述/## 目的` 章节首段提取。对于提取失败的skill，建立 MANUAL_OVERRIDES 字典手动指定：
```python
MANUAL_OVERRIDES = {
    "skill-id": {
        "display_name": "中文技能名",
        "description": "简短中文描述（50-200字）"
    }
}
```

**Step P.3 — 规范化version格式**
确保version字段为 `"vX.Y.Z"` 格式（三段数字）：
```python
def fix_version(v):
    v = v.strip().strip('"')
    if not v.startswith('v'):
        v = 'v' + v
    parts = v[1:].split('.')
    while len(parts) < 3:
        parts.append('0')
    return 'v' + '.'.join(parts[:3])
```

**Step P.4 — 批量重建frontmatter**
使用execute_code脚本批量处理，避免逐个patch效率低下：
```python
import os, re

SKILLS_DIR = "/path/to/skills"
AUTHOR = "li.chen56@gientech.com"   # 固定值
DEPARTMENT = "PMO-BUCON"             # 固定值

for name in os.listdir(SKILLS_DIR):
    path = os.path.join(SKILLS_DIR, name, "SKILL.md")
    if not os.path.isfile(path):
        continue
    with open(path) as f:
        content = f.read()
    frontmatch = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    if not frontmatch:
        continue
    old_front_raw = frontmatch.group(1)
    body = content[frontmatch.end()+4:]
    
    # 解析旧frontmatter
    old_front = {}
    for line in old_front_raw.split('\n'):
        m = re.match(r'^(\w+):\s*(.*)', line)
        if m:
            old_front[m.group(1).strip()] = m.group(2).strip()
    
    # 提取display_name（从# 标题或MANUAL_OVERRIDES）
    display_name = MANUAL_OVERRIDES.get(name, {}).get('display_name')
    if not display_name:
        m = re.search(r'^#\s+(.+)$', body, re.MULTILINE)
        if m and not (m.group(1).startswith('[') and '项目名称' in m.group(1)):
            display_name = m.group(1).strip()
    
    # 提取description（从## Purpose首段或MANUAL_OVERRIDES）
    description = MANUAL_OVERRIDES.get(name, {}).get('description')
    if not description:
        m = re.search(r'##\s+(?:Purpose|概述|目的)\s*\n+(?:（[^）]+）\s*\n+)?(?:##\s+\w+\s*\n+)?([^\n##]{50,300})', body, re.MULTILINE)
        if m:
            description = re.sub(r'\s+', ' ', m.group(1).strip())[:200]
    
    version = fix_version(old_front.get('version', 'v1.0'))
    
    # 构建新frontmatter
    new_front_lines = ['---', f'name: "{name}"']
    if old_front.get('pack'):
        new_front_lines.append(f'pack: "{old_front["pack"]}"')
    new_front_lines.extend([
        f'display_name: "{display_name}"',
        f'description: "{description}"',
        f'author: {AUTHOR}',
        f'department: "{DEPARTMENT}"',
        f'version: "{version}"',
        '---', ''
    ])
    new_content = '\n'.join(new_front_lines) + body
    with open(path, 'w') as f:
        f.write(new_content)
```

**Step P.5 — 验证**
确保所有技能frontmatter字段完整：
```python
required = ['name', 'display_name', 'description', 'author', 'department', 'version']
for skill in os.listdir(SKILLS_DIR):
    path = os.path.join(SKILLS_DIR, skill, "SKILL.md")
    with open(path) as f:
        content = f.read()
    fm = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    fields = {k: v for k, v in re.findall(r'^(\w+):\s*(.*)', fm.group(1), re.MULTILINE)}
    missing = [f for f in required if f not in fields]
    if missing:
        print(f"{skill}: missing {missing}")
print(f"Total: {len([s for s in os.listdir(SKILLS_DIR) if os.path.isdir(os.path.join(SKILLS_DIR, s)) and s != 'deprecated'])} skills checked")
**Step P.5 — 验证**
> 验证两项：frontmatter字段完整 + handoffs字段恢复。

```python
required = ['name', 'display_name', 'description', 'author', 'department', 'version']
for skill in os.listdir(SKILLS_DIR):
    path = os.path.join(SKILLS_DIR, skill, "SKILL.md")
    with open(path) as f:
        content = f.read()
    fm = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    fields = {k: v for k, v in re.findall(r'^(\w+):\s*(.*)', fm.group(1), re.MULTILINE)}
    missing = [f for f in required if f not in fields]
    if missing:
        print(f"{skill}: missing {missing}")

# 验证6个编排链Skill的handoffs已恢复（从Step P.0的备份）
orchestrator_ids = [
    'strategy-charter-orchestrator', 'wbs-schedule-milestone-orchestrator',
    'earned-value-evm-orchestrator', 'project-oversight-risk-orchestrator',
    'org-stakeholder-communication-orchestrator', 'cross-dept-solution-orchestrator'
]
for skill_id in orchestrator_ids:
    path = os.path.join(SKILLS_DIR, skill_id, "SKILL.md")
    with open(path) as f:
        content = f.read()
    if 'handoffs:' not in content:
        # 从备份恢复
        handoffs_str = f'handoffs: {str(handoffs_backup[skill_id]).replace("\'", \'"\')}'
        # 插入到version行之后、---之前
        lines = content.split('\n')
        new_lines = []
        for line in lines:
            new_lines.append(line)
            if line.startswith('version:'):
                new_lines.append(handoffs_str)
        with open(path, 'w') as f:
            f.write('\n'.join(new_lines))
        print(f"Restored handoffs for: {skill_id}")
```

**注意事项**：
- 修复 `pack` 字段可能产生的双引号问题（`""project-management-pack""`），替换为标准单层引号
- 保留原frontmatter中的 `pack` 字段（非规范要求字段但不应删除）
- 固定值字段（author/department）直接使用传入值，无需从原文提取

### 模式G：待开发功能标注（P2）

当Skill的某个功能模块尚未开发时，在触发词表和Agent流程中添加标注：

```
在触发词表中：| 供应商评估 | 供应商管理 | ⚠️ 待开发（见下方说明） |

在文件末尾添加：
## ⚠️ [功能名] — 待开发说明
**当前状态：** [功能名称]Skill尚未开发完成...
**规划内容：** ...
**临时处理方案：** ...
```

### 模式H：新Skill从设计到集成上线（新增Skill创建）

当需要创建规划外的新Skill时，完整执行链路如下：

**Step H.1 — 命名与定位**
```
命名建议：
  - 以能力而非动作命名（vendor-risk-assessment 而非 assess-vendor）
  - 与现有命名风格一致（*-orchestrator/*-writer/*-builder/*-tracker）
  - 确认与现有Skill无语义重叠
```

**Step H.2 — SKILL.md编写**
```
必需章节：
  - frontmatter: name, pack, purpose, version, inputs, outputs, tags
  - Purpose: 一句话能力描述
  - When to use: 触发场景表（3-5个场景）
  - Procedure: 分阶段Step（每Step含具体操作+调用工具+输出）
  - Output Template: 完整输出模板
  - Quality Gates: 3-5项质量标准

可选章节：
  - Orchestration Procedure: 被哪些orchestrator调用
  - 章节别名（中英双语）
```

**Step H.3 — pack.yaml注册**
```
在skills数组末尾添加：
  - id: "<skill-id>"
    path: "skills/<skill-id>/SKILL.md"
    purpose: "<一句话描述>"
    规划_id: "待补充"（或对应规划编号）
    readiness: "available"
```

**Step H.4 — 集成到Agent**
```
两处需要更新：
  1. Agent SKILL.md 的核心Skill表：增加该Skill（名称/用途/优先级）
  2. Agent SKILL.md 的触发词表：增加触发词→流程映射
  3. Agent SKILL.md 的主业务流程：如为新流程类型，增加对应流程章节（见vendor-risk-assessment流程E示例）
```

### 模式I：patch后内容重复的修复

当patch的old_string不唯一时，可能导致内容复制而非替换（如ethics-management-plan-writer出现两个purpose字段）。修复策略：

```
判断标准：文件出现重复的frontmatter字段，或章节被复制

修复方法：
  1. 读取完整文件内容
  2. 人工确认正确内容（通常保留第一处，删除后续重复）
  3. 使用write_file重写整个文件，而非继续patch

预防：
  - patch前先用grep -n确认目标行号唯一
  - 避免对同一文件的同一区域连续多次patch
  - 对复杂修复优先使用write_file而非多次patch
```

### 模式J：CN-first章节结构的EN别名补充（P1-Type2：章节本体存在但英文别名缺失）

当Skill使用中文章程名（如`## 目的`、`## 操作流程`、`## 质量门`）作为主heading，但缺少英文别名时，插入英文别名heading：

```markdown
## 目的
（本节内容）

## Purpose
> 别名，指向 ## 目的
```

**两种子模式：**

| 子模式 | 场景 | 示例 |
|--------|------|------|
| **J1：CN-primary单向** | 仅有CN heading，在其下方插入EN别名 | deployment-planning、architecture-review |
| **J2：CN/EN双向对称** | 需同时保证EN为primary、CN为别名 | cost-estimation-helper、schedule-sequencer |

**J2双向对称的标准结构：**
```markdown
## 概述
## Overview
> 本章节英文名为 ## 概述

（内容）

## 操作流程
## Procedure
> 本章节英文名为 ## 操作流程

（内容）
```

**注意：** 双向对称时，EN别名heading后必须加 `> 本章节英文名为 ## CN-heading` 作为互指锚点，否则检测脚本无法识别为有效别名对。

### 模式K：跨章节引用修复（P1）

当Skill内的交叉引用使用了不存在的heading名称时（如`见 ## 1. 概述`引用了数字编号子章节，而实际主heading是`## 概述`），修复为标准引用格式：

```
修复前：见 ## 1. 概述 — 适用场景
修复后：（本技能在以下场景触发，参见 ## 概述）

修复前：（见 ## 1. 概述 — 本系统适用场景）
修复后：（本技能适用于以下场景，参见 ## 概述）
```

**判断标准：** 全文搜索 `见 ## \d` 模式，定位broken引用，逐个替换为不含数字编号的标准heading引用。

### 模式L：Procedure章节本体缺失的补建（P1-Type2专项）

当Skill总字符数>5000但检测脚本仍报告Procedure缺失时，通常是Procedure内容分散在数字编号子章节（如`## 1. 概述`、`## 2. 估算方法`）中。修复策略：

```
在文件靠前位置（Purpose章节之后）插入 Procedure 汇总段落：

## Procedure
> 本章节为 ## Procedure 入口，详细的分步操作见下方各子章节。

**操作步骤概要：**
1. 步骤一（详见 ## 1. 估算方法论）
2. 步骤二（详见 ## 2. 估算流程）
...

## Procedure
```

在汇总段落后，再插入 `## Procedure` 英文别名heading，确保检测脚本能识别。

### 模式M：patch串扰导致内容错位的修复

当连续对同一文件执行多次patch操作时，前一次patch改变的行号可能导致后一次patch匹配到错误位置（如在错误位置插入重复章节）。修复策略：

```
判断标准：
  - 同一章节被复制两次出现在文件中
  - 数字编号子章节与汇总章节内容重叠
  - 文件行数异常增长（应 +N 行，实际 +2N 行）

修复方法：
  1. 使用 execute_code 读取文件完整内容
  2. 用正则表达式定位重复区域（找连续两处相同的 ## heading）
  3. 删除重复区域，保留正确内容
  4. 使用 write_file 重写文件，而非继续patch

预防：
  - 对需要多处修改的文件，优先用 execute_code + write_file 一次性完成
  - 避免连续3次以上patch同一文件的不同位置
```

### 模式Q：跨文档元数据一致性检查与修复（四向对比）

当需要验证或修正 Skill 编号在多个文档间的一致性时，对以下四个来源进行交叉比对：
- **pack.yaml** 的 `规划_id` 字段（**权威来源**）
- **DOCX操作手册** Table 1 的编号列
- **SKILL.md frontmatter** 的 `number:` 字段（注意：大多数现有SKILL.md**没有**此字段，不要假设存在）
- **MD文档** 表格中的编号列

**比对流程：**

```
Step Q.1 — 提取四源数据
  pack.yaml: 遍历 skills[]，提取 id → 规划_id 映射
  DOCX: 读取 Table 1（跳过表头行），提取 skill_id → 编号
  SKILL.md: frontmatter 中 number: 字段（存在则提取，不存在则记为"无"）
  MD: 解析表格行，提取 skill_id → 编号

Step Q.2 — 建立以 pack.yaml 为权威的对比表
  以 pack.yaml 规划_id 为基准，逐一对比其他三个来源
  差异类型：
    A. 编号不一致（DOCX/MD 与 pack.yaml 不同）
    B. 编号缺失（DOCX/MD 有编号但 pack.yaml 为空）
    C. 编号异常（pack.yaml 值为"编排链 Skill"/"补充规划"/"待补充"等占位符）
    D. SKILL.md 缺少 number: 字段

Step Q.3 — 修复顺序（注意依赖！）
  1. 首先修正 pack.yaml 中的编号占位符（模式R）
  2. 然后以 pack.yaml 为权威，修正 DOCX 和 MD 中的编号
  3. 最后为 SKILL.md 添加/修正 number: 字段

Step Q.4 — 验证
  四向全部一致后，再生成整改报告
```

**关键陷阱（Failure Modes）：**
- ❌ **假设 SKILL.md 存在 `number:` 字段**：现有 Skill 绝大多数没有此字段，grep 返回0不代表验证通过；必须先检查文件实际内容
- ❌ **DOCX 被错误地当作权威来源**：之前对 DOCX 执行了"重新编号方案A"覆盖了原始编号，而原始编号的真正权威是 pack.yaml
- ❌ **yaml.dump 破坏 pack.yaml 格式**：使用 `yaml.dump()` 而不指定 `default_flow_style=False` 和 `sort_keys=False` 会打乱 YAML 结构；优先用正则替换
- ❌ **yaml.safe_load 解析后键顺序改变**：safe_load 会改变 YAML 键的顺序，与 `yaml.dump` 配合使用时会导致 pack.yaml 中 skill 排列顺序被打乱，影响 diff 可读性

**验证脚本模板：**
```python
import yaml, re
from docx import Document

# Load pack.yaml
with open('/path/to/pack.yaml') as f:
    pack = yaml.safe_load(f)
pack_ids = {s['id']: s.get('规划_id') for s in pack.get('skills', [])}

# Load DOCX Table 1
doc = Document('/path/to/操作手册.docx')
table1 = doc.tables[1]
docx_ids = {}
for row in table1.rows[1:]:
    cells = [c.text.strip() for c in row.cells]
    sid = cells[2].replace('`', '')
    docx_ids[sid] = cells[1]

# Check consistency
for sid in sorted(set(pack_ids) | set(docx_ids)):
    pack_num = pack_ids.get(sid, '—')
    docx_num = docx_ids.get(sid, '无')
    status = '✅' if pack_num == docx_num else '❌'
    print(f'{status} {sid}: pack={pack_num}, docx={docx_num}')
```

### 模式R：编号占位符替换与正式编号分配

当 pack.yaml 中某些 Skill 的 `规划_id` 为占位符（"编排链 Skill" / "补充规划" / "待补充"）时，需要分配正式编号并同步至所有相关文档。

**占位符分类与编号策略：**
| 占位符 | 含义 | 编号策略 |
|--------|------|---------|
| `编排链 Skill` | Orchestrator 类 Skill | 分配 PMO-21 ~ PMO-26（连续） |
| `补充规划` | 规划外新增的原子 Skill | 分配 PMC-010（PMC系列末尾） |
| `待补充` | 已有 Skill 但规划未分配编号 | 分配 PMC-011（PMC系列末尾） |

**执行步骤：**

```
Step R.1 — 扫描 pack.yaml 收集所有已用编号
  PMO系列：从 PMO-01 到最大已用编号
  PMC系列：从 PMC-001 到最大已用编号
  计算可用编号间隙

Step R.2 — 分配编号（按 Skill 性质分类）
  Orchestrator Skill → 分配下一个可用 PMO 编号
  原子 Skill（已有PMC前缀倾向）→ 分配下一个可用 PMC 编号
  原子 Skill（无明确倾向）→ 根据 Skill 描述判断（成本/进度/配置类→PMC，其他→PMO）

Step R.3 — 四处同步
  1. pack.yaml: 正则替换 规划_id 占位符 → 正式编号
  2. SKILL.md: 在 frontmatter 的 version: 行后添加 number: "PMO-XX"
  3. DOCX: 定位 Table 1 中对应行，替换编号列
  4. MD: 定位表格中对应行，替换编号

Step R.4 — 验证
  grep "规划_id.*编排链 Skill\|补充规划\|待补充" pack.yaml  # 应返回空
  所有新编号在对应 SKILL.md 的 number: 字段中存在
```

**特别注意：**
- 不存在 PMO-21~26 以外的可用 PMO 编号 → 使用已知的最大 PMO 编号 +1
- PMC 编号需要确认最大已用（如 PMC-009），则新增为 PMC-010、PMC-011
- 更新后需要验证编号全局唯一性

### 模式O：pack.yaml skill_readiness_summary数字与实际同步（P0）

当审查报告揭示pack.yaml的skill_readiness_summary数字与实际不符时（如available:35但实际为36），需要同步修正两处：

1. **skill_readiness_summary字段**：修正available/framework/methodology/deprecated数量
2. **deprecated路径更新**：如果废弃Skill文件被移动到deprecated/目录，pack.yaml中的path字段必须同步更新

```python
# 验证逻辑：
# 1. 从pack.yaml skills数组统计每个readiness级别数量
# 2. 对照skill_readiness_summary声明的数量
# 3. 如不一致，以skills数组实际数量为准更新summary
# 4. 同时检查deprecated skills的path是否需要更新（文件隔离后）

# 废弃Skill隔离后的路径更新（模式A补充）：
# 移动文件：mv skills/scope-boundary-checker skills/deprecated/
# 更新pack.yaml: path: skills/scope-boundary-checker/ → path: skills/deprecated/scope-boundary-checker/
```

### 模式N：Excel规划清单状态批量更新

当多个Skill的readiness从framework改为available后，需要同步更新Excel规划清单的"覆盖状态"列：

```python
import openpyxl

wb = openpyxl.load_workbook(excel_path)
ws = wb.active

# 定位"覆盖状态"列（表头行）
header_row = 1
status_col = None
for col in range(1, ws.max_column + 1):
    if ws.cell(header_row, col).value == "覆盖状态":
        status_col = col
        break

# 遍历Skill名称列，匹配后更新覆盖状态
for row in range(2, ws.max_row + 1):
    skill_name = ws.cell(row, name_col).value
    if skill_name in updated_skills:
        ws.cell(row, status_col).value = "开发完成"
```

**行定位技巧：** 当Excel无明确ID列时，通过搜索Skill中文名称定位行号（如搜索"跨部门协调Skill"定位row 9）。

## Operating Procedure（执行流程）

### Step 1: 读取验收报告，确认问题清单

```
从 .docx 验收报告解析 P0/P1/P2 问题：
  - P0：废弃Skill标注、内容严重空洞（<50行骨架）
  - P1：规划ID映射缺失、章节别名不完整、Handoff协议缺失
  - P2：version字段缺失、业务特色可增强

与用户确认是否按 P0→P1→P2 顺序执行，或选择性执行
```

### Step 2: 按优先级执行修复

```
P0修复（必须先完成）：
  ├─ 模式A：废弃Skill标注（2处文件 + pack.yaml）
  ├─ 模式B：骨架Skill内容增强（子Agent并行，3个并发）
  └─ 模式C：章节别名补充

P1修复（P0完成后执行）：
  ├─ 模式D：pack.yaml规划ID映射补充
  └─ 模式E：Agent Handoff协议添加

P2修复（P1完成后执行）：
  ├─ 模式F：version字段批量添加
  └─ 模式G：待开发功能标注
```

### Step 3: 修复验证

```
执行前后对比：
  - 废弃Skill：grep deprecated SKILL.md，确认readiness=deprecated in pack.yaml
  - 内容增强：wc -l SKILL.md，确认 >100行（原来是~59行骨架）
  - 章节别名：验证检测脚本能识别（ Purpose/Procedure/Quality Gates）
  - 规划ID：grep 规划_id pack.yaml，确认所有Skill都有映射
  - Handoff协议：验证4个Agent都有 ## Agent间结构化Handoff协议 章节
  - version字段：grep version SKILL.md，确认所有Skill都有
```

### Step 4: 生成整改执行报告

```
使用python-docx生成整改执行报告，包含：
  1. 修复执行概要（执行日期/范围/优先级）
  2. P0修复明细（废弃标注、内容增强）
  3. P1修复明细（映射同步、Handoff协议）
  4. P2修复明细（version字段、待开发标注）
  5. 未解决问题清单（如有遗留问题）
  6. 后续建议
```

## Quality Gates

- [ ] P0问题全部修复（P0废弃Skill有deprecated标记，内容空洞Skill已重写）
- [ ] P1问题全部修复（规划ID 100%覆盖，Handoff协议4个Agent都有）
- [ ] P2问题全部修复（version字段100%覆盖）
- [ ] 无因修复过程引入的新问题（如误删pack.yaml条目）
- [ ] 修复后的pack.yaml仍为合法YAML格式
- [ ] 生成的整改执行报告包含完整的问题-修复对照表

## Failure Modes to Avoid

| 错误 | 说明 | 正确做法 |
|------|------|---------|
| ❌ 子Agent文件路径写错 | 子Agent可能将文件写入技能包根目录而非 skills/<skill-id>/ | 修复后检查文件路径，恢复错误路径的文件 |
| ❌ 误删pack.yaml中Skill条目 | patch时old_string不唯一可能匹配到错误的段落 | patch前先用grep -n确认目标行号，用足够唯一的上下文 |
| ❌ P0废弃Skill未标注pack.yaml | 只改了SKILL.md但忘记改pack.yaml的readiness字段 | 废弃标注必须同步2处文件（SKILL.md + pack.yaml） |
| ❌ 子Agent并发超过限制 | >3个子Agent并发可能导致系统资源问题 | 每次 delegate_task 最多3个task，分批执行 |
| ❌ patch串扰导致内容重复 | 连续多次patch改变行号，后续patch匹配到错误位置 | 同一文件超过3处修改优先用execute_code+write_file |
| ❌ 双向别名缺少互指锚点 | CN/EN双向别名结构缺少`> 本章节英文名为 ## CN-heading` | 双向别名必须在EN heading后立即添加互指锚点 |
| ❌ 数字编号子章节引用未修复 | `见 ## 1. 概述`等引用在重命名主heading后失效 | 重构章节后全局搜索`见 ## \d`并修复所有跨引用 |
| ❌ Excel行号硬编码无验证 | Excel行号基于上次执行经验，未动态搜索skill名称 | 每次通过搜索列A的skill中文名称动态定位行号 |
| ❌ 模式P批量重建frontmatter时`handoffs`字段丢失 | 解析旧frontmatter时只提取了name/pack/purpose/inputs/outputs，忽略了`handoffs`，导致6个编排链Skill的交接协议丢失 | 模式P执行前从pack.yaml的`chain`字段备份handoffs列表；执行后对照pack.yaml验证6个编排链Skill的`handoffs`字段是否完整，缺失时从`chain`字段恢复 |
| ❌ 模式P中`pack`字段构建产生双引号`""`问题 | 拼接`f'pack: "{old["pack"]}"'`时，若旧值本身含引号会变成`""value""` | 构建pack字段前先`strip('"')`处理，再用单层引号包裹；若写入后检测到`""`则执行全局替换 |
| ❌ 模式Q/R中假设SKILL.md存在`number:`字段 | 现有Skill绝大多数SKILL.md没有`number:`字段，grep返回0不代表验证通过 | 每次必须先读取SKILL.md文件内容确认字段存在，再进行提取和对比 |
| ❌ 模式R中yaml.safe_load打乱pack.yaml键顺序 | safe_load会改变YAML键的顺序，与yaml.dump配合使用会打乱skills数组排列 | 优先使用正则替换修改pack.yaml，而非load→modify→dump；如果必须使用yaml库，必须在dump时指定`sort_keys=False`并尽可能保留原格式 |
| ❌ 模式Q/R中DOCX编号被错误当作权威来源 | 之前对DOCX执行"重新编号方案A"覆盖了原始编号，而原始编号权威来源是pack.yaml | 任何跨文档编号比对场景，必须以pack.yaml的`规划_id`为唯一权威基准；DOCX/MD/SKILL.md都应向pack.yaml对齐 |
