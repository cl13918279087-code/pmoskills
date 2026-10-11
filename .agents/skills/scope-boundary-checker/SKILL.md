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

---

## 信息采集（Step 0 — 范围边界检查前的上下文采集）

> ⚠️ **执行前必读**：范围边界检查需要明确的项目范围定义。信息缺失时应主动采集，而非跳过或生成空白输出。

### Step 0.1 — 范围定义检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目名称 | 请告知 | 提供默认值 `[假设值-请核对]` |
| 项目类型 | 请告知 | 提供类型选项供选择 |
| 项目阶段 | 请告知 | 标注 `[假设值-请核对]` |
| 已有范围定义文档 | 请告知 | 说明文档来源 |

### Step 0.2 — 项目类型说明

| 类型代码 | 项目类型 | 典型特征 |
|---------|---------|---------|
| core_system | 核心银行系统 | 大型、跨系统、高预算 |
| channel_transform | 渠道转型 | 多渠道整合、客户体验优先 |
| data_migration | 数据迁移 | 大数据量、清洗复杂、零容忍 |
| compliance_upgrade | 合规升级 | 监管驱动、严格审计 |
| infrastructure | 基础设施 | 硬件更新、灾备、扩展性 |

### Step 0.3 — 数据采集问题

**请逐项回答（已知的跳过，直接告知）：**

1. **项目名称**：当前项目的正式名称是什么？
2. **范围定义来源**：是否有正式的项目章程、合同或需求说明书？
3. **项目边界**：哪些在范围内？哪些明确在范围外？
4. **关键干系人**：谁对范围有最终决策权？

### Step 0.4 — 数据确认

```
📊 范围边界检查 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目名称 | ✅/⚠️/❓ | [名称] |
| 项目类型 | ✅/⚠️/❓ | [类型] |
| 范围定义来源 | ✅/⚠️/❓ | [来源] |
| 关键干系人 | ✅/⚠️/❓ | [干系人] |

请确认后"开始范围边界检查"，我将基于范围定义生成检查报告。
═══════════════════════════════════════════
```

---

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
