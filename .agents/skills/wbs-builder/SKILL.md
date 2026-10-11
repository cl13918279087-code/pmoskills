---

name: "wbs-builder"
pack: "project-management-pack"
version: "1.0"
purpose: "Break a project into a work breakdown structure that supports sequencing, ownership, and estimation."
inputs: ["project scope", "deliverables", "constraints", "team context"]
outputs: ["work breakdown structure", "work package list", "grouping rationale", "ownership/dependency notes"]
handoffs: ["schedule-sequencer", "milestone-planner", "cost-estimation-helper"]

---
# wbs-builder（银行业务定制版）

## Purpose
Break a banking IT project into a WBS with Phase / Subsystem / Work Package three-layer structure, supporting sequencing, ownership assignment, and EVM-based hour estimation.

## Trigger this skill when
- A banking core system, digital channel, risk engine, regulatory reporting, or data platform project enters planning phase.
- Scope, risk, cost, schedule, compliance, or closure signals need structured review.
- You need planning outputs that can feed engineering, vendor management, risk governance, or audit work.

## Expected inputs
- project scope
- deliverables
- constraints (budget, timeline, regulatory deadlines, legacy system coupling)
- team context (internal IT, vendor, BAs, risk/compliance officers, operation teams)

---

## 信息采集（Step 0 — 信息检查与采集）

> ⚠️ **执行前必读**：本Skill需要上述4项输入数据。若某项数据缺失，请先通过采集流程获取，不要直接使用假设值跳过。

### Step 0.1 — 检查数据缺口

请对照以下清单，确认每项输入数据的就绪状态：

| 输入项 | 是否已知 | 采集状态 | 未提供时的处理方式 |
|--------|---------|---------|-----------------|
| project scope（项目范围） | 请告知 | ❓ 未提供 → 标注 `[假设值-请核对]` | 请描述项目要做什么，我会标注假设 |
| deliverables（交付物清单） | 请告知 | ❓ 未提供 → 标注 `[假设值-请核对]` | 请描述主要交付物，我会标注假设 |
| constraints（约束条件） | 请告知 | ❓ 未提供 → 标注 `[假设值-请核对]` | 请告知预算、timeline、监管截止日，我会标注假设 |
| team context（团队上下文） | 请告知 | ❓ 未提供 → 标注 `[假设值-请核对]` | 请告知主要团队角色，我会标注假设 |

### Step 0.2 — 数据采集（如有缺失）

**请按以下问题逐项回答（已知的部分跳过，直接告知）：**

1. **项目范围（project scope）**
   - 项目类型是什么？（核心银行系统/数字渠道/风险引擎/监管报送/数据平台/支付通道）
   - 主要建设内容包括哪些？（系统/功能范围）
   - 项目覆盖哪些业务领域？

2. **交付物清单（deliverables）**
   - 已明确的交付物有哪些？
   - 是否有监管要求必须提交的交付物？（如监管报告、安全评估等）

3. **约束条件（constraints）**
   - 项目预算上限是多少？[假设值-请核对]
   - 项目硬性截止日期？（投产日期、监管截止日）
   - 是否存在与旧系统的强耦合风险？

4. **团队上下文（team context）**
   - 项目团队组成？（内部IT/供应商/BA/合规/运营团队）
   - 是否有供应商依赖？（哪些系统由外部厂商负责）

### Step 0.3 — 数据确认

采集完成后，发送确认单：

```
📊 WBS-builder 信息采集确认单
═══════════════════════════════════════════

【数据就绪状态】
✅ = 已提供   ⚠️ = 部分已知   ❓ = 未提供（将用假设值标注）

| 输入项 | 状态 | 采集值摘要 |
|--------|------|-----------|
| project scope | ✅/⚠️/❓ | [摘要] |
| deliverables | ✅/⚠️/❓ | [摘要] |
| constraints | ✅/⚠️/❓ | [摘要] |
| team context | ✅/⚠️/❓ | [摘要] |

⚠️ 标注 [假设值-请核对] 的字段将在WBS中以醒目方式呈现

请确认"开始生成WBS"，我将基于以上信息执行分解。
═══════════════════════════════════════════
```

---

## Deliverables
- WBS with 3-layer hierarchy (Phase → Subsystem → Work Package)
- Work package list with EVM hour estimates and owner assignments
- Deliverable-to-work-package mapping table
- Grouping rationale and cross-subsystem dependency notes

## Operating procedure

## Procedure
### Step 1 — Context clarification
1. Confirm project category (core banking / digital channel / risk & compliance / data platform / payment gateway / regulatory reporting).
2. Identify the regulatory frame that applies (Basel III / IV, DORA, personal finance data regulations, local central bank guidelines).
3. Confirm the delivery horizon and any hard regulatory cut-off dates.
4. Separate known constraints from assumptions, vendor dependencies, or legacy coupling risks.

### Step 2 — Phase definition
Define the standard 5-phase skeleton adapted to banking IT:

| Phase code | Phase name | Key purpose |
|---|---|---|
| P1 | Initiation & Requirements | Scope, BAs, regulatory gap analysis, RFQ |
| P2 | Solution Design | Architecture, detailed specs, security review, vendor selection |
| P3 | Build & Configuration | Development, parametrization, interface mapping, UAT prep |
| P4 | Testing & Migration | SIT, UAT, security/penetration testing, data migration, parallel run |
| P5 | Go-Live & Stabilisation | Deployment, hypercare, post-live monitoring, audit evidence |

### Step 3 — Subsystem decomposition
Decompose each phase into subsystems. Typical banking subsystems per phase:

**P1 subsystems:** Business Requirements · Regulatory Gap List · RFP / Vendor Evaluation · Project Charter

**P2 subsystems:** Architecture Design · Interface Specification · Security Design · Parametrisation Design · Data Model · Test Strategy

**P3 subsystems:** Core Module Build · Channel Integration · Report Engine · Security Configuration · ETL / Data Migration Scripts · UAT Environment Setup

**P4 subsystems:** System Integration Testing · User Acceptance Testing · Security / Penetration Testing · Data Migration Execution · Performance / Load Testing · Migration rehearsal

**P5 subsystems:** Deployment & Release · Hypercare Support · Defect Remediation · Documentation & Knowledge Transfer · Audit Evidence Pack · Project Closure

### Step 4 — Work package listing
For each subsystem, list specific work packages using the standard banking task library below. Each work package must carry:
- Work package ID (WP-Px-Sy-NNN)
- Description
- Owner role (BA / DEV / QA / OPS / VENDOR)
- Estimated hours (EVM-based, see Section 5)
- Input dependency
- Deliverable output

#### Typical banking task library (select and adapt per project)

| Task tag | Description | EVM hours range |
|---|---|---|
| BA-FunctionalSpec | Write functional specification for a module | 80–160 h |
| BA-UseCase | Write use-case or user story map | 40–80 h |
| BA-RegGap | Perform regulatory gap analysis | 60–120 h |
| DEV-Backend | Develop backend service / API | 120–300 h |
| DEV-Frontend | Develop frontend / UI screen | 80–200 h |
| DEV-Report | Build report definition / layout | 40–100 h |
| DEV-ETL | Build ETL / data migration script | 80–200 h |
| DEV-Config | Parametrize / configure module | 40–80 h |
| DEV-Interface | Build interface / integration | 80–160 h |
| SEC-Design | Perform security design review | 40–80 h |
| SEC-PenTest | Execute penetration test | 80–160 h |
| QA-SIT | Plan and execute SIT | 80–200 h |
| QA-UAT | Support UAT (incl. defect management) | 60–160 h |
| QA-Perf | Execute performance / load test | 40–120 h |
| QA-DataVal | Execute data validation & reconciliation | 40–100 h |
| OPS-Environ | Provision / maintain environments | 40–120 h |
| OPS-Deploy | Create deployment / release package | 20–60 h |
| OPS-Migrate | Execute data migration | 60–160 h |
| OPS-Hypercare | Provide hypercare support (per week) | 40–80 h |
| PM-Charter | Produce project charter | 8–16 h |
| PM-Steering | Prepare steering committee materials | 16–40 h |
| PM-Risk | Maintain risk & issue log | 8–16 h |
| PM-Progress | Produce progress report | 8–16 h |
| KM-Doc | Produce operational / user documentation | 40–120 h |
| KM-Training | Conduct training sessions | 24–80 h |
| AUD-Evidence | Assemble audit evidence pack | 40–80 h |

### Step 5 — EVM hour estimation
1. For each work package, assign hours using the ranges above (or historical data if available).
2. Sum hours per subsystem → per phase.
3. Apply a phase-level contingency buffer (recommended: P1 10 %, P2 15 %, P3 10 %, P4 15 %, P5 5 %).
4. Calculate total project hours and convert to FTE (Full-Time Equivalent: 1 FTE = 1,760 h/year).
5. Flag any subsystem where hours exceed 20 % of total (concentration risk).

### Step 6 — Deliverable mapping
Produce a Deliverable Register mapping each regulatory or business deliverable to the responsible work package:

| Deliverable | Regulatory basis | Responsible WP | Due Phase |
|---|---|---|---|
| Functional Specification | Internal | BA-FunctionalSpec (P1) | P1 |
| Regulatory Gap Report | DORA / Basel | BA-RegGap (P1) | P1 |
| Architecture Design Document | Internal | Architecture Design (P2) | P2 |
| Interface Control Document | Internal | DEV-Interface (P3) | P3 |
| UAT Test Plan & Cases | Internal | QA-UAT (P4) | P4 |
| Penetration Test Report | DORA / local regulator | SEC-PenTest (P4) | P4 |
| Data Migration Report | Internal + auditor | OPS-Migrate (P4) | P4 |
| Hypercare Sign-off | SLA / contract | OPS-Hypercare (P5) | P5 |
| Audit Evidence Pack | Regulatory requirement | AUD-Evidence (P5) | P5 |

### Step 7 — Risk and dependency surfacing
- Flag any work package dependent on a third-party vendor deliverable with no internal fallback.
- Identify regulatory hard-deadline conflicts (e.g., DORA deadline vs. UAT cycle length).
- Highlight any subsystem where legacy integration creates schedule risk.
- Call out staffing gaps (e.g., no dedicated security resource for P2 design review).

### Step 8 — Recommended handoff
Recommend the single most valuable next skill based on the output:
- **schedule-sequencer** → if timeline / milestone planning is the primary need.
- **milestone-planner** → if regulatory checkpoints or phase gates are the primary need.
- **cost-estimation-helper** → if budget / FTE costing is the primary need.

## Quality gates
- WBS covers all project deliverables and regulatory obligations.
- Every work package has an owner, hour estimate, and clear deliverable output.
- Cross-subsystem dependencies are documented (not just intra-phase).
- EVM totals reconcile to the project budget or FTE ceiling.
- Uncertainty, assumptions, and vendor dependencies are surfaced, not hidden.
- The structure supports estimation and sequencing rather than mirroring the org chart.

## Handoff targets
- schedule-sequencer
- milestone-planner
- cost-estimation-helper

## Output style
- Use the 3-layer WBS table (Phase → Subsystem → Work Package) as the primary artifact.
- Include the EVM hour summary table per phase.
- Include the deliverable mapping table.
- Be explicit about scope, timing, cost, risk, compliance tradeoffs.
- Prefer operational artifacts over broad managerial prose.
- Surface evidence gaps instead of inventing certainty.
- Keep the result usable in real project documents and repo workflows.

## Failure modes to avoid
- Do not confuse aspiration with approved commitment.
- Do not hide regulatory uncertainty inside a neat-looking plan.
- Do not treat every stakeholder or deliverable as equally critical.
- Do not sever planning artifacts from execution reality.
- Do not omit vendor-dependent work packages from the WBS.

## Minimum output skeleton
```md
## Summary
## WBS (Phase → Subsystem → Work Package)
## EVM Hour Summary
## Deliverable Register
## Risks / Blockers
## Open Questions
## Recommended next skill
```
