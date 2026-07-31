---
name: "strategy-charter-orchestrator"
pack: "project-management-pack"
display_name: "战略决策编排"
description: "编排从战略决策到执行的完整链条：战略决策 facilitation → 项目章程写作 → 里程碑规划 → WBS分解 → 进度计划，支持重大战略项目的端到端启动。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
handoffs: ["strategy-decision-facilitation", "project-charter-writer", "org-structure-builder"]
---
strategy-charter-orchestrator

## Purpose

## When to use

Use this skill when:
- A new strategic initiative or project requires approval
- High-level decision facilitation is needed
- Project charter needs to be generated from strategic context
- Organization structure needs to be designed for a new program
- Strategic planning and project initiation phase

This is the **strategic decision to project launch orchestrator** for the PMO domain. It chains two skills into one决策-to-执行 workflow:

```
strategy-decision-facilitation ──→ project-charter-writer
              ↓                           ↓
       战略决策推动                    项目章程编写
       (问题界定→方案评估→共识)         (.docx生成)
              ↓                           ↓
       决策分析报告                   项目章程(.docx)
              │                           │
              └────────────┬──────────────┘
                           ↓
              ┌─────────────────────┐
              │  项目启动管理包      │
              │ (决策报告+章程+规划) │
              └─────────────────────┘
                           │
                           ▼
              ┌─────────────────────┐
              │ wbs-schedule-       │
              │ milestone-          │
              │ orchestrator        │
              └─────────────────────┘
```

**When to trigger this skill:**
- A new banking program needs to be initiated after a strategic investment decision
- Executive leadership requests analysis of a major strategic direction (technology stack, build-vs-buy, market entry)
- A cross-functional strategic decision requires stakeholder alignment and documentation
- A project charter needs to be generated from an approved strategic decision
- Project initiation requirements (terms of reference / project charter) are triggered

**Note:** If a strategic decision has ALREADY been made externally (e.g., board approval), you can invoke `project-charter-writer` directly with the decision outcome and skip Stage 1.

---

## Orchestration Procedure

## Procedure

> **Procedure** — This skill follows the **Orchestration Procedure** defined below. For execution, follow the numbered steps in that section.

### Stage 1 — Strategic Decision Facilitation (调用 strategy-decision-facilitation)

**When to invoke:** The strategic question is still open and needs structured analysis.

**When to SKIP this stage:** The decision has already been made at executive level (board approval, regulatory mandate, business commitment). Proceed directly to Stage 2 with the decision outcome.

**Action:** Invoke `strategy-decision-facilitation`:

```
INPUTS传递给strategy-decision-facilitation:
- 战略问题: 核心决策问题（需要明确回答是/否，或选择方案）
- 干系人立场: 各关键干系人的立场和关切
- 业务背景: 项目背景、战略环境、约束条件
- 决策标准: 评估维度及其权重建议
- 决策时间框架: 是否有硬性截止日期

决策推动要求:
1. 完整执行5阶段决策框架：
   Phase 1: 问题界定 — 核心问题具体化、决策边界明确
   Phase 2: 选项生成 — 至少3个实质性备选方案
   Phase 3: 分析评估 — 评估矩阵、敏感性分析、风险评估
   Phase 4: 共识构建 — 干系人协调、冲突解决
   Phase 5: 文档化 — 决策报告、决策建议书
2. 输出：决策分析报告（含选项对比矩阵、风险评估、干系人对齐摘要）
3. 推荐方案：有明确依据的推荐选择
```

**输出:** 决策分析报告（Phase 1-5全套）

**Gate检查:**
- [ ] 至少3个实质性备选方案（含基准对比）
- [ ] 评估矩阵有量化权重和评分
- [ ] 敏感性分析完成（标准权重±20%）
- [ ] 干系人立场有记录，共识或分歧有说明
- [ ] 决策建议有明确依据

---

### Stage 2 — Project Charter Generation (调用 project-charter-writer)

**Action:** Invoke `project-charter-writer` with enriched context from Stage 1:

```
INPUTS传递给project-charter-writer:
- 项目名称: 基于决策内容确定
- 项目目标: 来自决策结论中的目标陈述
- 范围描述: 
  * 包含范围（In Scope）：来自决策报告中的推荐方案范围
  * 排除范围（Out of Scope）：来自决策报告中的排除项
- 干系人: 来自决策报告中的关键干系人清单
- 约束条件:
  * 预算约束：来自决策报告中的投资限额
  * 时间约束：来自决策报告中的开业/投产目标
  * 资源约束：来自决策报告中的资源假设
- 成功标准: 来自决策报告中的评估标准和权重

章程编写要求:
1. 项目背景：与战略决策报告中的业务背景一致
2. 项目目标：与战略决策结论严格对应（不添加/不删减）
3. 范围边界：直接引用决策报告的范围定义
4. 组织架构：基于 org-stakeholder-communication-orchestrator 的治理结构
5. 风险登记册：来自决策报告中的风险评估（转移到风险登记册格式）
6. 阶段规划：基于决策报告中的实施路径建议

使用project-charter-writer的完整Python代码生成.docx文件
```

**输出:** 项目章程(.docx)

**Gate检查:**
- [ ] 章程中的项目目标与决策报告中的目标陈述完全一致
- [ ] 范围描述不超出决策报告的推荐方案
- [ ] 关键里程碑与战略决策中的时间目标一致
- [ ] 风险登记册包含决策阶段识别的所有风险

---

### Stage 3 — Planning Kickoff Package Integration

**整合决策报告 + 项目章程 → 项目启动管理包:**

```
项目启动管理包包含:
1. 战略决策分析报告（Phase 1输出）
2. 项目章程(.docx)（Phase 2输出）
3. 项目启动清单（PMO制定）

启动清单检查项:
□ 项目章程已获SCCB/指导委员会批准签字
□ 项目组织架构已确定（PM/BA/SA/PMO到位）
□ 范围基线已初步确定（可进入WBS分解阶段）
□ 治理机制已建立（例会节奏、升版路径）
□ 初始风险登记册已建立（来自决策阶段）
□ 干系人沟通计划已启动
```

---

### Stage 4 — Handoff to Planning Orchestrator

When the project launch package is approved:

```
触发 wbs-schedule-milestone-orchestrator:

INPUTS:
- project_name: 项目章程中的项目名称
- project_objective: 项目章程中的项目目标
- scope_statement: 项目章程中的范围描述
- go_live_date: 项目章程中的里程碑目标
- team_context: 项目章程中的组织架构和团队结构
- constraints: 项目章程中的约束条件
- 来自 org-stakeholder-communication-orchestrator 的治理结构

启动规划链要求:
1. 组织架构（汇报关系）已在org-stakeholder-communication-orchestrator中定义
2. 初始风险登记册已建立（来自strategy-decision-facilitation）
3. 范围基线已初步确定，可进入WBS分解
```

---

## Quality Gates

- [ ] The strategic decision has been through the full 5-phase decision framework (or is documented as pre-approved)
- [ ] The project charter objective is directly traceable to the strategic decision outcome
- [ ] The project charter scope is consistent with the approved option in the decision report (no scope expansion)
- [ ] The risk register in the charter contains all risks identified during the decision phase
- [ ] The project charter has been approved by the appropriate governance body (SCCB or above)
- [ ] The planning kickoff package is complete before WBS decomposition begins

## Failure Modes

| Failure Mode | Detection | Fix |
|-------------|-----------|-----|
| Decision framework skipped | No decision analysis report, charter created directly from executive instruction | Either produce decision analysis OR document that decision was pre-approved |
| Scope expanded in charter | Charter scope > decision-approved scope | Align charter scope with decision report; escalate if business wants expansion |
| Milestones inconsistent | Charter go-live date ≠ decision target | Reconcile dates with decision sponsor; update decision report if changed |
| No risk transfer | Risks from decision phase not carried into charter risk register | Enforce risk handoff checklist before planning starts |
| Charter approved without governance sign-off | SCCB/steering committee not signed | PMO must obtain governance approval before planning kickoff |

## Handoff Targets

| 下游Skill | 触发时机 | 交接内容 |
|-----------|---------|---------|
| wbs-schedule-milestone-orchestrator | 项目章程批准后 | 范围基线、项目目标、治理结构、初始风险 |
| org-stakeholder-communication-orchestrator | 项目章程批准后 | 项目组织架构、关键干系人清单 |
| risk-register-builder | 决策阶段完成时 | 决策阶段识别的所有风险（含概率/影响/应对） |
| project-oversight-risk-orchestrator | 项目启动后 | 初始风险登记册基线 |
