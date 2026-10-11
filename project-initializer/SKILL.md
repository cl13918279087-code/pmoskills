---
name: "project-initializer"
display_name: "项目初始化与信息库构建"
description: "在新项目启动时，一次性读取项目源文档（章程/合同/需求文档等），构建项目信息库并建立Skill执行框架。所有PMO Skill执行前必须先查询信息库，实现信息一次采集、全项目共享。"
author: PMO-BUCON
version: "v1.0.0"
tags:
  - 项目初始化
  - 信息管理
  - PMO
  - 持久化
  - 信息库
---

# 项目初始化与信息库构建 (Project Initializer)

## Purpose

在项目启动阶段，将散落的项目源文档（项目章程、合同、会议纪要、需求文档等）转换为结构化的**项目信息库**，供后续所有Skill运行时查询使用。

**核心价值**：
- 项目信息一次性采集，所有Skill共享，消除重复采集
- 信息来源可追溯，版本受控
- Skill执行前自动检查信息完整性，缺失即标记`[待采集]`
- 为Orchestrator编排提供可信赖的数据底座

## When to use this skill

**在新项目启动时使用**，或在以下场景触发：
- 新项目立项，需要构建项目信息库
- 新Skill执行前，信息库尚不存在或信息不完整
- 项目重大里程碑完成（如需求冻结、架构评审），需更新信息库
- 项目收尾，将信息库归档至知识库

## Expected Inputs

| Input | Description | Example |
|-------|-------------|---------|
| project_name | 项目名称 | "A行新核心系统升级改造项目监理" |
| source_documents | 源文档路径列表 | ["/path/to/charter.md", "/path/to/contract.pdf"] |
| project_type | 项目类型 | "银行核心系统升级改造（监理）" |
| domain | 领域（决定信息库结构） | "PMO" / "IT" / "金融" |

## Operating Procedure

### Step 1 — 扫描源文档，建立文档清单

读取所有提供的项目源文档，提取文本内容，记录每份文档的：
- 文件名、类型（charter/contract/meeting minutes/requirements）
- 关键信息摘要（项目名称/工期/客户/金额等）
- 与信息类目的映射关系

**输出**: `source_document_inventory.yaml`

```yaml
source_documents:
  - filename: "项目章程_v1.0.md"
    type: "charter"
    size_bytes: 12066
    key_info:
      project_name: "A行新核心系统升级改造项目"
      duration_months: 14
      client: "A行（城商行）"
      start_date: "2026年8月"
    info_categories: ["project_config", "project_background", "org_structure", "phases", "milestones", ...]
```

### Step 2 — 提取信息，分类存入YAML

从源文档中提取信息，按以下13个标准信息类目分类存储：

| # | 信息类目 | 描述 | 典型来源 |
|---|---------|------|---------|
| 1 | project_config | 项目基础配置 | 章程 |
| 2 | project_background | 项目背景与目标 | 章程 |
| 3 | project_scope | 范围（In/Out Scope） | 章程 |
| 4 | org_structure | 组织架构 | 章程 |
| 5 | phases | 阶段规划 | 章程 |
| 6 | milestones | 里程碑清单 | 章程 |
| 7 | deliverables | 交付物清单 | 章程 |
| 8 | constraints | 约束条件 | 章程 |
| 9 | assumptions | 关键假设 | 章程 |
| 10 | success_criteria | 成功衡量标准 | 章程 |
| 11 | top_risks | 主要风险 | 章程 |
| 12 | communication | 沟通管理机制 | 章程 |
| 13 | pending_matters | 待明确事项 | 章程 |

每个类目存储为独立YAML文件，格式：`{类目ID}_{类目名称}.yaml`

### Step 3 — 构建信息库索引

创建 `information_registry.yaml`（信息项索引）：

```yaml
information_items:
  project_config:
    source_file: "01_project_config.yaml"
    description: "项目基础配置（ID/类型/工期/客户）"
    used_by: ["all"]
    data_completeness: "完整/部分缺失/[待采集]"
    last_updated: "2026-08-02"
  milestones:
    source_file: "06_milestones.yaml"
    description: "14个里程碑（ID/名称/类型/日期/责任人）"
    used_by: ["milestone-planner", "earned-value-tracker", "schedule-sequencer"]
    data_completeness: "完整"
    last_updated: "2026-08-02"
```

### Step 4 — 构建Skill信息需求矩阵

创建 `skill_info_needs.yaml`：

```yaml
skill_info_needs:
  milestone-planner:
    description: "银行业务里程碑规划系统"
    mandatory_inputs: ["phases", "milestones", "project_scope", "org_structure"]
    optional_inputs: ["success_criteria", "communication"]
    prerequisite_skill: "project-info-manager"
    outputs: ["里程碑规划报告"]
    data_from_library: ["phases.yaml", "milestones.yaml", ...]
    missing_data: []
    info_status: "完整"
  wbs-builder:
    mandatory_inputs: ["project_scope", "deliverables", "phases"]
    data_from_library: [...]
    missing_data: ["业务优先级清单"]
    info_status: "部分缺失"
```

### Step 5 — 输出信息库完整性报告

```
✅ 项目信息库构建完成 — <项目名称>
═══════════════════════════════════════════════════════

📁 信息库路径: <项目根目录>/.项目信息库/
📊 信息项总数: 13类
✅ 完整信息项: X项
⚠️ 部分缺失: Y项（见下方）
❌ 完全缺失: Z项

✅ 完整信息项（可直接供给Skill）:
  • project_config      • project_background  • project_scope
  • org_structure       • phases              • milestones
  • constraints         • assumptions         • top_risks
  • communication

⚠️ 部分缺失信息项（Skill执行前需补充）:
  • pending_matters → 待行方提供监管要求/安全定级
  • milestones → 缺少实际完成日期（项目启动后更新）

❌ 完全缺失信息项（需主动采集）:
  • EVM基线数据 → earned-value-tracker需要，项目启动后由PMO录入

═══════════════════════════════════════════════════════
```

### Step 6 — 初始化project-info-manager（如不存在）

检查`project-info-manager` Skill是否存在，如不存在则创建标准版本。
确保所有Skill执行前都会先调用`project-info-manager`查询信息库。

## Deliverables

| 交付物 | 文件名 | 说明 |
|-------|--------|------|
| 信息库主目录 | `.项目信息库/` | 项目根目录下隐藏目录 |
| 信息库索引 | `information_registry.yaml` | 所有信息项的清单和状态 |
| Skill需求矩阵 | `skill_info_needs.yaml` | 16+个Skill的信息需求和满足状态 |
| 信息库README | `README.md` | 目录结构说明和使用指南 |
| 13个信息类目文件 | `{ID}_{类目}.yaml` | 结构化项目信息 |
| 信息库完整性报告 | `<项目名>_信息库完整性报告.md` | 人读的报告 |

## Quality Gates

- [ ] 源文档清单完整，无遗漏的文档类型
- [ ] 13个标准信息类目全部生成（即使为空也有文件框架）
- [ ] `information_registry.yaml`与实际文件一一对应
- [ ] `skill_info_needs.yaml`覆盖所有计划执行的Skill
- [ ] 缺失信息明确标注`[待采集]`，无信息凭空生成
- [ ] 信息库目录约定在`README.md`中明确说明
- [ ] `project-info-manager` Skill已就位

## 信息库目录约定

```
<项目根目录>/
└── .项目信息库/
    ├── README.md                      # 索引+使用说明
    ├── information_registry.yaml      # 信息项索引（自动维护）
    ├── skill_info_needs.yaml          # Skill需求矩阵
    ├── source_document_inventory.yaml # 源文档清单
    ├── 01_project_config.yaml         # 项目基础配置
    ├── 02_project_background.yaml     # 项目背景与目标
    ├── 03_project_scope.yaml          # 项目范围
    ├── 04_org_structure.yaml          # 组织架构
    ├── 05_phases.yaml                 # 阶段规划
    ├── 06_milestones.yaml             # 里程碑清单
    ├── 07_deliverables.yaml           # 交付物清单
    ├── 08_constraints.yaml            # 约束条件
    ├── 09_assumptions.yaml            # 关键假设
    ├── 10_success_criteria.yaml       # 成功衡量标准
    ├── 11_top_risks.yaml              # 主要风险
    ├── 12_communication.yaml          # 沟通管理机制
    └── 13_pending_matters.yaml        # 待明确事项
```

## 与其他Skill的协作关系

```
project-initializer（项目初始化）
    │
    ├─→ 构建 .项目信息库/（13个YAML文件）
    │
    ├─→ 创建/确认 project-info-manager Skill
    │
    └─→ 后续所有Skill执行流程：
            Skill执行请求
                 │
                 ▼
        project-info-manager
        (查询信息库完整性)
                 │
          ┌──────┴──────┐
          ▼             ▼
       ✅信息完整     ⚠️信息缺失
          │             │
          ▼             ▼
       执行Skill    标注[待采集]
                      │
                      ▼
                 用户补充采集
                      │
                      ▼
               写入信息库
                      │
                      ▼
               执行目标Skill
```

## 典型触发场景

| 场景 | 触发条件 | 输出 |
|------|---------|------|
| 新项目立项 | 用户提供章程/合同等源文档 | 完整信息库 + skill_info_needs.yaml |
| 新Skill上线 | 新Skill需要项目信息但信息库不存在 | 补充缺失信息类目 |
| 项目重大里程碑 | 需求冻结/架构评审完成 | 更新对应信息类目文件 |
| 项目收尾 | 项目关闭报告编写前 | 归档信息库至知识库 |
| 信息库检查 | 用户要求检查信息库完整性 | information_registry.yaml 状态报告 |

## Failure Modes to Avoid

- **不完整采集**：只采集部分信息类目，导致后续Skill执行时频繁缺失信息
- **不建立索引**：有信息文件但没有`information_registry.yaml`，无法快速定位信息状态
- **凭空生成信息**：缺失信息不标注`[待采集]`，而是用假设值填充，导致后续输出不准确
- **信息库位置不规范**：不放在`.项目信息库/`目录，导致无法被其他Skill自动发现
- **跳过skill_info_needs.yaml**：不建立Skill需求矩阵，缺失信息无法提前预警

## 与orchestrator-skill-authoring的关系

`project-initializer`是所有编排Skill的**前置基础设施**。编排Skill（如`wbs-schedule-milestone-orchestrator`、`strategy-charter-orchestrator`）在执行前应确认信息库已就绪。

编排Skill的数据流应基于信息库，而非点对点传递：
```
旧模式: Skill A → Skill B（数据通过临时变量传递）
新模式: Skill A/B 都读/写 信息库（持久化共享）
```
