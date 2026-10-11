---

name: "stakeholder-comms-planner"
pack: "project-management-pack"
version: "1.0"
purpose: "Plan who needs what communication, when, why, and in what format across the project lifecycle."
inputs: ["stakeholder list", "project cadence", "decision points", "communication constraints"]
outputs: ["communications matrix", "cadence plan", "decision communication points", "ownership plan"]
handoffs: ["closure-report-writer", "lessons-learned-summarizer", "ethics-management-plan-writer"]

---
# stakeholder-comms-planner

## Purpose
Plan who needs what communication, when, why, and in what format across the project lifecycle.

## Trigger this skill when
- A project, delivery effort, or formal planning activity needs clearer control artifacts.
- Scope, risk, cost, schedule, communication, or closure signals need structured review.
- You need planning outputs that can feed engineering, governance, or assessment work.

## Expected inputs
- stakeholder list
- project cadence
- decision points
- communication constraints

---

## 信息采集（Step 0 — 干系人沟通规划前的信息采集）

> ⚠️ **执行前必读**：本Skill的输出质量取决于干系人信息和项目节奏数据的完整度。信息缺失时应主动采集，而非生成通用沟通矩阵。

### Step 0.1 — 数据缺口检查

| 输入项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| stakeholder list（干系人列表） | 请告知 | 标注 `[假设值-请核对]` |
| project cadence（项目节奏/周期） | 请告知 | 标注 `[假设值-请核对]` |
| decision points（决策节点） | 请告知 | 标注 `[假设值-请核对]` |
| communication constraints（沟通约束） | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据采集问题

**请逐项回答（已知的跳过，直接告知）：**

1. **干系人列表（stakeholder list）**
   - 项目涉及哪些部门/角色？（列出即可，姓名可选）
   - 决策层有哪些人？（项目管理委员会/CIO/部门总经理）
   - 外部干系人有哪些？（监管机构/供应商/审计）

2. **项目节奏（project cadence）**
   - 项目例会多久一次？（周例会/月例会）
   - 项目整体周期多长？
   - 有哪些关键决策节点？

3. **决策节点（decision points）**
   - 哪些时间节点需要做出重大决策？
   - 哪些决策需要高层审批？

4. **沟通约束（communication constraints）**
   - 有无信息保密要求？（涉密/内部）
   - 有无特殊沟通渠道要求？

### Step 0.3 — 数据确认

```
📊 干系人沟通规划 信息采集确认单
═══════════════════════════════════════════

| 输入项 | 状态 | 采集摘要 |
|--------|------|---------|
| 干系人列表 | ✅/⚠️/❓ | [数量]人 |
| 项目节奏 | ✅/⚠️/❓ | [周/月例会] |
| 决策节点 | ✅/⚠️/❓ | [数量]个 |
| 沟通约束 | ✅/⚠️/❓ | [说明] |

⚠️ [假设值-请核对] 的字段将在沟通矩阵中标注

请确认后"开始规划沟通"，我将基于以上信息生成沟通矩阵。
═══════════════════════════════════════════
```

---

## Deliverables
- communications matrix
- cadence plan
- decision communication points
- ownership plan

## Operating procedure

## Procedure
### Phase 1: Stakeholder Identification & Classification

1. **Collect stakeholder roster** — Map all parties affected by or able to influence the initiative, including:
   - Internal: Business lines (Retail Banking, Corporate Finance, Risk Management, Compliance, IT, Operations, Treasury, Internal Audit)
   - External: Regulator (CBIRC, PBOC), counterparties, payment networks, customers
   - Governance: Board committees (Risk Committee, Audit Committee), Executive Committee, Project Steering Committee

2. **Classify using Power/Interest Grid**

   | Grid Zone | Stakeholder Profile | Engagement Strategy |
   |---|---|---|
   | **Zone A: High Power, High Interest** (Manage Closely) | Board Risk Committee, CBIRC examiners, CEO, Business Line President | Monthly written briefings + ad-hoc escalations; decisions documented with audit trail |
   | **Zone B: High Power, Low Interest** (Keep Satisfied) | External auditors, Parent company CFO | Quarterly summary reports; avoid over-communication |
   | **Zone C: Low Power, High Interest** (Keep Informed) | Business analysts, IT project team, Operations staff | Weekly standup notes; bi-weekly demo sessions |
   | **Zone D: Low Power, Low Interest** (Monitor) | Peripheral support teams, admin staff | Monthly newsletter digest; skip if no material updates |

3. **Banking-specific stakeholder categories**

   | Category | Examples | Typical Concerns |
   |---|---|---|
   | **Regulatory** | CBIRC, PBOC, Insurance Regulator | Compliance posture, capital impact, consumer protection |
   | **Executive** | CEO, CFO, CRO, COO | Strategic alignment, financial performance, risk appetite |
   | **Business Line** | Retail Head, Corporate Banking Head, Wealth Mgmt Head | Revenue impact, customer experience, product timelines |
   | **Risk & Compliance** | Chief Risk Officer, Compliance Director, AML Officer | Non-financial risk, regulatory filing deadlines, audit findings |
   | **Technology** | CTO, Application Development Head, Infrastructure Lead | Technical debt, integration complexity, vendor dependency |
   | **Operations** | Operations Manager, Call Center Director, Branch Network Lead | Process changeover, training load, operational resilience |
   | **Audit** | Internal Audit Director, External Audit Partner | Control effectiveness, disclosure accuracy, finding remediation |

### Phase 2: Communication Matrix Template

Populate the matrix below for each identified stakeholder:

```
| Stakeholder | Zone | Role in Initiative | Information Needs | Sensitivity Level | Frequency | Format | Owner | Channel | Key Dates |
|---|---|---|---|---|---|---|---|---|---|
```

**Sensitivity Level Guidelines:**
- **Strictly Confidential** — Board materials, regulatory filings, M&A, personnel changes, audit findings
- **Internal Restricted** — Risk assessments, financial forecasts, vendor contracts, strategic plans
- **Internal General** — Project status, process updates, training materials
- **Public** — Product launches, customer communications (after approval)

### Phase 3: Cadence Planning

1. **Establish communication rhythm aligned to banking governance cycles:**
   - **Monthly**: Steering Committee status, Risk & Compliance dashboard, Financial tracking
   - **Weekly**: Project team standup, Issue log review, Burn-rate update
   - **Ad-hoc**: Regulatory inquiries (respond within 24-48 hrs), Security incidents (immediate)

2. **Map communications to decision gates:**

   | Decision Point | Gate Keeper | Information Required | Lead Time |
   |---|---|---|---|
   | Project Charter Approval | Steering Committee | Business case, risk register, resource plan | 5 business days |
   | Go/No-Go to UAT | Project Manager + Business Owner | Test results, operational readiness | 3 business days |
   | Regulatory Filing | Compliance Director | Impact assessment, remediation timeline | 10 business days |
   | Production Release | Operations + IT | Deployment plan, rollback procedure, monitoring | 2 business days |
   | Board Briefing | CEO + CFO | Executive summary, KRI trends, strategic alignment | 7 business days |

### Phase 4: Information Packaging by Audience

| Audience | Style | Length | Tone | Must Include |
   |---|---|---|---|---|
   | Board / ExCo | Executive summary + decision points | 1-2 pages | Strategic, outcome-focused | RAG status, key risks, financial impact |
   | Business Line Heads | Initiative update + business impact | 2-3 slides | Direct, benefit-led | Timeline, resource ask, dependency |
   | Risk / Compliance | Control landscape + regulatory implications | Detailed report | Precise, evidence-based | Control effectiveness, Gap analysis, remediation |
   | IT / Engineering | Technical detail + architecture decisions | As needed | Technical, precise | API contracts, data flows, integration points |
   | Operations | Process change + training plan | Step-by-step | Practical, operational | Runbook, training schedule, support contacts |
   | External Regulators | Formal filing format | Per regulatory template | Formal, defensive | Compliance evidence, timelines, attestations |

### Phase 5: Risk & Escalation Protocols

1. **Escalation thresholds (RAG definitions):**
   - **Red**: Regulatory action, data breach, budget overrun >15%, schedule slip >4 weeks
   - **Amber**: Key resource departure, vendor non-performance, scope creep >10%
   - **Green**: On-track within tolerance, no material issues

2. **Escalation path:**
   ```
   Issue Identified → Project Manager → Program Manager → Steering Committee
                                        → Risk Officer (if compliance/regulatory)
                                        → CEO (if Red-level, Board notification required)
   ```

3. **Communication constraints specific to banking:**
   - External disclosure of financial data requires CFO/Investor Relations sign-off
   - Regulatory communication must go through designated Compliance liaison
   - Customer data in any communication requires Data Office review
   - Vendor contracts and pricing discussions require Procurement involvement

## Quality gates
- The output is specific to the current project context.
- Uncertainty, assumptions, and decision dependencies are visible.
- The result is usable by a PM, engineering lead, or project team.
- Communications should be tied to decision needs and stakeholder roles.
- Regulatory and risk stakeholders are explicitly mapped, not buried in a generic list.
- Escalation protocols reflect banking governance requirements.

## Handoff targets
- closure-report-writer
- lessons-learned-summarizer
- ethics-management-plan-writer

## Output style
- Be explicit about scope, timing, cost, risk, and governance tradeoffs.
- Prefer operational artifacts over broad managerial prose.
- Surface evidence gaps instead of inventing certainty.
- Keep the result usable in real project documents and repo workflows.
- Use banking terminology and governance structures accurately.

## Failure modes to avoid
- Do not confuse aspiration with approved commitment.
- Do not hide uncertainty inside a neat-looking plan.
- Do not treat every stakeholder or deliverable as equally critical.
- Do not sever planning artifacts from execution reality.
- Do not exclude regulatory and risk stakeholders from the communication map.
- Do not plan communications that would require disclosure approvals without obtaining them first.

## Minimum output skeleton
```md
## Summary
## Stakeholder Map (Power/Interest Grid)
## Communications Matrix
## Cadence Plan
## Decision Gate Mapping
## Escalation Protocols
## Risks / Blockers
## Open Questions
## Recommended Next Skill
```
