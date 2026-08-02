# PMO领域 Agent & Skill 操作手册

> 本手册说明如何通过 Hermes Agent 调用 PMO 领域的 Agent 与 Skill，实现项目管理全流程智能化支持。

---

## 一、体系概览

PMO 领域共建设 **4个智能体 + 36个技能**（34个可用 + 2个已废弃）。

### 智能体（Agent）

| Agent ID | 中文名称 | 类型 | 职责定位 |
|----------|----------|------|----------|
| `project-control-agent` | 项目管控智能体 | `project-control` | 全局掌控、计划制定、风险识别、跨部门协调、架构需求管控 |
| `project-execution-agent` | 项目执行智能体 | `project-execution` | 日常执行跟踪、报告生成、会议纪要、规范检查、模板工具支持 |
| `project-inspection-agent` | 项目检查智能体 | `project-inspection` | 质量管理审查、供应商评估、合规审计与检查 |
| `strategic-execution-agent` | 战略推动智能体 | `strategic-execution` | 高层决策推动、关键阶段原则标准、组织治理体系、高层沟通 |

### 技能分类（按项目管控域）

| 类别 | PMC/PMO编号 | Skill | 说明 |
|------|-------------|-------|------|
| **战略决策** | PMO-01 | `strategy-decision-facilitation` | 引导战略决策流程 |
|**战略决策**|PMO-21|`strategy-charter-orchestrator`|战略→章程→里程碑→WBS→进度编排链|
| **项目立项** | PMO-02 | `project-charter-writer` | 编写项目管理章程 |
| **项目立项** | PMO-03 | `org-structure-builder` | 设计项目组织架构 |
| **项目立项** | PMO-04 | `executive-communication` | 高管级沟通材料 |
| **项目规划** | PMO-05 | `project-oversight` | 项目监控与偏差分析 |
|**项目规划**|PMO-24|`project-oversight-risk-orchestrator`|监控+风险联动编排链|
| **项目规划** | PMO-06 | `wbs-builder` | WBS工作分解结构 |
| **项目规划** | PMO-07 | `risk-register-builder` | 风险登记册 |
| **项目规划** | PMC-002 | `constraint-assumption-register-builder` | 约束与假设登记册 |
| **项目规划** | PMO-09 | `milestone-planner` | 里程碑规划 |
|**项目规划**|PMO-22|`wbs-schedule-milestone-orchestrator`|WBS→进度→里程碑编排链|
| **进度管理** | PMC-003 | `schedule-sequencer` | 进度排序（关键路径法） |
| **成本管理** | PMC-004 | `cost-estimation-helper` | 成本估算 |
| **成本管理** | PMC-005 | `etc-reestimation-helper` | ETC重新估算 |
| **成本管理** | PMO-13 | `earned-value-tracker` | 挣值绩效跟踪 |
|**成本管理**|PMO-23|`earned-value-evm-orchestrator`|EVM全链条编排|
| **质量管理** | PMO-10 | `architecture-review` | 架构评审 |
| **质量管理** | PMO-11 | `requirements-control` | 需求评审 |
| **质量管理** | PMO-15 | `compliance-check` | 合规检查 |
|**质量管理**|PMC-010|`ethics-management-plan-writer`|伦理合规管理计划|
| **沟通协调** | PMO-06 | `stakeholder-comms-planner` | 干系人沟通计划 |
| **沟通协调** | PMO-08 | `cross-dept-coordination` | 跨部门协调 |
|**沟通协调**|PMO-25|`cross-dept-solution-orchestrator`|跨部门问题解决编排|
|**沟通协调**|PMO-26|`org-stakeholder-communication-orchestrator`|组织+沟通联动编排|
| **范围与需求** | PMC-001 | `scope-boundary-checker` | *(已废弃)* |
| **范围与需求** | PMC-001+007 | `scope-management` | 统一范围管理 |
| **范围与需求** | PMC-007 | `inclusions-exclusions-writer` | *(已废弃)* |
| **项目执行** | PMO-16 | `meeting-notes` | 会议纪要 |
| **项目执行** | PMO-14 | `report-generation` | 项目报告生成 |
| **项目执行** | PMO-17 | `template-management` | 文档模板管理 |
| **项目执行** | PMO-18 | `config-item-management` | 配置项管理 |
| **项目执行** | PMO-19 | `change-control` | 变更控制 |
| **项目执行** | PMO-12 | `deployment-planning` | 投产规划 |
| **项目执行** | PMO-20 | `solution-generation` | 解决方案生成 |
|**供应商管理**|PMC-011|`vendor-risk-assessment`|供应商风险评估|
| **项目收尾** | PMC-008 | `closure-report-writer` | 项目关闭报告 |
| **经验总结** | PMC-009 | `lessons-learned-summarizer` | 经验教训总结 |

---

## 二、编排链（Orchestrator Skill）

编排链技能可一键触发多技能联动，适合复杂场景：

### 六大编排链

```
① strategy-charter-orchestrator（战略决策编排）
   strategy-decision-facilitation → project-charter-writer → org-structure-builder

② wbs-schedule-milestone-orchestrator（WBS进度里程碑编排）
   wbs-builder → schedule-sequencer → milestone-planner

③ earned-value-evm-orchestrator（挣值管理编排）
   earned-value-tracker → etc-reestimation-helper

④ project-oversight-risk-orchestrator（项目监控与风险编排）
   project-oversight → risk-register-builder

⑤ org-stakeholder-communication-orchestrator（组织与沟通联动编排）
   org-structure-builder → stakeholder-comms-planner

⑥ cross-dept-solution-orchestrator（跨部门问题解决编排）
   cross-dept-coordination → solution-generation
```

---

## 三、Agent与Skill调用方式

### 3.1 通过Hermes Agent调用Skill

在Hermes Agent中，使用以下方式触发Skill：

```
@hermes load skill:<skill-name>

示例：
  @hermes load skill:project-charter-writer
  @hermes load skill:milestone-planner
```

加载后，Agent会读取该Skill的完整指令内容并按流程执行。

### 3.2 Agent职责分配建议

| 项目阶段 | 主责Agent | 辅助Skill |
|----------|----------|-----------|
| 项目立项与战略决策 | `strategic-execution-agent` | `strategy-decision-facilitation` → `project-charter-writer` → `org-structure-builder` |
|项目规划（WBS/进度/里程碑）|PMO-22|`wbs-schedule-milestone-orchestrator`|
|项目规划（成本/EVM）|PMO-23|`earned-value-evm-orchestrator`|
|项目规划（风险）|PMO-24|`project-oversight-risk-orchestrator`|
| 日常执行与报告 | `project-execution-agent` | `meeting-notes` + `report-generation` |
| 变更与配置管理 | `project-execution-agent` | `change-control` + `config-item-management` |
| 质量管理/合规检查 | `project-inspection-agent` | `compliance-check` + `architecture-review` |
|供应商管理|PMC-011|`vendor-risk-assessment`|
|跨部门协调|PMO-25|`cross-dept-solution-orchestrator`|
| 项目关闭 | `project-execution-agent` | `closure-report-writer` + `lessons-learned-summarizer` |

---

## 四、典型业务场景调用指南

### 场景1：新项目立项启动

**目标：** 完成从战略决策到项目章程编写的全流程。

**调用编排链：**
```
load skill:strategy-charter-orchestrator
```

**触发后输入：**
- 战略问题描述
- 干系人及其立场
- 业务背景与约束
- 决策标准（如已知）

**编排链自动依次调用：**
1. `strategy-decision-facilitation` — 引导战略决策
2. `project-charter-writer` — 编写项目章程
3. `org-structure-builder` — 设计组织架构

---

### 场景2：制定项目三层计划（WBS + 进度 + 里程碑）

**目标：** 获得L1/L2/L3计划体系和里程碑清单。

**调用编排链：**
```
load skill:wbs-schedule-milestone-orchestrator
```

**触发后输入：**
- 项目范围说明书
- 项目阶段划分
- 工作包初步清单（如有）
- 工期估算依据

**编排链自动依次调用：**
1. `wbs-builder` — 分解三层WBS
2. `schedule-sequencer` — 关键路径排序
3. `milestone-planner` — 定义四类里程碑

---

### 场景3：月度EVM绩效评估与重新估算

**目标：** 获得当月EVM绩效报告 + ETC重新估算结果。

**调用编排链：**
```
load skill:earned-value-evm-orchestrator
```

**触发后输入：**
- 当月PV、AC、EV数据
- 原始项目基线
- 绩效分析需求

**编排链自动依次调用：**
1. `earned-value-tracker` — 计算SPI/CPI/EAC
2. `etc-reestimation-helper` — ETC重新估算

---

### 场景4：项目监控与风险更新（月度/季度）

**目标：** 偏差分析报告 + 更新的风险登记册。

**调用编排链：**
```
load skill:project-oversight-risk-orchestrator
```

**触发后输入：**
- 最新项目进度数据
- 问题日志
- 原有风险登记册

**编排链自动依次调用：**
1. `project-oversight` — 进度偏差分析
2. `risk-register-builder` — 风险更新

---

### 场景5：跨部门问题解决

**目标：** 系统性解决影响多个部门的复杂问题。

**调用编排链：**
```
load skill:cross-dept-solution-orchestrator
```

**触发后输入：**
- 问题描述
- 涉及的部门
- 已有数据和分析

**编排链自动依次调用：**
1. `cross-dept-coordination` — 跨部门协调机制
2. `solution-generation` — 多方案生成评估

---

### 场景6：召开项目会议并生成纪要

**目标：** 结构化记录会议决议并跟踪行动项。

**直接调用：**
```
load skill:meeting-notes
```

**触发后输入：**
- 会议基本信息（时间、地点、参会人、主持人）
- 会议主题和议程
- 讨论内容摘要
- 决议事项
- 行动项（责任人、完成时间）

---

### 场景7：编写项目章程

**目标：** 输出符合银行IT项目规范的项目管理章程。

**直接调用：**
```
load skill:project-charter-writer
```

**触发后输入：**
- 问题/机会陈述
- 项目目标
- 已知干系人
- 约束条件
- 成功标准（如已知）

---

### 场景8：合规检查（每月/每季度）

**目标：** 输出合规检查报告，识别不符合项并推动整改。

**直接调用：**
```
load skill:compliance-check
```

**触发后输入：**
- 项目管理制度
- 合规性要求（监管文件）
- 检查周期
- 前期审计结果（如有）

---

### 场景9：供应商风险评估

**目标：** 获得供应商准入/存量评估的综合评分与采购建议。

**直接调用：**
```
load skill:vendor-risk-assessment
```

**触发后输入：**
- 供应商名称
- 资质合规材料
- 历史绩效数据
- 技术风险评估资料

---

### 场景10：项目关闭与经验总结

**目标：** 正式关闭项目，输出关闭报告和经验教训总结。

**直接调用：**
```
load skill:closure-report-writer
load skill:lessons-learned-summarizer
```

**触发后输入：**
- 项目最终状态（完成/取消/终止）
- 所有项目记录归档位置
- 经验教训素材

---

## 五、Skill调用入口速查

### 按字母序（34个可用Skill）

| Skill ID | display_name |
|----------|-------------|
| `architecture-review` | 架构评审报告 |
| `change-control` | 变更申请单 |
| `closure-report-writer` | 项目关闭报告 |
| `compliance-check` | 合规检查报告 |
| `config-item-management` | 配置项登记册 |
| `constraint-assumption-register-builder` | 约束与假设登记册 |
| `cost-estimation-helper` | 成本估算申请表 |
| `cross-dept-coordination` | 跨部门资源共享协议 |
PMO-25|`cross-dept-solution-orchestrator`|跨部门问题解决编排|
| `deployment-planning` | 投产规划方案 |
PMO-23|`earned-value-evm-orchestrator`|挣值管理编排|
| `earned-value-tracker` | EVM绩效报告 |
| `etc-reestimation-helper` | ETC重新估算申请表 |
PMC-010|`ethics-management-plan-writer`|伦理合规管理计划|
| `executive-communication` | 高管简报 |
| `lessons-learned-summarizer` | 经验教训总结报告 |
| `meeting-notes` | 会议纪要 |
| `milestone-planner` | 里程碑规划报告 |
PMO-26|`org-stakeholder-communication-orchestrator`|组织与干系人沟通编排|
| `org-structure-builder` | 组织架构说明书 |
| `project-charter-writer` | 项目管理章程 |
| `project-oversight` | 偏差分析报告 |
PMO-24|`project-oversight-risk-orchestrator`|项目监控与风险编排|
| `report-generation` | 项目报告 |
| `requirements-control` | 需求评审报告 |
| `risk-register-builder` | 风险登记册 |
| `schedule-sequencer` | 进度计划书 |
| `scope-management` | 范围管理计划 |
| `solution-generation` | 解决方案生成 |
| `stakeholder-comms-planner` | 干系人沟通计划 |
PMO-21|`strategy-charter-orchestrator`|战略决策编排|
| `strategy-decision-facilitation` | 战略决策报告 |
| `template-management` | 项目文档模板库 |
PMC-011|`vendor-risk-assessment`|供应商风险评估报告|
| `wbs-builder` | WBS工作分解结构 |
PMO-22|`wbs-schedule-milestone-orchestrator`|WBS进度里程碑编排|

---

## 六、质量保障（Quality Gates）

各Skill内置质量门，确保输出符合标准：

| Skill | Quality Gate 检查项 |
|-------|---------------------|
| `project-charter-writer` | 范围/目标/干系人/治理结构/交付物清单 5项必填 |
| `milestone-planner` | 入口/出口标准定义、审计轨迹、状态流转合规 |
| `earned-value-tracker` | 数据来源可追溯、公式正确、阈值判断明确 |
| `meeting-notes` | 决议明确、行动项落实到人、下次会议安排 |
| `compliance-check` | 检查项覆盖100%、不符合项有整改计划 |
| `risk-register-builder` | 原因/影响/概率/应对/责任人 五要素完整 |
| `closure-report-writer` | 交付物清单核验、经验教训提取、档案完整性 |
PMC-011|`vendor-risk-assessment`|五维度（资质/绩效/技术/运营/合规）缺一不可|

---

## 七、注意事项

1. **编排链优先原则**：复杂场景优先使用编排链（6个），确保多技能衔接顺畅，避免手工拼装。
2. **数据完整性**：调用Skill前尽量提供完整的输入信息，输出质量与输入完整性正相关。
3. **跨Skill一致性**：同一项目使用多个Skill时，保持项目名称、干系人术语、编号规则一致。
4. **废弃Skill不可用**：`scope-boundary-checker`（PMC-001）和`inclusions-exclusions-writer`（PMC-007）已废弃，请改用`scope-management`。
5. **合规前置**：涉及监管合规（银保监、人行等）的Skill输出，建议经业务部门确认后再作为正式文档使用。

---

## 附录：验收测试结果（2026年08月02日）

| 测试类型 | 用例数 | 通过数 | 通过率 |
|---------|-------|-------|-------|
| 业务场景测试 | 23 | 23 | 100% |
| 接口规范测试 | 36 | 36 | 100% |
| 编排链路测试 | 6 | 6 | 100% |
| 废弃隔离测试 | 2 | 2 | 100% |
| **合计** | **67** | **67** | **100%** |

**Skill评级分布**：A级 0个 / B级 35个 / C级 1个（milestone-planner）

**整体结论**：✅ 全部通过，体系已达生产就绪水准。
