---
name: "wbs-schedule-milestone-orchestrator"
pack: "project-management-pack"
display_name: "WBS进度里程碑编排"
description: "编排完整规划链条：WBS分解→进度排序→里程碑规划，确保项目从立项到执行的规划工作有序衔接，支持大型银行IT项目的集成规划。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
handoffs: ["wbs-builder", "schedule-sequencer", "milestone-planner"]
---
wbs-schedule-milestone-orchestrator

## Purpose


WBS-排程-里程碑编排 Skill 将项目工作分解、进度排序与里程碑规划串联为完整规划链条，确保从立项到执行的规划工作有序衔接、可追溯。
## When to use

Use this skill when:
- A new project or major phase is initiating
- Creating integrated project plans (WBS + Schedule + Milestones)
- Planning phase of a banking core modernization program
- A project needs a three-layer planning framework (L1/L2/L3)
- Project kickoff or Stage-Gate planning

This is the **primary planning orchestrator** for the PMO domain. It chains three foundational skills into one end-to-end planning workflow:

```
wbs-builder → schedule-sequencer → milestone-planner
     ↓              ↓                   ↓
  WBS分解       进度排序            里程碑规划
     ↓              ↓                   ↓
  任务分解       三层计划           阶段门定义
  交付物映射     关键路径           评审准则
     └──────────────┴────────────────────┘
                    ↓
           项目主计划管理包 (Planning Package)
```

**When to trigger this skill:**
- A new banking program/sub-project is initiated
- An existing project needs a full plan rebuild (baseline change, major scope change)
- PMO needs to produce a complete planning package for SCCB approval

**This skill does NOT replace** the individual child skills — it orchestrates them sequentially, passing context between each stage. After this orchestrator runs, you still invoke the child skills individually for updates and changes.

---

## Input Schema

### Required Inputs

| Field | Description | Example |
|-------|-------------|---------|
| `project_name` | Full project name | "某银行新一代核心系统建设项目" |
| `project_objective` | Business goal + go-live date | "2026年12月31日前完成新核心系统投产，支持银行业务开业" |
| `scope_statement` | High-level scope description | "涵盖存款、贷款、结算、核算四大业务线，包括核心、渠道、外围共30+系统" |
| `phase_structure` | Phase definition (or use default) | "需求分析→系统设计→开发联调→测试验证→上线投产→收尾关闭" |
| `go_live_date` | Fixed target date (YYYY/MM/DD) | "2026/12/31" |
| `team_context` | Work groups, team structure, vendor info | "核心系统组(10人)/外围改造组(8人)/数据迁移组(5人)/测试组(12人)" |

### Optional Inputs

| Field | Description | Default |
|-------|-------------|---------|
| `constraints` | Constraint Register entries | [] |
| `assumptions` | Assumption Register entries | [] |
| `hard_dependencies` | External hard constraints (regulatory windows, third-party dates) | [] |
| `blackout_periods` | 年终决算、季度结息等禁止作业期 | [年终决算: 12月25-31日] |
| `resource_calendar` | Resource availability and limits | Based on team_context |

---

## 信息采集（Step 0 — WBS进度里程碑编排前的上下文检查）

> ⚠️ **执行前必读**：本编排Skill需要明确项目目标和范围基线。信息缺失时应主动采集，而非直接执行编排流程。

### Step 0.1 — 项目上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目名称 | 请告知 | 标注 `[假设值-请核对]` |
| 项目目标（投产日期） | 请告知 | 标注 `[假设值-请核对]` |
| 范围基线 | 请告知 | 标注 `[假设值-请核对]` |
| 团队结构 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 前置条件检查

| 前置条件 | 检查项 | 未就绪时的处理 |
|---------|--------|--------------|
| 项目章程/范围基线 | 是否有已批准的范围基线？ | 先调用 `project-charter-writer` |
| 治理架构 | 组织架构是否已定义？ | 先调用 `org-structure-builder` |
| 初始风险 | 是否有初始风险清单？ | 先调用 `risk-register-builder` |

### Step 0.3 — 数据采集问题

**请逐项回答（已知的跳过，直接告知）：**

1. **项目基本信息**：项目名称、类型、投产目标日？
2. **范围基线**：包含哪些系统/子系统？有哪些明确的排除项？
3. **团队结构**：核心组/外围组/PMO人数，供应商？
4. **硬性约束**：监管报送截止日、人行接口窗口、禁止作业期？

### Step 0.4 — 数据确认

```
📊 WBS进度里程碑编排 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目名称 | ✅/⚠️/❓ | [名称] |
| 投产日期 | ✅/⚠️/❓ | [日期] |
| 范围基线 | ✅/⚠️/❓ | [摘要] |
| 团队结构 | ✅/⚠️/❓ | [人数] |

请确认后"开始编排"，我将基于项目目标驱动完整规划链。
═══════════════════════════════════════════
```

---

## Orchestration Procedure

## Procedure

> **Procedure** — This skill follows the **Orchestration Procedure** defined below. For execution, follow the numbered steps in that section.

### Stage 1 — WBS Decomposition (调用 wbs-builder)

**Action:** Invoke `wbs-builder` with the following enriched context:

```
INPUTS传递给wbs-builder:
- scope: scope_statement（来自 org-structure-builder 的范围基线，如有）
- deliverables: 从scope_statement推导的高层交付物清单
- constraints: constraints列表（含硬依赖时间窗口）
- team_context: 团队结构 + vendor合同信息

WBS分解要求:
1. Phase层（Level 1）：必须与phase_structure一致
2. Level 2：按 subsystem × work_group 交叉组织
3. Level 3：每个工作包 ≤ 5人天（最佳），最大不超过10人天
4. 命名规范：动词+名词（如"组织需求评审会议"而非"需求评审"）
5. 每个Level 3工作包必须：指定执行人、前置任务、交付物、估算工时
```

**输出:** WBS Register（含所有Level 1/2/3条目，统计总工时）

**Gate检查:**
- [ ] 总工作包数量在合理范围（大型银行项目通常200-500个工作包）
- [ ] 各Phase工时分布合理（测试验证阶段通常占总工时35-45%）
- [ ] 外部依赖工作包已识别并排在早期窗口

---

### Stage 2 — Schedule Sequencing (调用 schedule-sequencer)

**Action:** 将Stage 1的WBS输出作为输入，调用 `schedule-sequencer`:

```
INPUTS传递给schedule-sequencer:
- WBS: 完整WBS Register（包含Level 3工作包及所有字段）
- 硬依赖时间窗口: hard_dependencies（含人行接口窗口、监管报送截止日）
- 禁止作业期: blackout_periods
- 资源约束: resource_calendar

排程要求:
1. 投产日期(go_live_date)已锁定 → 使用倒排逻辑
2. 识别关键路径（标注为⭐）
3. SCCB评审节点必须标记
4. Phase Gate的准入/准出节点必须标记
5. 硬依赖（监管窗口、开业目标）不得安排在禁止作业期
```

**输出:** 三层计划体系（L1里程碑计划/L2项目主计划/L3详细计划）+ 关键路径分析

**Gate检查:**
- [ ] 关键路径浮动时间 > 0（倒排可行性验证通过）
- [ ] 硬依赖已正确建模为FS依赖且无浮动
- [ ] L1里程碑数量在8-12个之间（项目群管理粒度）
- [ ] SCCB评审节点已识别并标注

---

### Stage 3 — Milestone Planning (调用 milestone-planner)

**Action:** 将Stage 2的三层计划输出作为输入，调用 `milestone-planner`:

```
INPUTS传递给milestone-planner:
- 项目目标: project_objective（含开业目标）
- 主要交付物: L1/L2计划中的外部交付物清单
- 评审/审批节点: L1里程碑计划中的评审类节点
- 目标日期/窗口: go_live_date + hard_dependencies

里程碑规划要求:
1. 决策类/交付类/评审类/发布类四类齐全
2. 每个评审类里程碑有量化准入/准出KPI
3. KPI阈值在规划阶段与业务BA初步确认
4. 评审会议排期与SCCB日程对齐
```

**输出:** 完整里程碑计划（含各里程碑Entry/Exit Criteria、KPI Tracker）

**Gate检查:**
- [ ] M00立项和M99关闭两个边界里程碑存在
- [ ] 测试阶段里程碑（M40/M50/M60/M70）有量化KPI
- [ ] 每个里程碑有明确责任组/负责人

---

### Stage 4 — Integration & Validation

**Action:** 整合三个阶段的输出，验证一致性，生成《项目主计划管理包》:

```
整合检查清单:
□ WBS中的Phase划分 = Schedule中的L1层级 = Milestone中的阶段归属
□ WBS总工时 与 Schedule中EV基线 一致
□ Schedule中关键路径任务全部映射到Milestone的交付类/评审类节点
□ Milestone中的KPI阈值 与 Schedule中的测试阶段质量要求 一致
□ 所有SCCB评审节点在Schedule中有对应任务，在Milestone中有对应评审类里程碑
```

---

## Planning Package Output

The orchestrator produces a single **《项目主计划管理包》** consisting of:

### 1. WBS分解文档
- WBS统计概览（按Phase汇总工时、工作包数）
- WBS明细表（Level 1/2/3完整清单）
- 外部交付物清单（含审批人、计划日期）
- 需近期细化的任务清单（未来2周内开始但细化不足）

### 2. 三层计划体系
- L1里程碑计划（项目群/月度视角）
- L2项目主计划（子项目/周视角）
- L3详细计划（人/天视角）
- 关键路径分析（含浮动时间分析）
- 外部硬依赖时间窗口表

### 3. 里程碑计划
- 里程碑总览（12个标准里程碑）
- 各里程碑详情（Entry/Exit Criteria、KPI阈值、评审材料清单）
- KPI Tracker（含当前值和状态灯）
- 评审会议排期

### 4. 基准数据（移交下游Skill）
| 移交Skill | 移交数据 |
|-----------|---------|
| earned-value-tracker | L1里程碑的PV值（计划价值），BAC总计，EV基线 |
| risk-register-builder | 关键路径风险、硬依赖风险、资源争用风险 |
| cost-estimation-helper | WBS各Phase工时汇总、资源费率假设 |
| org-structure-builder | 项目组织架构（汇报关系与WBS执行组织对应） |

---

## Quality Gates

- [ ] All three child skills have been invoked in sequence (wbs-builder → schedule-sequencer → milestone-planner)
- [ ] The three-layer schedule (L1/L2/L3) is internally consistent (L1 = aggregation of L2 = aggregation of L3)
- [ ] Go-live date is achievable: back-scheduling shows positive float on critical path
- [ ] All hard dependencies (regulatory windows, go-live) are modeled with zero float
- [ ] Every Level 3 work package has: owner, duration ≤ 10 days, predecessor, at least one deliverable
- [ ] SCCB review points are explicitly marked in both the schedule and the milestone plan
- [ ] The Planning Package can be presented to SCCB as a complete, self-contained planning artifact

## Failure Modes

| Failure Mode | Detection | Fix |
|-------------|-----------|-----|
| Back-scheduling reveals negative float | 关键路径浮动时间 < 0 | Apply crashing (压缩关键路径) or negotiate go-live date adjustment with SCCB |
| WBS work packages too large | Any Level 3 > 10 days | Break into smaller units before scheduling |
| Milestone Exit Criteria are vague | KPI thresholds missing numbers | Force quantification: 缺陷密度≤X, 覆盖率≥Y% |
| Inconsistent phase names across outputs | WBS Phase ≠ Schedule Phase ≠ Milestone Phase | Standardize to a single phase naming convention before output |
| Missing SCCB review points | No 🔴SCCB标记 in schedule | Add SCCB review triggers for: 范围变更>10%, 里程碑延期>5天, 预算调整 |

## Handoff Targets

| 下游Skill | 触发时机 | 交接内容 |
|-----------|---------|---------|
| earned-value-tracker | 计划基线发布后 | BAC、PV基线（按里程碑分解）、SPI/CPI基线 |
| risk-register-builder | 计划基线发布后 | 关键路径风险清单、硬依赖风险、资源风险 |
| cost-estimation-helper | WBS完成后 | 各Phase工时汇总、资源费率假设 |
| org-structure-builder | 项目启动时 | 项目治理结构（指导委员会/PMO/执行组） |

## Example Invocation

```
# Trigger the orchestrator with a new banking core modernization project
skill_invoke("wbs-schedule-milestone-orchestrator", {
    "project_name": "某银行新一代核心系统建设项目",
    "project_objective": "2026年12月31日前完成新核心系统投产，支持银行按时开业",
    "scope_statement": "涵盖存款、贷款、结算、核算四大业务线，包括核心系统及30+外围配套系统",
    "go_live_date": "2026/12/31",
    "phase_structure": "需求分析→系统设计→开发联调→测试验证→上线投产→收尾关闭",
    "team_context": "核心系统组(10人)/外围改造组(8人)/数据迁移组(5人)/测试组(12人)/PMO(4人)",
    "hard_dependencies": [
        {"type": "监管报送", "system": "人行利率报备系统", "window": "2026/09/30"},
        {"type": "接口规范", "system": "人行支付系统", "lock_date": "2026/06/30"},
        {"type": "开业目标", "date": "2026/12/31"}
    ],
    "blackout_periods": [
        {"name": "年终决算", "start": "2026/12/25", "end": "2026/12/31"},
        {"name": "季度结息", "dates": ["2026/03/31", "2026/06/30", "2026/09/30"]}
    ]
})
```
