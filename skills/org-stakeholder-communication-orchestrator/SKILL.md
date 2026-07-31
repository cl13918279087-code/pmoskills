---
name: "org-stakeholder-communication-orchestrator"
pack: "project-management-pack"
display_name: "组织与干系人沟通编排"
description: "编排组织架构设计与干系人沟通全链条：治理结构设计→干系人识别→沟通策略制定→沟通计划执行→效果评估与改进，确保项目获得充分的高层支持和资源保障。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
handoffs: ["org-structure-builder", "stakeholder-comms-planner"]
---
org-stakeholder-communication-orchestrator

## Purpose

## When to use

Use this skill when:
- Designing or revising organizational governance structure
- Planning stakeholder communication for a new project
- Building RACI matrix and reporting paths
- Executive communication planning
- Project governance framework setup

This is the **governance and communication orchestrator** for the PMO domain. It chains two foundational skills into one governance-2-communication workflow:

```
org-structure-builder ──→ stakeholder-comms-planner
        ↓                        ↓
   治理架构设计              干系人沟通规划
   (组织/汇报/决策)           (矩阵/频率/格式)
        ↓                        ↓
   治理手册               沟通管理计划
        │                        │
        └────────────┬───────────┘
                     ↓
           ┌─────────────────┐
           │  治理+沟通整合包  │
           │ Governance +    │
           │ Communication   │
           │ Package         │
           └─────────────────┘
```

**When to trigger this skill:**
- A new project/sub-project is initiated (governance needs to be established)
- A governance change occurs (new sponsor, new PM, organizational restructuring)
- Moving to a new project phase (communication needs change)
- Before SCCB or steering committee meetings (stakeholder communication needs refresh)
- PMO identifies communication gaps or governance issues

---

## Orchestration Procedure

## Procedure

> **Procedure** — This skill follows the **Orchestration Procedure** defined below. For execution, follow the numbered steps in that section.

### Stage 1 — Governance Structure Design (调用 org-structure-builder)

**Action:** Invoke `org-structure-builder`:

```
INPUTS传递给org-structure-builder:
- 项目背景: 项目名称、业务背景、监管环境
- 项目规模: 团队规模（核心组/外围组/PMO）
- 治理需求: 需要哪些决策层（指导委员会/SCCB/PMO）
- 干系人初步清单: 已知的关键干系人

治理架构要求:
1. 三层决策体系：指导委员会（最高）/ SCCB（重大变更）/ PMO（日常管控）
2. 明确汇报路径：执行层 → PMO → SCCB → 指导委员会
3. 关键角色定义：项目总监/PM/BA/SA/测试组/PMO各层职责
4. 跨部门协调机制：依赖关系处理流程
5. 输出：治理手册（含组织图、职责矩阵RACI、汇报路径）
```

**输出:** 治理手册（RACI矩阵 + 组织架构图 + 决策路径）

**Gate检查:**
- [ ] 三层决策体系完整（指导委员会/SCCB/PMO）
- [ ] 所有关键角色有明确职责描述
- [ ] 跨部门协调机制有流程定义

---

### Stage 2 — Stakeholder Analysis & Communication Planning (调用 stakeholder-comms-planner)

**Action:** Invoke `stakeholder-comms-planner`:

```
INPUTS传递给stakeholder-comms-planner:
- 项目目标: 含里程碑目标和时间约束
- 干系人清单: org-structure-builder输出的完整干系人清单
- 治理结构: 决策层级和升版路径
- 项目阶段: 当前所处阶段（影响沟通频率和格式）
- 沟通约束: 会议频率限制、审批流程等

沟通规划要求:
1. 识别所有干系人（按权力/利益分类）
2. 针对不同干系人制定沟通矩阵（内容/频率/形式/负责人）
3. 定义汇报路径（升版条件和流程）
4. 生成标准化报告模板（周报/月报/里程碑报告）
5. 规划PMO例会节奏（与里程碑审查对齐）
```

**输出:** 沟通管理计划（沟通矩阵 + 报告模板 + 升版路径 + 例会排期）

**Gate检查:**
- [ ] 所有关键干系人都有明确的沟通责任人
- [ ] 报告模板与项目阶段匹配（启动期 vs 执行期 vs 收尾期内容差异）
- [ ] 升版路径清晰，可操作

---

### Stage 3 — Governance + Communication Package Integration

**整合检查清单:**

```
□ 治理手册中每个委员会/决策节点 → 在沟通计划中有对应汇报安排
□ 组织架构中的每个角色 → 在沟通矩阵中有对应沟通责任人
□ SCCB审批节点 → 提前在沟通计划中标记（提前2周发材料）
□ 升版路径 → 与沟通矩阵中的紧急升级通道一致
□ 关键里程碑 → 在沟通计划中标记通知截止日和通知范围
□ 项目各阶段切换时 → 触发沟通计划重新评审
```

---

## Governance + Communication Package Contents

### 1. 治理手册

**1.1 组织架构图**
```
项目群治理架构:
                    ┌─────────────────┐
                    │  指导委员会      │
                    │ (行领导/高层)   │
                    └────────┬────────┘
                             │ 重大决策
                             ▼
                    ┌─────────────────┐
                    │     SCCB        │
                    │ (项目总监/PMO)  │
                    └────────┬────────┘
                             │ 变更审批/基准更新
                             ▼
                    ┌─────────────────┐
                    │     PMO         │
                    │ (项目管控)      │
                    └────────┬────────┘
                             │ 日常管理
          ┌──────────────────┼──────────────────┐
          ▼                  ▼                  ▼
    ┌──────────┐      ┌──────────┐      ┌──────────┐
    │ 业务总体组 │      │ 技术总体组 │      │ 测试总体组 │
    └──────────┘      └──────────┘      └──────────┘
          │                  │                  │
          ▼                  ▼                  ▼
    ┌──────────┐      ┌──────────┐      ┌──────────┐
    │ 各业务线  │      │ 各技术组  │      │ 测试管理  │
    └──────────┘      └──────────┘      └──────────┘
```

**1.2 RACI矩阵（决策与审批）**

| 活动 | 指导委员会 | SCCB | PMO | 业务总体 | 技术总体 | 测试总体 |
|------|----------|------|-----|---------|---------|---------|
| 项目立项 | A | R | R | C | C | C |
| 范围基线发布 | A | R | R | C | C | C |
| 里程碑审批 | I | A | R | R | R | R |
| 变更审批(>5%) | A | R | R | C | C | C |
| 重大风险升级 | I | A | R | C | C | C |
| 周报审批 | I | I | A | R | R | R |
| 项目关闭 | A | R | R | C | C | C |

*R=Responsible, A=Accountable, C=Consulted, I=Informed*

**1.3 升版路径**

| 升版级别 | 触发条件 | 升版路径 | 响应时限 |
|---------|---------|---------|---------|
| L1-关注 | 问题组内无法解决 | 组长 → PM | 1周内 |
| L2-警告 | 影响里程碑 | PM → PMO | 3天内 |
| L3-升级 | 影响开业目标/超5% | PMO → SCCB | 24小时 |
| L4-危急 | 重大危机 | SCCB → 指导委员会 | 即时 |

---

### 2. 沟通管理计划

**2.1 沟通矩阵（摘要）**

| 干系人 | 干系人类别 | 沟通内容 | 频率 | 格式 | 负责人 | 发送时间 |
|--------|----------|---------|------|------|-------|---------|
| 行领导(指导委员会) | 决策层 | 里程碑状态、风险升级、战略决策请求 | 月度 | 高管简报(2页) | 项目总监 | 每月25日 |
| SCCB委员 | 审批层 | 变更审批包、基准变更、EVM状态 | 按需(≥月度) | 审批材料包 | PMO | SCCB前7天 |
| 业务部门负责人 | 重要干系人 | 需求状态、UAT进展、验收计划 | 周+里程碑 | 周报+里程碑报告 | BA/PMO | 周五/里程碑前5天 |
| PMO | 执行层 | 详细进展、风险、变更跟踪 | 周 | PMO周报(详细版) | 项目经理 | 每周五 |
| 核心开发组 | 执行层 | 任务分配、环境准备、技术决策 | 日/周 | 日站会纪要/周报 | SA/PM | 每日/每周五 |
| 测试组 | 执行层 | 测试进展、缺陷状态、测试环境 | 周 | 测试周报 | 测试PM | 每周五 |
| 外部供应商 | 外部 | 接口进展、交付物要求 | 周 | 供应商周报 | PM | 每周五 |

**2.2 报告模板清单**

| 报告名称 | 使用场景 | 发送方 | 接收方 | 内容要点 |
|---------|---------|-------|-------|---------|
| 高管简报 | 月度指导委员会 | PMO | 行领导 | 3项目状态、里程碑、风险、决策请求 |
| PMO周报 | 内部管控 | PM | PMO | 详细进展、EVM、风险、问题 |
| 业务周报 | 业务对接 | BA | 业务部门 | 需求进度、UAT、数据准备 |
| SCCB审批包 | 变更审批 | PMO | SCCB | 变更内容、影响分析、建议 |
| 里程碑报告 | 里程碑审查 | PMO | SCCB/业务 | 达成情况、偏差、后续计划 |
| 投产准备报告 | 投产前 | PMO | 行领导 | 投产就绪检查、应急预案 |

**2.3 例会排期**

| 会议 | 频率 | 时长 | 参加人 | 主持人 | 材料截止 |
|------|------|------|--------|-------|---------|
| 日站会 | 每日 | 15min | 执行层 | 值日PM | — |
| PMO周例会 | 每周 | 1h | PM+PMO | PMO经理 | 周四18:00 |
| SCCB例会 | 每月/按需 | 2h | SCCB委员+PMO | 项目总监 | 会前7天 |
| 指导委员会 | 月度/里程碑 | 2h | 指导委员会+PMO | 主任委员 | 会前10天 |
| 里程碑评审会 | 里程碑前1周 | 3h | 相关方全体 | PMO | 会前5天 |

---

## Quality Gates

- [ ] All three governance tiers (指导委员会/SCCB/PMO) have defined decision scope and meeting cadence
- [ ] Every critical role in the org structure has a named individual (not just a function)
- [ ] All escalation triggers have defined escalation paths and response timeframes
- [ ] Every stakeholder in the register has at least one communication action assigned
- [ ] Report templates cover all stakeholder types (executive/business/operational)
- [ ] Meeting schedule is aligned with milestone dates (no meetings scheduled during black-out periods)
- [ ] The governance package is reviewed at each phase transition

## Handoff Targets

| 下游Skill | 触发条件 | 交接内容 |
|-----------|---------|---------|
| wbs-schedule-milestone-orchestrator | 项目启动阶段 | 治理结构（执行组织与WBS工作组对应）、汇报路径 |
| project-oversight-risk-orchestrator | 例会/周报周期 | 升版路径、问题升级记录 |
| strategy-decision-facilitation | 重大战略决策触发 | 决策问题、干系人立场、治理背景 |
