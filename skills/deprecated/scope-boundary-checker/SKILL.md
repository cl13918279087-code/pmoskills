---

name: "scope-boundary-checker"
pack: "project-management-pack"
version: "1.0"
purpose: "Check whether proposed work has clear boundaries, exclusions, and controllable scope edges."
deprecated: true
deprecated_reason: "已废弃，功能合并至 scope-management。请使用 scope-management 替代。"
inputs: ["project description", "candidate deliverables", "requested changes or additions", "constraints"]
outputs: ["scope edge review", "gray zones", "boundary risks", "recommended clarifications"]
handoffs: ["scope-management"]

---
# scope-boundary-checker

> ⚠️ **已废弃（Deprecated）**：此Skill已停止维护，功能已合并至 **[scope-management](../scope-management/SKILL.md)**。请勿在新项目中使用此Skill。

## Purpose
Check whether proposed work has clear boundaries, exclusions, and controllable scope edges.

> **废弃说明**：此Skill的功能（范围边界检查）已整合至 [scope-management](../scope-management/SKILL.md)，后者提供更完整的范围管理能力（范围定义表 + 灰区待定清单 + 变更触发条件 + WBS映射）。

## Trigger this skill when
- A project, delivery effort, or formal planning activity needs clearer control artifacts.
- Scope, risk, cost, schedule, communication, or closure signals need structured review.
- You need planning outputs that can feed engineering, governance, or assessment work.

## Expected inputs
- project description
- candidate deliverables
- requested changes or additions
- constraints

## Deliverables
- scope edge review
- gray zones
- boundary risks
- recommended clarifications

## Operating procedure

## Procedure
1. Clarify the project context, objective, and control horizon.
2. Separate what is known from what is assumed, estimated, or missing.
3. Produce the skill-specific artifact or review output.
4. Surface risks, tradeoffs, ownership gaps, and ethics concerns explicitly.
5. Recommend the next best handoff instead of trying to solve the whole lifecycle at once.

## Quality gates
- The output is specific to the current project context.
- Uncertainty, assumptions, and decision dependencies are visible.
- The result is usable by a PM, engineering lead, or project team.
- The output should reduce scope creep risk rather than restate vague deliverables.

## Handoff targets
- inclusions-exclusions-writer
- constraint-assumption-register-builder
- wbs-builder

## Output style
- Be explicit about scope, timing, cost, risk, and governance tradeoffs.
- Prefer operational artifacts over broad managerial prose.
- Surface evidence gaps instead of inventing certainty.
- Keep the result usable in real project documents and repo workflows.

## Failure modes to avoid
- Do not confuse aspiration with approved commitment.
- Do not hide uncertainty inside a neat-looking plan.
- Do not treat every stakeholder or deliverable as equally critical.
- Do not sever planning artifacts from execution reality.

## Minimum output skeleton
```md
## Summary
## Findings
## Structured outputs
## Risks / blockers
## Open questions
## Recommended next skill
```
