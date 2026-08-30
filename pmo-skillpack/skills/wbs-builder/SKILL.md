---
name: "wbs-builder"
pack: "project-management-pack"
display_name: "WBS工作分解结构"
description: "将银行IT项目分解为三层WBS（阶段/子系统/工作包），支持进度排序、责任人分配和成本估算，为项目执行提供清晰的工作结构。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
bs-builder（银行业务定制版）

## Purpose
Break a banking IT project into a WBS with Phase / Subsystem / Work Package three-layer structure, supporting sequencing, ownership assignment, and EVM-based hour estimation.

## When to use
## Trigger this skill when
- A banking core system, digital channel, risk engine, regulatory reporting, or data platform project enters planning phase.
- Scope, risk, cost, schedule, compliance, or closure signals need structured review.
- You need planning outputs that can feed engineering, vendor management, risk governance, or audit work.

## Expected inputs
- project scope
- deliverables
- constraints (budget, timeline, regulatory deadlines, legacy system coupling)
- team context (internal IT, vendor, BAs, risk/compliance officers, operation teams)

## Deliverables
- WBS with 3-layer hierarchy (Phase → Subsystem → Work Package)
- Work package list with EVM hour estimates and owner assignments
- Deliverable-to-work-package mapping table
- Grouping rationale and cross-subsystem dependency notes

## Operating procedure

---

## 信息采集（Step 0 — WBS分解前的上下文采集）

> ⚠️ **执行前必读**：WBS分解需要明确的项目范围和交付物。

### Step 0.1 — WBS上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 项目范围/交付物 | 请告知 | 标注 `[假设值-请核对]` |
| 约束条件 | 请告知 | 标注 `[假设值-请核对]` |
| 团队结构 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 WBS分解 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 项目范围 | ✅/⚠️/❓ | [说明] |
| 约束条件 | ✅/⚠️/❓ | [说明] |
| 团队结构 | ✅/⚠️/❓ | [说明] |

请确认后"开始WBS分解"。
═══════════════════════════════════════════
```

---

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

## Quality Gates


- [ ] WBS 层级不超过 4 层
- [ ] 每个工作包可交付成果明确
- [ ] 工作包责任人不为空
- [ ] WBS 与项目范围说明书一致
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
