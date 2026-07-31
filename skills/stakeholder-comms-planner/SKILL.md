---
name: "stakeholder-comms-planner"
pack: "project-management-pack"
display_name: "干系人沟通计划"
description: "规划项目全生命周期中谁需要什么信息、何时需要、为什么需要、以什么格式传递，确保正确的信息在正确的时间传递给正确的干系人。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
---
takeholder-comms-planner

## Purpose
Plan who needs what communication, when, why, and in what format across the project lifecycle.

## When to use
## Trigger this skill when
- A project, delivery effort, or formal planning activity needs clearer control artifacts.
- Scope, risk, cost, schedule, communication, or closure signals need structured review.
- You need planning outputs that can feed engineering, governance, or assessment work.

## Expected inputs
- stakeholder list
- project cadence
- decision points
- communication constraints

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

## Quality Gates

All gates must be satisfied before the communications plan is considered complete:

| # | Quality Gate | Pass Criterion | Verify By |
|---|---|---|---|
| QG-1 | Stakeholder Roster Complete | All internal, external, and governance stakeholders identified and classified in Power/Interest Grid | Signed stakeholder roster |
| QG-2 | Power/Interest Grid Populated | All stakeholders assigned to correct grid zone (A/B/C/D); no unclassified stakeholders | Grid classification document |
| QG-3 | Communications Matrix Complete | Every stakeholder in Zone A and Zone B has a defined communication product, cadence, owner, and channel | Communications matrix |
| QG-4 | Cadence Plan Integrated with Project Milestones | All communication events mapped to project milestone dates; no scheduling conflicts | Cadence plan + milestone schedule |
| QG-5 | Escalation Protocols Defined | All decision gates have documented escalation paths with named owners and response time SLAs | Escalation protocol document |
| QG-6 | Regulatory Communication Approved | All communications to regulators (CBIRC, PBOC) have obtained required disclosure approvals | Compliance sign-off |

**If any gate fails:** Do not issue the communications plan. Resolve the failing gate with the relevant stakeholder before finalizing.
