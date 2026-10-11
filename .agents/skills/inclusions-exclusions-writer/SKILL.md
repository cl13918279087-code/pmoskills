---

name: "inclusions-exclusions-writer"
pack: "project-management-pack"
version: "1.0"
purpose: "Make explicit what is inside the project and what is intentionally out of scope to reduce later ambiguity."
deprecated: true
deprecated_reason: "已废弃，功能合并至 scope-management。请使用 scope-management 替代。"
inputs: ["project description", "candidate deliverables", "stakeholder expectations", "known exclusions"]
outputs: ["in-scope list", "out-of-scope list", "gray zones", "change triggers"]
handoffs: ["scope-management"]

---
# inclusions-exclusions-writer

> ⚠️ **已废弃（Deprecated）**：此Skill已停止维护，功能已合并至 **[scope-management](../scope-management/SKILL.md)**。请勿在新项目中使用此Skill。

## Purpose
Make explicit what is inside the project and what is intentionally out of scope to reduce later ambiguity.

> **废弃说明**：此Skill的功能（范围边界检查）已整合至 [scope-management](../scope-management/SKILL.md)，后者提供更完整的范围管理能力（范围定义表 + 灰区待定清单 + 变更触发条件 + WBS映射）。

## Trigger this skill when
- A project, delivery effort, or formal planning activity needs clearer control artifacts.
- Scope, risk, cost, schedule, communication, or closure signals need structured review.
- You need planning outputs that can feed engineering, governance, or assessment work.

## Expected inputs
- project description
- candidate deliverables
- stakeholder expectations
- known exclusions

## Deliverables
- in-scope list
- out-of-scope list
- gray zones
---

## 信息采集（Step 0 — 范围定义采集）

> ⚠️ **执行前必读**：本Skill基于项目范围定义生成包含/排除项。信息缺失时应主动采集，而非生成模糊表述。

### Step 0.1 — 项目上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 候选交付物 | 请告知 | 标注 `[假设值-请核对]` |
| 干系人期望 | 请告知 | 标注 `[假设值-请核对]` |
| 已知排除项 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 场景类型说明

| 场景类型 | 说明 |
|---------|------|
| 项目启动 | 新项目立项，需明确包含/排除范围 |
| 范围评审 | 现有范围定义需review和确认 |
| 变更评估 | 范围变更请求的包含/排除影响分析 |

### Step 0.3 — 数据确认

```
📊 包含/排除项定义 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 候选交付物 | ✅/⚠️/❓ | [数量]项 |
| 干系人期望 | ✅/⚠️/❓ | [说明] |
| 已知排除项 | ✅/⚠️/❓ | [说明] |

请确认后"开始生成包含/排除项"。
═══════════════════════════════════════════
```

---

## Operating procedure
1. Clarify the project context, objective, and control horizon.
2. Separate what is known from what is assumed, estimated, or missing.
3. Produce the skill-specific artifact or review output.
4. Surface risks, tradeoffs, ownership gaps, and ethics concerns explicitly.
5. Recommend the next best handoff instead of trying to solve the whole lifecycle at once.

## Quality gates
- The output is specific to the current project context.
- Uncertainty, assumptions, and decision dependencies are visible.
- The result is usable by a PM, engineering lead, or project team.
- The output should make exclusions explicit enough to resist later reinterpretation.

## Handoff targets
- scope-boundary-checker
- wbs-builder
- stakeholder-comms-planner

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
