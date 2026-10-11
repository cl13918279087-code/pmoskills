---
name: "orchestrator-skill-authoring"
description: "Guide for creating PMO-domain orchestrator skills that chain foundational skills into coherent workflows. Use this when authoring any *-orchestrator skill."
pack: "project-management-pack"
purpose: "Guide for creating PMO-domain orchestrator skills that chain foundational skills into coherent workflows. Use this when authoring any *-orchestrator skill."
inputs: ["list of foundational skills to chain", "workflow scenario description", "data flow between skills"]
outputs: ["orchestrator SKILL.md", "skill handoff map", "trigger condition table"]
handoffs: []
---

# orchestrator-skill-authoring

## Purpose

This skill guides the creation of **orchestrator skills** — high-level skills that chain two or more foundational skills into a coherent end-to-end workflow.

An orchestrator skill differs from a foundational skill in that it does NOT produce documents or analyses directly. Instead, it:
1. Determines which foundational skill to invoke at each step
2. Passes context (outputs from previous skill) as inputs to the next
3. Handles error cases and branching logic between skills
4. Produces a unified output that no single foundational skill could produce alone

## When to use this skill

You are creating a new skill whose ID ends with `-orchestrator`, OR you are building a workflow that spans more than 2 foundational skills and want to formalize it as a reusable skill.

## Trigger condition table (required)

Every orchestrator must define explicit trigger conditions. Use this format:

| 触发条件 | 触发场景 | 优先级 |
|---------|---------|-------|
| 手动触发 | 用户主动要求执行该工作流 | P0 |
| 定期触发 | 每周五/每月末自动触发 | P1 |
| 事件触发 | 上游Skill完成/数据达标/阈值突破 | P2 |

## Orchestrator skill template

```markdown
---
name: "[skill-id]-orchestrator"
pack: "project-management-pack"
purpose: "One sentence describing the orchestrator's goal and what workflow it automates."
inputs: ["scenario description", "context data from upstream", "user preferences"]
outputs: ["final workflow output", "status of each chained skill"]
handoffs: ["foundational-skill-1", "foundational-skill-2", ...]
---

# [Skill Name]

## Purpose
[2-3 sentences: what this orchestrator does, why it exists as a separate skill, what problem it solves by chaining skills]

## Chain Architecture
[Visual diagram of the skill chain]

```
Skill A → Skill B → Skill C → [Output]
```

## Skill Chain Specification

| Step | Skill | Input | Output | Failure Handling |
|------|-------|-------|--------|-----------------|
| 1 | foundational-skill-A | [inputs from user/scenario] | [output description] | If A fails → abort, prompt user |
| 2 | foundational-skill-B | [output from A + additional context] | [output description] | If B fails → retry once, then abort |
| 3 | foundational-skill-C | [output from B + additional context] | [final output] | If C fails → surface error, suggest alternatives |

## Data Flow Between Skills

| 数据项 | 来源Skill | 流向Skill | 格式/说明 |
|-------|---------|---------|----------|
| [data item 1] | Skill A | Skill B | [format description] |
| [data item 2] | Skill B | Skill C | [format description] |

## Trigger Conditions

| 触发条件 | 触发场景 | 优先级 |
|---------|---------|-------|
| 手动触发 | [user scenario] | P0 |
| 定期触发 | [schedule, e.g. weekly/monthly] | P1 |
| 事件触发 | [upstream event] | P2 |

## Handoff Rules

- **Normal path**: Each skill hands off to the next skill in the chain upon successful completion
- **Branch path**: If [condition], skip Skill B and go directly to Skill C
- **Abort path**: If [condition], abort the chain and surface [error/output] to user
- **Loop path**: If [condition], return to Skill A with [updated input]

## Quality Gates

- [ ] All chained skills are available (readiness: available/framework, not missing)
- [ ] Data flow between skills is explicitly documented with field-level mapping
- [ ] Failure handling is defined for every step
- [ ] Trigger conditions are specific (not "any situation")
- [ ] The orchestrator output is meaningfully different from any single chained skill's output
- [ ] The orchestrator is referenced in the relevant Agent configuration

## Common mistakes

| 错误 | 说明 | 正确做法 |
|------|------|---------|
| ❌ 把orchestrator写成"技能堆砌" | 罗列多个技能但没有数据流衔接 | 每一步都明确输入/输出字段映射 |
| ❌ 缺少失败处理 | 任何一个skill失败就中断 | 定义retry/abort/branch三种路径 |
| ❌ 触发条件太模糊 | "需要时触发" | 明确定义手动/定期/事件三类触发 |
| ❌ orchestrator没有增量价值 | 输出与单个skill输出完全相同 | orchestrator输出必须是多skill协同才能产生的结果 |
| ❌ 跳过pack.yaml更新 | 新orchestrator未加入索引 | 创建orchestrator后必须更新pack.yaml |
| ❌ 合并/替换旧skill后未标注deprecated | 旧skill文件仍在目录中，用户误用 | 合并替换场景下，必须将旧skill标注为deprecated或将文件移至deprecated/目录 |

## Deprecated Skill 处理规范

当创建的新orchestrator skill合并/替换了已有的旧skill时（如`scope-management`合并了`scope-boundary-checker`和`inclusions-exclusions-writer`），必须执行以下步骤：

```
Step 1: 在旧skill的SKILL.md顶部添加 deprecated: true 字段
Step 2: 在旧skill的purpose中注明："【已废弃，请使用 [新skill名称]】"
Step 3: 在旧skill的SKILL.md末尾添加重定向说明：
        ## 重定向
        本skill已废弃，请使用 [新skill名称]
        变更原因：[简述]
        迁移指引：[用户应如何切换到新skill]
Step 4: 更新 pack.yaml，在旧skill条目的 readiness 字段改为 "deprecated"
Step 5: 在pack.yaml的skills列表中，确保新skill在旧skill之前被引用
```

## Agent Config Update — Multi-Agent Distribution Rule

When creating a new **orchestrator or shared skill** that may be used by multiple agents:
- **Do NOT** add to only one agent's `core_skills`
- **Add to ALL relevant agents** that will use or invoke the skill
- Example: `project-info-manager` was initially only in `project-execution-agent`, but needs to be in all 4 agents (strategic-execution, project-control, project-execution, project-inspection) because all agents query/write project information
- This ensures the skill is discoverable and usable by any agent that needs it, without requiring cross-agent skill lookup

## Output format

When you finish creating an orchestrator skill, produce:

1. **SKILL.md** at `~/.hermes/skills/project-management/skills/[skill-id]-orchestrator/SKILL.md`
2. **pack.yaml update**: Add the orchestrator to the skills list in `pack.yaml` with `chain: [skill-A, skill-B, ...]`
3. **Agent config update**: If the orchestrator belongs to a specific Agent, add it to that Agent's `core_skills` list
4. **Multi-Agent distribution**: Check if the new skill should be added to other agents' `core_skills` — if it's a shared/information skill used by multiple agents, add it to all relevant agents
