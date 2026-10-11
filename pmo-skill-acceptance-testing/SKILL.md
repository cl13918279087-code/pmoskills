---
name: "pmo-skill-acceptance-testing"
description: "验收测试PMO领域（或符合Agent/Skill矩阵规划的其他领域）的Agent和Skill：对照规划文档，逐项验证流程完整性、代码可用性、编排链路正确性，输出结构化验收测试报告（.docx）。"
pack: "project-management-pack"
purpose: "验收测试PMO领域Agent和Skill：对照规划文档，逐项验证流程完整性、代码可用性、编排链路正确性，输出结构化验收测试报告（.docx）。"
inputs: ["规划文档路径", "技能包根目录路径", "被测Agent/Skill列表", "测试维度偏好"]
outputs: [".docx格式验收测试报告", "问题清单（P0/P1/P2分类）", "Skill可用性评级表（A/B/C级）", "验收结论"]
handoffs: []
---

# pmo-skill-acceptance-testing

## Purpose

对PMO领域（或符合Agent/Skill矩阵规划的其他领域）已实施的Agent和Skill进行**全面验收测试**，验证其是否满足规划文档中定义的功能范围、流程完整性、交付规范及编排逻辑。

本技能**不是**直接修复Skill，而是**系统性发现和记录问题**——为后续改进提供依据。

## When to use this skill

- 某个领域的Agent/Skill第一阶段开发完成，需要做验收测试
- 需要对照原始规划文档，验证实施成果与规划的一致性
- 需要生成正式的`.docx`格式验收测试报告（用于评审、存档或交付）
- 需要在多个Agent/Skill中识别哪些可直接使用、哪些需修改、哪些完全不可用
- **需要执行多轮验收测试（v2→v3→v4…），跟踪每轮问题修复进度**
- **整改后复验：上一轮发现的问题已修复，需验证修复效果并生成新版本报告**
- **需要生成完整的BU验收材料包（三份文档）**：验收测试报告（.docx）+ 验收总结报告（.docx）+ 解决方案售前材料（.pptx），按BU规范模板格式输出

## Multi-Round Iteration Tracking（多轮迭代模式）

| 轮次 | 触发条件 | 输出 |
|------|---------|------|
| v1.0（初始验收） | Agent/Skill第一版开发完成 | 问题基线清单 |
| v2.0（第二轮） | 已知P1问题已修复 | 验证修复效果，确认遗留问题 |
| v3.0（第三轮） | 新发现P1问题已修复 | 同上 |
| vN.0 | 每轮整改完成后复验 | 持续收敛至0 P1问题 |

**多轮测试报告命名规范：** `{领域}_Agent_Skill_第N轮验收测试报告_vN.0.docx`
**多轮测试案例命名规范：** `{领域}_Agent_Skill_第N轮验收测试案例集.md`

## Test Coverage Scope（测试范围）

| 测试维度 | 验证内容 | 通过标准 |
|---------|---------|---------|
| **Agent流程完整性** | Agent是否覆盖规划中定义的全部业务场景（scenarios字段） | 100%覆盖 |
| **编排Skill链路** | Orchestrator Skill的pack.yaml chain字段是否指向真实存在的Skill | chain 100%验证，无orphan |
| **原子Skill框架** | 每个Skill是否有对应SKILL.md文件 | 文件存在 |
| **文档规范性** | SKILL.md是否包含必要章节（Purpose/When_to_use/Procedure/Quality Gates） | 四章节齐全 |
| **接口定义完整性** | inputs/outputs/handoffs三个frontmatter字段是否存在 | 三字段齐全 |
| **Agent-Skill映射** | Agent配置的Skill引用是否在目录中存在 | 全部引用有效 |
| **Agent文件规范** | Agent SKILL.md是否含version字段（v0.8.0）和usage_scope字段（"仅本地使用"） | 两字段齐全 |
| **内容充实度** | 基于字符数、章节数、代码块进行A/B/C评级 | 评级与内容一致 |

### Three-Dimension Test Case Design Framework（三维测试用例设计框架）

> 目标：单个领域全量验收测试应设计 **≥120个测试用例**，覆盖以下三个维度：

| 维度 | 用例数目标 | 测试内容 | 设计原则 |
|------|-----------|---------|---------|
| **业务场景测试（BA）** | 37 + N个边界场景 | 常规业务场景覆盖（每个Skill 1个）+ 关键边界场景（高风险Skill专项） | 常规场景：每个Active Skill 1个；边界场景：聚焦EVM极端值、大型WBS、多方冲突等高风险场景 |
| **接口测试（IA）** | 编排链路数 × 5 | 每条编排链路验证5个方面：数据传递、全链路完整性、异常降级、执行性能、边界处理 | 数据传递→全链路→异常降级→性能→边界，五维全覆盖 |
| **准确率测试（QA）** | Skill数 × 3 | 每个Skill验证3项四章节规范：Purpose完整性、Procedure规范性、Quality Gates可量化 | 三项关键检查缺一不可，四章节完整率必须100% |

**典型数量分布示例（37个Skill / 6条Chain）：**
```
业务场景测试（BA）：37（常规）+ 15（边界）= 52个
接口测试（IA）：6条Chain × 5个测试 = 30个
准确率测试（QA）：37个Skill × 3项检查 = 111个
废弃隔离测试（DA）：2个（deprecated目录隔离验证）
Agent专项测试（AG）：4个Agent × 2项 + 2个通用 = 10个
─────────────────────────────────────────
合计：205个测试用例
```

**边界场景选取原则（优先选取高风险Skill）：**
- EVM类Skill：极端绩效值（SPI>1.2、CPI<0.5）
- WBS类Skill：超大规模（100+工作包）或极小规模
- 协调类Skill：多方利益冲突（≥3部门）
- 文档生成类Skill：信息缺失场景
- 流程控制类Skill：紧急/异常流程场景

## Test Method（测试方法）

### 方法1：文件审查（章节检测含大小写/中文别名）

**⚠️ P1问题判定标准（实测验证）：**
- 某Skill有中文Procedure章节但无英文Procedure别名 → 评为**B级** → 定为**P1**（非P0，因为核心功能章节存在）
- 某Skill完全无Procedure章节（含所有变体） → 评为**C级** → 定为**P1**或**P0**（视缺失程度）
- P0问题仅限：Skill文件缺失、chain引用orphan skill、readiness定义与实际不符

**⚠️ QA章节长度检测的幸存者偏差 bug（实测发现）：**

章节内容长度检测不得使用 `^##` 作为前瞻边界匹配，因为章节内含 `###` 子标题时，`^##` 会错误匹配到子标题（`### Step 1 — xxx` 的 `##`），导致所有章节长度归零，产生111个假阳性失败。

**正确实现：按顶层 `##` 分片后再匹配**
```python
def section_len(body, *names):
    """Split by top-level '## ' (not '###') then match section header"""
    parts = re.split(r'(?=^## )', body, flags=re.MULTILINE)  # top-level only
    for name in names:
        for part in parts:
            stripped = part.strip()
            # Match "## Name" or "## Name (subtitle)" — top-level section
            if re.match(rf'^##\s+{re.escape(name)}\b', stripped, re.IGNORECASE):
                first_newline = part.find('\n')
                if first_newline >= 0:
                    return len(part[first_newline+1:].strip())
    return 0

def has_section(body, *names):
    for name in names:
        if re.search(rf'^##\s+{re.escape(name)}\b', body, re.MULTILINE | re.IGNORECASE):
            return True
    return False
```

**章节别名双轨规则**

PMO Skill章节别名分为两类，检测逻辑不同：

PMO Skill章节别名分为两类，检测逻辑不同：

| 类别 | 规则 | 示例 |
|------|------|------|
| **中文章节必须附带英文别名** | 检测到`## 目的`时，必须同时存在`## Purpose`才算通过 | `## 目的` + `## Purpose` |
| **英文别名允许有多种变体** | 检测到`## Procedure`即可，变体（如`## Operating Procedure`）也算通过 | `## Procedure`或`## Operating Procedure`均可 |

⚠️ **P1问题判定标准（实测验证）：**
- 某Skill有中文Procedure章节但无英文Procedure别名 → 评为**B级** → 定为**P1**（非P0，因为核心功能章节存在）
- 某Skill完全无Procedure章节（含所有变体） → 评为**C级** → 定为**P1**或**P0**（视缺失程度）
- P0问题仅限：Skill文件缺失、chain引用orphan skill、readiness定义与实际不符

```
For each Agent/Skill:
  1. Read SKILL.md frontmatter — check name/purpose/inputs/outputs/handoffs fields
  2. Read body — check for required sections, applying the dual-track alias rules above:

     Required "Purpose" section — **PMO Skill变体（重要，实测发现）**：
       ## Purpose (canonical)
       ## Overview
       ⚠️ 中文章节 ## 目的 必须附带英文别名 ## Purpose 才算通过
       **⚠️ PMO Skill实际写法（无需中文章节）**：
         · frontmatter使用 `description:` 字段（非 `purpose:`）
         · body使用 `## Purpose` 英文章节（无中文章节变体）
         · 此时应判为 **PASS（P2级别以上）**，属PMO规范写法，不算缺失
         · 内容充实度评分：PMO的 `description:` 字段计为purpose等效（+20分）

     Required "When to use" section — canonical form ALIASES (7 known variants):
       ## When to use this skill (canonical)
       ## When to use
       ## Trigger this skill when
       ## 触发时机 (Chinese, must also have English alias)
       ⚠️ 中文章节 ## 触发时机 必须附带英文别名 ## When to use 才算通过
       ⚠️ 注意：`## Trigger this skill when` 是广泛使用的英文别名，检测脚本必须接受

     Required "Procedure" section — ALIASES (8 known):
       ## Procedure (canonical)
       ## Operating Procedure
       ## Orchestration Procedure (orchestrator skills)
       ## Change Control Procedure (change-control skill)
       ## CI Management Procedure (config-item-management skill)
       ## Meeting Notes Workflow (meeting-notes skill)
       ## Solution Generation Process (solution-generation skill)
       ## 操作流程 (Chinese — must also have English alias ## Procedure)
       ⚠️ 中文 ## 操作流程 必须附带英文 ## Procedure 才算通过

     Required "Quality Gates" section — ALIASES (4 known variants):
       ## Quality Gates (canonical, capital G)
       ## Quality gates (lowercase g — widely used in existing skills)
       ## Template Quality Checklist (template-management skill)
       ## 质量门 (Chinese, must also have English alias)

  3. Flag P1 only when Chinese section exists but English alias is missing
  4. Flag P0 only when the section (in any alias form) is completely absent
  ⚠️ 注意：SKILL.md中无readiness字段（定义在pack.yaml）；PMO Skill通常无嵌入式Python代码块
```

### 方法2：流程对照
```
For each Agent:
  1. Extract scenarios list from frontmatter (scenarios: [...] field)
  2. Compare against 规划文档's "业务场景" list (xlsx Agent sheet)
  3. Mark any missing scenario coverage
  ⚠️ 注意：PMO Agent的触发机制是scenarios字段，不是独立trigger词
```

### 方法2b：上传清单模板一致性校验（规划文档 vs Pack对比）
```
⚠️ 关键背景（实测发现）：
  · pack.yaml 的 core_skills = Agent直接拥有/直接调用的核心技能（每Agent约6-7个）
  · 上传清单模板的"使用的skill ID"列 = Agent可用/参与的所有技能（含共享Skill，每Agent约10-17个）
  · 两者语义不同：core_skills是"所有权"，模板是"使用关系"
  · 模板Skill数量 > core_skills数量 → 正常，不代表不一致

校验步骤：
  1. 用 openpyxl 读取上传清单模板（Sheet1）
     ⚠️ 严禁硬编码列索引！必须先读第1行列头建立 col_map：
       headers = [cell.value for cell in sheet[1]]
       col_map = {name: idx for idx, name in enumerate(headers) if name}
       agent_name = row[col_map['数字员工名称']]
       skill_id = row[col_map['使用的skill ID']]

  2. 验证Skill ID完整性：
     · 模板中所有Skill ID是否都在pack.yaml的skills列表中（37个）
     · 模板中所有Agent是否都在pack.yaml的agents列表中（4个）

  3. 验证关联关系类型（如模板有新增列）：
     · 从col_map读取 core_skills_map（pack.yaml中每个Agent的core_skills集合）
     · 对比：Skill在模板中标记的关系类型（直接拥有/使用协作）是否与core_skills一致
     · Skill in core_skills → 关系类型应为"直接拥有"
     · Skill NOT in core_skills → 关系类型应为"使用/协作"
     · 共享Skill（如scope-management、solution-generation被3个Agent使用）→ 多个Agent都应关联该Skill

  4. 检查重复行：同Agent+同Skill的组合不应出现多次
  5. 输出"关联关系类型统计表"：每Agent的直接拥有数、使用/协作数、合计
```

### 方法3：规划文档读取（xlsx多sheet）
```
规划文档格式为xlsx，包含三页：
  - Sheet "Agent"：Agent名称/说明/业务领域/涉及业务场景/所属部门/开发进度（列数不固定）
  - Sheet "Skill"：Skill ID/名称/类型/技能描述/业务场景应用支撑说明/知识来源（列数不固定）
  - Sheet "Skill视图"：Skill/Agent矩阵（主用/调用关系）

⚠️ 重要：xlsx文件的列数和列名因版本而异，严禁硬编码列索引（如row[6]）。必须用动态方式读取：
  1. 先读取第1行列头，用 enumerate(idx, cell.value) 建立"列名→索引"的映射字典
  2. 用映射字典按列名取值，如 row[col_map["智能体名称"]]，而不是 row[1]
  3. 处理列名可能有空值或微小差异（如"开发进度"vs"开发状态"）的情况
  4. 对缺失的列（映射中不存在）返回 None，不要崩溃

读取方法：openpyxl.load_workbook(data_only=True)
```

### 方法4：编排链路验证（关键）
```
⚠️ 重要：编排链路的唯一权威来源是pack.yaml的chain字段，不是SKILL.md的handoffs字段。
handoffs声明的是"下游可衔接Skill"，chain定义的是"编排时的实际调用顺序"，两者不同。

For each Orchestrator Skill:
  1. 从pack.yaml读取 chain: [skill-a, skill-b, ...] 字段（权威来源）
  2. 对chain中每个skill验证：
     - 文件存在于 skills/<skill-id>/SKILL.md
     - 无orphan引用（chain item在目录中不存在）
  3. 检查SKILL.md的handoffs字段是否包含chain中的元素（下游衔接声明）
  4. 不验证SKILL.md的handoffs作为chain来源
```

### 方法5：内容充实度评分
```
评分维度（0-100分）：
  - name字段：+20分
  - purpose字段：+20分
  - inputs定义：+10分
  - outputs定义：+10分
  - handoffs定义：+5分
  - 含## Purpose章节：+10分
  - 含## Procedure章节：+10分
  - 含## Quality Gates：+5分
  - 含Python代码块：+5分
  - 内容字符数>5000：+5分

评级：
  - A级（≥70分+含Procedure+>5000字符）：可直接使用
  - B级（50-69分）：框架可用，内容需增强
  - C级（<50分）：方法论描述，深度不足
```

## Operating Procedure（执行流程）

### Step 1: 读取规划文档 + 扫描技能包目录
```
Input: 规划文档路径 + 技能包根目录
  ├─ 扫描技能包 skills/ 目录，确认实际存在的Skill列表
  ├─ 扫描技能包 .agents/ 目录，确认实际存在的Agent列表
  ├─ 使用openpyxl读取规划文档xlsx的三页（Agent/Skill/Skill视图）
  │   ⚠️ 严禁硬编码列索引！必须先读第1行列头建立 col_map，再用 col_map["列名"] 取值
  │   示例：
  │     headers = [cell.value for cell in sheet[1]]
  │     col_map = {name: idx for idx, name in enumerate(headers) if name}
  │     for row in sheet.iter_rows(min_row=2, values_only=True):
  │         name = row[col_map.get("智能体名称")] if "智能体名称" in col_map else None
  │         desc = row[col_map.get("智能体说明")] if "智能体说明" in col_map else None
  ├─ 对照规划vs实际，生成"应测文件清单"
  └─ 从pack.yaml读取所有Orchestrator的chain字段定义
```

### Step 2: Agent测试
```
For each Agent:
  ├─ 读取SKILL.md
  ├─ 检查frontmatter字段完整性（name/purpose/domain/scenarios）
  ├─ 从scenarios字段提取业务场景列表，对照规划文档的"涉及业务场景"
  ├─ 检查三大章节是否存在（## Agent职责 / ## 可用Skill库 / ## 主业务流程）
  ├─ 检查Agent引用的Skill是否在目录中存在（pack_aligned验证）
  └─ 记录结果 → Agent测试表
```

### Step 3: Orchestrator Skill测试
```
⚠️ 关键：chain来源是pack.yaml，不是SKILL.md的handoffs
For each Orchestrator Skill（从pack.yaml的chain字段获取）:
  ├─ 从pack.yaml读取 chain: [skill-a, skill-b, ...] 字段
  ├─ 验证每个chain元素文件存在于 skills/<skill-id>/SKILL.md
  ├─ 检查是否有orphan skill（chain引用但文件不存在）
  ├─ 从SKILL.md读取handoffs字段（下游衔接声明，不等于chain）
  └─ 记录结果 → 编排链路验证表
```

### Step 4: 原子Skill测试
```
For each 原子Skill:
  ├─ 读取SKILL.md
  ├─ 检查frontmatter：name / description / purpose / inputs / outputs / handoffs
  ├─ 检查body章节：Purpose / **When_to_use** / Procedure / Quality Gates（四章节全部检测）
  ├─ 计算内容充实度评分（见方法5），确定A/B/C级
  ├─ 检查是否有嵌入式Python代码块
  └─ 记录结果 → Skill可用性评级表（A/B/C）
```

### Step 4b: 整改后复验（如执行多轮测试）
```
当执行第N轮测试时（N ≥ 2）：
  ├─ 对比上一轮报告的问题清单，标注每项的历史状态：
  │   · 已修复（本轮PASS）→ 在问题清单中标记"✅ 已修复"
  │   · 新发现（本轮FAIL，上轮未提及）→ 标记"🆕 新发现"
  │   · 遗留问题（本轮FAIL，上轮已标记）→ 标记"⚠️ 遗留"
  ├─ 统计每轮"已修复/新发现/遗留"数量，填入修复进度对比表
  └─ 确认问题总数是否收敛（每轮P1+P2总数应递减）
```

### Step 5: 生成问题清单
```
根据测试结果:
  ├─ P0（严重）：Skill文件缺失 / Agent文件缺失 / chain引用orphan skill / readiness定义与实际严重不符
  ├─ P1（一般）：缺少Purpose章节 / 缺少Procedure章节 / **已废弃Skill的Procedure缺失（降为可选修复）**
  └─ P2（建议）：**缺少When_to_use章节** / 内容充实度评分<50 / 格式不统一 / 建议补充代码示例
```

### Step 6: 生成验收测试报告（.docx）

**⚠️ 关键技术：必须使用 ZIP/XML patching，不能只用 python-docx**

当模板包含复杂的页眉/页脚 XML（表格+图片、交叉引用字段、自定义页脚）时，python-docx 无法保留这些格式。**正确方法：ZIP/XML patching**

```
技术原理：
1. 将模板 .docx 作为 ZIP 读取，保留 word/header1.xml、word/footer1.xml、word/media/ 等所有文件
2. 仅替换 word/document.xml 的内容（删除旧段落，插入新内容）
3. 重新打包为 .docx

python-docx 重建能力不足的原因：
• python-docx 无法读写 w:tbl 内嵌图片的页眉（o:spid、v:shape）
• python-docx 的页脚 PAGE/NUMPAGES 字段渲染不完整
• 自定义单元格宽度的表格页眉会丢失
```

**标准操作流程：**

```python
import zipfile, shutil, os
from lxml import etree
from io import BytesIO

TPL = "验收测试报告模板v1.0 2.docx"   # 模板文件
OUT = "输出报告_模板合规版.docx"

W = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'
def w(tag): return f'{{{W}}}{tag}'

# Step A: 读取模板全部文件（保留 header/footer/media）
with zipfile.ZipFile(TPL, 'r') as z:
    all_items = {n: z.read(n) for n in z.namelist()}

# Step B: 解析 document.xml，清空段落（保留 sectPr）
doc_tree = etree.fromstring(all_items['word/document.xml'])
body = doc_tree.find(f'.//{w("body")}')
for p in list(body.findall(w('p'))):  # 只删段落，不删表格和sectPr
    body.remove(p)

# Step C: 用 lxml 重建 document.xml 段落（见下方辅助函数）
def ap(text, font='微软雅黑', size=11, bold=False, align='left', sb=0, sa=0, firstLine=None):
    p = etree.Element(w('p'))
    pPr = etree.SubElement(p, w('pPr'))
    sp = etree.SubElement(pPr, w('spacing'))
    sp.set(w('line'), '360'); sp.set(w('lineRule'), 'auto')
    if sb: sp.set(w('before'), str(int(sb*20)))
    if sa: sp.set(w('after'), str(int(sa*20)))
    jc = etree.SubElement(pPr, w('jc'))
    jc.set(w('val'), 'left' if align=='left' else 'center' if align=='center' else 'both')
    if firstLine is not None:
        ind = etree.SubElement(pPr, w('ind')); ind.set(w('firstLine'), str(firstLine))
    if text:
        run = etree.SubElement(p, w('r'))
        rPr = etree.SubElement(run, w('rPr'))
        rf = etree.SubElement(rPr, w('rFonts'))
        for attr in ['ascii','hAnsi','eastAsia','cs']: rf.set(w(attr), font)
        sz = etree.SubElement(rPr, w('sz')); sz.set(w('val'), str(int(size*2)))
        szCs = etree.SubElement(rPr, w('szCs')); szCs.set(w('val'), str(int(size*2)))
        if bold: etree.SubElement(rPr, w('b'))
        t = etree.SubElement(run, w('t')); t.text = text
    body.append(p)

def blank(sb=0, sa=0):
    p = etree.Element(w('p'))
    pPr = etree.SubElement(p, w('pPr'))
    sp = etree.SubElement(pPr, w('spacing'))
    sp.set(w('line'), '360'); sp.set(w('lineRule'), 'auto')
    if sb: sp.set(w('before'), str(int(sb*20)))
    if sa: sp.set(w('after'), str(int(sa*20)))
    body.append(p)

# Step D: 添加内容（示例）
ap('Agent Skill 验收测试报告', font='微软雅黑', size=26, bold=True, align='center', sa=5)
ap('版本：v2.0　　测试日期：2026年8月2日', font='微软雅黑', size=11, align='center', sa=8)
ap('1 引言', font='微软雅黑', size=18, bold=True, sb=5, sa=3)
ap('1.1 测试目的', font='微软雅黑', size=16, bold=True, sb=3, sa=2)
ap('本次测试针对PMO领域的智能体（Agent）...', font='微软雅黑', size=11, firstLine=480, sa=3)

# Step E: 序列化并打包（仅替换 document.xml，保留所有其他文件）
new_doc_xml = etree.tostring(doc_tree, encoding='utf-8', xml_declaration=True)
out_buf = BytesIO()
with zipfile.ZipFile(out_buf, 'w', zipfile.ZIP_DEFLATED) as zout:
    for name, data in all_items.items():
        if name == 'word/document.xml':
            zout.writestr(name, new_doc_xml)   # 替换 document.xml
        else:
            zout.writestr(name, data)          # 保留 header/footer/media 等

with open(OUT, 'wb') as f:
    f.write(out_buf.getvalue())
```

**验收测试报告**（必须）：结构如下：
  1. 封面（测试版本/日期/范围/依据/结论）
  2. 测试概述（目的/范围/依据/方法）
  3. Agent测试结果（含评分表）
  4. Skill测试结果（A/B/C分级表）
  5. 编排链路验证结果（6条chain验证）
  6. 问题清单（P0/P1/P2分类明细）
  7. 专项测试结论（业务场景/接口/准确率）
  8. 整体测试总结与上线建议
  9. 审批签名栏

### Step 6b: 生成验收总结报告（.docx）

**同样使用 ZIP/XML patching**（方法同上），基于模板文件 `Agent Skill 验收总结报告模板v1.0 2.docx` 生成。

**验收总结报告**（必须）：基于测试结果生成配套总结报告，结构如下：
  1. 整体完成情况分析（Agent完成情况/Skill完成情况）
  2. Agent与Skill清单（含ID、类型、归属Agent、说明、完成情况）
  3. 验收测试情况（测试用例汇总表 + 附注指向验收测试报告）
  4. 资产归档情况（资产清单表：Agent/Skill/文档/模板）
  5. 市场情况（已签约/未来商机）
  6. 审批签名栏

**Agent清单字段：** 序号/Agent名称/Agent ID/Agent类型/涉及业务场景/完成情况/完成时间
**Skill清单字段：** Skill ID/Skill名称/技能描述/类型/主用Agent/完成情况
**资产归档字段：** 序号/资产名称/资产类型/文件位置/状态

### Step 6c: 生成解决方案售前材料（.pptx）

**售前PPT**（必须）：使用pptxgenjs生成配套演示文稿，7页标准结构：
  1. **封面**：标题/副标题/业务背景概述/关键数字（Agent数/Skill数/编排链路数/合规率）
  2. **能力总览**：4个Agent卡片 + Skill分类矩阵（8大类）
  3. **技术架构**：应用层→编排层→原子能力层三层分层图 + 关键技术指标
  4. **应用场景A**：项目启动与战略决策（流程步骤 + Skill引用）
  5. **应用场景B**：项目管控与风险监控（EVM监控/跨部门协调）
  6. **应用场景C**：执行与合规（报告生成/变更控制/供应商评估/Bank Compliance特色）
  7. **应用价值与优势**：效率提升/合规能力/决策质量/技术架构四项核心优势

**配色规范**：深蓝主色（#1E3A5F）+ 橙色强调色（#ED8936）+ 绿色辅助色（#38A169）
**尺寸**：LAYOUT_WIDE（13.3" × 7.5"）
**字体**：Microsoft YaHei + Consolas

### Step 7: 输出文件命名规范

| 文档 | 命名规范 |
|------|---------|
| 验收测试报告 | `{领域} Agent Skill 验收测试报告.docx` |
| 验收总结报告 | `{领域} Agent Skill 验收总结报告.docx` |
| 售前PPT | `{领域} Agent Skill 解决方案售前材料.pptx` |
| 验收测试案例集 | `{领域}_Agent_Skill_第N轮验收测试案例集.md` |
```

## Report Output Format（报告格式规范）

本技能输出**三份配套文档**，构成完整的BU验收材料包：

### 文档1：验收测试报告（.docx）
```markdown
# Agent Skill 验收测试报告
## 1. 测试概述（目的/范围/依据/方法）
## 2. 整体测试结果统计（三大维度用例数/通过率）
## 3. 详细测试结果分析（业务场景/接口/准确率）
## 4. 缺陷统计与整改情况（P0/P1/P2清单+回归结果）
## 5. 专项测试结论
## 6. 整体测试总结与上线建议
## 审批签名栏
```

### 文档2：验收总结报告（.docx）
```markdown
# Agent Skill 验收总结报告
## 1. 整体完成情况分析（Agent/Skill完成情况概述）
## 2. Agent与Skill清单（含ID/类型/归属/说明/完成情况）
## 3. 验收测试情况（汇总表+指向测试报告）
## 4. 资产归档情况（资产清单表）
## 5. 市场情况（已签约/未来商机）
## 审批签名栏
```

### 文档3：售前PPT（.pptx）
7页：封面→能力总览→技术架构→场景A→场景B→场景C→应用价值

---

**Agent评分表字段：** 测试项 / 结果 / 文件路径 / 亮点 / 缺失 / 综合评级

**Skill可用性评级：**
- 🟢 A级（可直接使用）：内容完整，含实际可执行代码
- 🟡 B级（框架可用）：框架完整，内容需增强
- 🟠 C级（方法论级）：偏方法论描述，实际调用需补充场景化内容
- 🆕 New（新合并Skill）：合并了多个旧Skill，方法完整
- ⚠️ Deprecated（旧Skill）：已被新Skill替代，需迁移

**问题编号规范：**
- P0-##：严重问题
- P1-##：一般问题
- P2-##：建议问题

## Quality Gates

- [ ] 覆盖规划文档中定义的100% Agent
- [ ] 覆盖规划文档中定义的100% Skill
- [ ] 每个Orchestrator的chain字段全部验证（无orphan引用）
- [ ] 问题清单包含所有发现的问题，无遗漏
- [ ] 报告中的评级与实际测试结果一致（无人工美化）
- [ ] 报告包含P0/P1/P2三级分类
- [ ] **三份文档全部生成**：验收测试报告(.docx) + 验收总结报告(.docx) + 售前PPT(.pptx)
- [ ] 报告输出为.docx格式，包含签名栏
- [ ] **报告使用ZIP/XML patching生成（保留模板页眉/页脚），非纯python-docx**
- [ ] **PPT使用深蓝(#1E3A5F)+橙色(#ED8936)配色，7页标准结构**
- [ ] **报告生成后必须执行"数据一致性校验"（见下方Step 6d），防止文字描述与表格数字矛盾**

### Step 6d: 报告数据一致性校验与修复（必须）

**⚠️ 常见缺陷：数字矛盾未被发现即发布**

生成验收测试报告后，**必须**执行以下交叉校验，防止文字描述与表格数字不一致的错误流式：

```
校验维度：
  1. 汇总表各行之和 = 合计行总数
     例：BA(52) + IA(30) + QA(111) + DA(2) + AG(X) = 总计
     若总计=205但AG行=10，实际AG检查点数=20，则：
       → 修正AG行：10→20
       → 修正总计：205→215

  2. 文字描述中的用例数与汇总表一致
     例：段落写"共10个用例"，但汇总表AG行=20
       → 段落应修正为"共20个用例"

  3. 详情表格行数与汇总表数字一致
     例：汇总表AG行=10，但详情表格有20行（4 Agent × 5字段）
       → 应将详情表格合并为4行（每Agent一行），或调整汇总表数字

  4. 缺陷统计表数字与正文描述一致
     例：正文写"P2共3个"，但缺陷表合计=0
       → 以缺陷表为准，修正正文

  5. 测试维度名称缩写一致
     BA=业务场景测试、IA=接口测试、QA=准确率测试、DA=废弃隔离测试、AG=Agent专项测试
```

**典型错误模式：**
- 汇总表AG行写10，详情表格有20行 → 应合并详情表格或修正AG行
- 某维度用例数改了但总计未同步 → 必须重新计算合计
- 正文写了旧版本数字（如205）但汇总表已更新 → 必须同步正文

**校验执行位置：** Step 6（生成报告）之后，Step 7（输出文件）之前

### Step 6e: 跨文档数字一致性修复（典型修复操作）

当校验发现数字矛盾后，按以下模式批量修复：

**模式CR-1：AG用例数纠正（汇总表+正文+详情表三处同步）**

典型场景：汇总表AG行写10，详情表格有20行（4 Agent × 5字段），正文多处写"共10个用例"。
```
修复步骤：
  1. 确定实际检查点数：4个Agent × 5个元数据字段 = 20个（而非10个）
  2. 修正汇总表AG行：总用例数/已执行/通过 三列全部从10改为20
  3. 修正详情表：20行逐字段展开 → 合并为4行（每Agent一行），避免再混淆
  4. 重新计算合计总数：旧合计+10 = 新合计
  5. 全文搜索"10个用例"+"AG"或"Agent专项测试"，全部替换为"20个用例"
  6. 全文搜索旧总数（如205），全部替换为新总数（如215）
```

```python
# 典型修复脚本逻辑
doc = Document(report_path)
total_row = doc.tables[0].rows[-1]  # 合计行
ag_row = [r for r in doc.tables[0].rows if 'Agent专项' in r.cells[0].text][0]

old_ag_count = int(ag_row.cells[1].text)  # 如10
actual_count = 4 * 5  # 4 Agent × 5字段 = 20
old_total = int(total_row.cells[1].text)  # 如205
new_total = old_total - old_ag_count + actual_count  # 205 - 10 + 20 = 215

# 更新AG行
ag_row.cells[1].text = str(actual_count)
ag_row.cells[2].text = str(actual_count)
ag_row.cells[3].text = str(actual_count)

# 更新合计行
total_row.cells[1].text = str(new_total)
total_row.cells[2].text = str(new_total)
total_row.cells[3].text = str(new_total)

# 更新正文所有"10个用例"(AG相关)和旧总数
for p in doc.paragraphs:
    if 'Agent专项测试' in p.text and '10个' in p.text:
        p.text = p.text.replace('共10个用例', f'共{actual_count}个用例')
    if old_total in p.text and '测试用例' in p.text:
        p.text = p.text.replace(str(old_total), str(new_total))
```

**模式CR-2：Skill规划数纠正（跨多份文档同步）**

典型场景：需求说明书/验收报告/总结报告中Skill数不统一（36 vs 37）。
```
修复原则：
  - pack.yaml中available数量为权威基准
  - 37个有效Skill = 6个Orchestrator + 31个Atomic available
  - 2个Deprecated不影响"有效Skill数"统计
  - "36个可用Skill"类描述应统一为"37个"

修复范围（可能涉及多份文档）：
  - 验收测试报告：测试范围段落、测试维度用例数
  - 验收总结报告：测试概况、资产归档数量
  - 需求说明书：建设目标、需求范围描述
  - 操作手册：Skill清单数量
```

**模式CR-3：历史轮次报告保护原则**

当校验发现历史轮次报告（如"第七轮验收测试报告"）存在数字矛盾时：
```
判断标准：
  - 文件名含"第N轮"或"vN.N"历史版本 → 不修改（保留历史快照）
  - 当前生效版本（如"PMO领域_Agent_Skill_验收测试报告.docx"无轮次后缀） → 必须修改

例外：
  - 若历史报告数字错误导致当前报告数字难以理解，可注明"历史报告数字存在记录错误"
  - 不建议对历史报告执行in-place修改，应通过勘误说明而非修改原文
```

**模式CR-4：配套文档同步修复**

当主报告（如验收测试报告）数字纠正后，配套文档（如验收总结报告）需同步更新：
```
需同步检查的配套文档（按依赖关系排序）：
  1. 验收总结报告 → 引用测试报告的用例总数和分类数
  2. 验收测试案例集.md → 引用报告中的用例编号和数量
  3. 规划清单.xlsx → Skill/Agent规划数与实际不符

同步修复原则：
  - 总结报告必须与测试报告数字完全一致（总分一致）
  - 案例集.md可独立存在，但编号应与报告匹配
  - 规划清单数字反映当前实际，应向实际实现对齐
```

## Failure Modes to Avoid

| 错误 | 说明 | 正确做法 |
|------|------|---------|
| ❌ 只测Tier A Skill，忽略Tier B/C | Tier B/C可能是核心Skill | 测试覆盖率必须100% |
| ❌ 问题降级（P1→P2） | 为了让报告"更好看"降低问题级别 | 严格按评级标准，问题即问题 |
| ❌ 用handoffs替代chain验证 | handoffs是下游衔接声明，chain是编排调用顺序 | 必须从pack.yaml读取chain字段作为权威来源 |
| ❌ 将B级Skill的P1问题降级为P2 | 有英文Procedure别名但字符数不足的Skill应定P1 | 严格按双轨规则，P1=章节存在但英文别名缺失，P2=内容充实度不足 |
| ❌ P0定级过宽 | 把仅缺英文别名的B级Skill标为P0 | P0仅限文件缺失、orphan引用、readiness不符；中文Procedure存在时为P1 |
| ❌ 检查SKILL.md的readiness字段 | readiness定义在pack.yaml，不在SKILL.md | 从pack.yaml的skill_readiness_summary获取 |
| ❌ 中文章节仅有英文别名标题但无实质内容 | 如`## Purpose\n（本章节英文名为...）`只有标题引用，无实际Purpose内容 | 需额外验证章节内容长度≥50字，且内容与章节标题语义一致 |
| ❌ 测试用例ID命名不统一 | BA/IA/QA等前缀混用导致统计困难 | 统一前缀规则：BA=业务场景测试，IA=接口测试，QA=准确率测试，DA=废弃隔离测试 |
| ❌ 验收测试报告与测试案例集版本不对齐 | 测试报告说30个用例，案例集说0个 | 每轮测试同步更新案例集版本号（如v1.1），报告引用对应版本 |
| ❌ 检查PMO Skill的purpose字段 | PMO Skill的frontmatter使用 `description:` 而非 `purpose:` | frontmatter的 `description:` 字段应视为purpose等效（+20分），不影响内容充实度评分；章节检测以 `## Purpose` 英文章节为准即可 |
| ❌ 检查Agent的独立trigger词 | PMO Agent触发机制是scenarios字段，不是trigger词 | 验证scenarios字段覆盖规划场景即可 |
| ❌ 报告无签名栏 | 报告无法正式归档 | 必须包含审批签名栏 |
| ❌ Agent frontmatter检查domain字段 | PMO Agent的frontmatter有name/purpose/scenarios，但**无domain字段** | PMO Agent frontmatter正确字段：name / purpose / scenarios（不含domain） |
| ❌ Agent SKILL.md frontmatter解析错误 | PMO Agent SKILL.md包含**两个**`---`分隔符：第一个是frontmatter边界，第二个是body内章节分隔符 | 解析器必须在遇到第一个markdown标题行（`# `或`## `）时停止，而不是找第二个`---` |
| ❌ 硬编码xlsx列索引 | 如`row[6]`、`row[7]`——不同版本的xlsx列数不同，会导致IndexError | 必须先读取第1行列头建立col_map，再用`col_map["列名"]`按名取值；缺失列返回None |
| ❌ python-docx vs ZIP/XML patching选择 | 强制ZIP/XML导致代码复杂，而简单报告python-docx完全够用 | **优先python-docx**（表格+段落）；若发现模板含嵌入图片的页眉/交叉引用字段/PAGE字段，再降级ZIP/XML patching |
| ❌ lxml命名空间前缀问题 | lxml序列化后输出`ns0:tag`而非`w:tag`，导致Word无法识别 | 始终使用`etree.Element(f'{{{W}}}tag')`格式；验证：`grep 'ns0:' output.docx` |
