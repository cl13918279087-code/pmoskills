# PMO领域Agent_Skill操作手册

> 版本：v2.1 | 编制：BUCON-PMO | 日期：2026年8月2日

---

## 1 概述

本手册适用于PMO领域Agent与Skill的使用、管理和维护。所有Agent和Skill均通过Hermes Agent平台统一管理和调用。

### 1.1 Agent清单（4个）

| 序号 | Agent名称 | Agent ID | 主要职责 |
|------|---------|---------|---------|
| 1 | 战略推动智能体 | strategic-execution-agent | 战略决策推动、项目章程编写、组织架构设计 |
| 2 | 项目管控智能体 | project-control-agent | WBS分解、进度计划、挣值管理、成本估算 |
| 3 | 项目执行智能体 | project-execution-agent | 风险登记、项目监控、变更控制、投产规划 |
| 4 | 项目检查智能体 | project-inspection-agent | 干系人沟通、经验教训、关闭报告、质量检查 |

### 1.2 Skill清单

PMO领域共有**37个Active Skill**，2个Deprecated Skill（已隔离）。

| 类别 | 数量 | 说明 |
|------|------|------|
| 编排类（Orchestrator） | 6个 | 负责多Skill联合编排 |
| 生成类 | 8个 | 负责文档、报告、计划等生成 |
| 管控类 | 12个 | 负责范围/变更/需求/配置等管理 |
| 分析类 | 5个 | 负责挣值、风险、成本等分析 |
| 辅助类 | 6个 | 负责会议纪要、模板管理、信息库等支撑 |

### 1.3 编排链路（6条）

| Orchestrator | Chain流程 |
|------------|---------|
| wbs-schedule-milestone-orchestrator | wbs-builder → schedule-sequencer → milestone-planner |
| earned-value-evm-orchestrator | earned-value-tracker → etc-reestimation-helper |
| project-oversight-risk-orchestrator | project-oversight → risk-register-builder |
| org-stakeholder-communication-orchestrator | org-structure-builder → stakeholder-comms-planner |
| strategy-charter-orchestrator | strategy-decision-facilitation → project-charter-writer → org-structure-builder |
| cross-dept-solution-orchestrator | cross-dept-coordination → solution-generation |

---

## 2 Agent使用说明

### 2.1 战略推动智能体

- **主用Skill**：strategy-decision-facilitation、project-charter-writer、strategy-charter-orchestrator
- **调用方式**：在Hermes平台输入项目背景，触发战略决策引导流程

### 2.2 项目管控智能体

- **主用Skill**：wbs-builder、schedule-sequencer、milestone-planner、earned-value-tracker
- **调用方式**：输入项目范围和阶段规划，触发WBS-进度-里程碑编排链路

### 2.3 项目执行智能体

- **主用Skill**：risk-register-builder、project-oversight、change-control
- **调用方式**：输入项目执行数据，触发项目监控风险编排链路

### 2.4 项目检查智能体

- **主用Skill**：stakeholder-comms-planner、lessons-learned-summarizer、closure-report-writer
- **调用方式**：输入项目结束数据，触发项目关闭报告生成

---

## 3 Skill管理规范

### 3.1 新增Skill流程

1. 在`~/.hermes/skills/project-management/skills/`下创建Skill目录
2. 编写SKILL.md，包含四章节（Purpose/When to use/Procedure/Quality Gates）
3. 更新pack.yaml，注册新Skill
4. 执行验收测试，确认四章节完整

### 3.2 废弃Skill处理

- 废弃Skill移至`~/.hermes/skills/project-management/skills/deprecated/`目录
- 在pack.yaml中保留引用但标注deprecated状态

---

## 4 附录

### 4.1 核心指标

| 指标 | 数值 |
|------|------|
| Agent数量 | 4个 |
| Active Skill数量 | 37个 |
| Deprecated Skill数量 | 2个（已隔离） |
| 编排链路数量 | 6条 |
| 四章节完整率 | 100% |
| 平均字符数/Skill | 9,360字符 |
| 验收通过率 | 100% |

### 4.2 验收测试结论

所有37个Active Skill均通过验收测试，四章节100%完整，0个P0/P1/P2缺陷。详见《PMO Agent Skill 验收测试报告.docx》。
