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
| **内容充实度** | 基于字符数、章节数、代码块进行A/B/C评级 | 评级与内容一致 |

## Test Method（测试方法）

### 方法1：文件审查（章节检测含大小写/中文别名）

**核心原则：章节别名双轨规则**

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

     Required "Purpose" section:
       ## Purpose (canonical)
       ## Overview
       ⚠️ 中文章节 ## 目的 必须附带英文别名 ## Purpose 才算通过

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

### 方法3：规划文档读取（xlsx多sheet）
```
规划文档格式为xlsx，包含三页：
  - Sheet "Agent"：Agent名称/说明/业务领域/涉及业务场景/所属部门/开发进度
  - Sheet "Skill"：Skill ID/名称/类型/技能描述/业务场景应用支撑说明/来源/覆盖状态/依赖脚本/备注
  - Sheet "Skill视图"：Skill/Agent矩阵（主用/调用关系）
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
  ├─ 使用openpyxl读取规划文档xlsx的Agent/Skill/Skill视图三页
  │   Agent sheet: 序号/智能体名称/智能体说明/业务领域/涉及业务场景/所属部门/预计开发完成时间/开发进度
  │   Skill sheet: 序号/Skill ID/Skill名称/Skill类型/技能描述/业务场景应用支撑说明/来源/覆盖状态/关联产品/知识来源/依赖脚本/备注/所属部门/预计开发完成时间/开发进度
  │   Skill视图 sheet: Skill/Agent矩阵（主用/调用关系）
  ├─ 扫描技能包 skills/ 目录，确认实际存在的Skill列表
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

**验收测试报告**（必须）：使用python-docx生成报告，结构如下：
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
- [ ] **PPT使用深蓝(#1E3A5F)+橙色(#ED8936)配色，7页标准结构**

## Failure Modes to Avoid

| 错误 | 说明 | 正确做法 |
|------|------|---------|
| ❌ 只测Tier A Skill，忽略Tier B/C | Tier B/C可能是核心Skill | 测试覆盖率必须100% |
| ❌ 问题降级（P1→P2） | 为了让报告"更好看"降低问题级别 | 严格按评级标准，问题即问题 |
| ❌ 用handoffs替代chain验证 | handoffs是下游衔接声明，chain是编排调用顺序 | 必须从pack.yaml读取chain字段作为权威来源 |
| ❌ 将B级Skill的P1问题降级为P2 | 有英文Procedure别名但字符数不足的Skill应定P1 | 严格按双轨规则，P1=章节存在但英文别名缺失，P2=内容充实度不足 |
| ❌ P0定级过宽 | 把仅缺英文别名的B级Skill标为P0 | P0仅限文件缺失、orphan引用、readiness不符；中文Procedure存在时为P1 |
| ❌ 检查SKILL.md的readiness字段 | readiness定义在pack.yaml，不在SKILL.md | 从pack.yaml的skill_readiness_summary获取 |
| ❌ 期望PMO Skill有嵌入式Python代码 | PMO领域skill通常依赖外部Python脚本而非嵌入式代码 | 检查依赖脚本可用性，不执行业务代码 |
| ❌ 检查Agent的独立trigger词 | PMO Agent触发机制是scenarios字段，不是trigger词 | 验证scenarios字段覆盖规划场景即可 |
| ❌ 报告无签名栏 | 报告无法正式归档 | 必须包含审批签名栏 |
| ❌ Agent frontmatter检查domain字段 | PMO Agent的frontmatter有name/purpose/scenarios，但**无domain字段** | PMO Agent frontmatter正确字段：name / purpose / scenarios（不含domain） |
| ❌ Agent SKILL.md frontmatter解析错误 | PMO Agent SKILL.md包含**两个**`---`分隔符：第一个是frontmatter边界，第二个是body内章节分隔符 | 解析器必须在遇到第一个markdown标题行（`# `或`## `）时停止，而不是找第二个`---` |
