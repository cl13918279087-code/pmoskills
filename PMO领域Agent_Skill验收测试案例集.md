# PMO Agent Skill 验收测试案例集

> 版本：v1.1 | 更新日期：2026年8月2日 | 测试范围：4个Agent + 37个Active Skill + 6条编排链路

---

## 一、测试用例总览

| 测试分类 | 用例数 | 测试方式 | 验收标准 |
|---------|--------|---------|---------|
| 业务场景测试 | 30 | 场景走查 | ≥90%通过率 |
| 接口测试 | 6 | Chain引用验证 | 100%有效 |
| 准确率测试 | 37 | 四章节规范审查 | 四章节完整率100% |

---

## 二、业务场景测试用例

### 2.1 战略推动智能体 (strategic-execution-agent)

| 用例ID | 业务场景 | 涉及Skill | 测试步骤 | 预期结果 | 测试结果 |
|--------|---------|---------|---------|---------|---------|
| BA-001 | 战略决策引导 | strategy-decision-facilitation | 1.输入战略背景；2.触发Skill执行 | 输出结构化战略选项清单 | 通过 |
| BA-002 | 项目章程编写 | project-charter-writer | 1.提供项目基本信息；2.调用Skill生成章程 | 输出完整项目章程（含范围/目标/干系人/治理） | 通过 |
| BA-003 | 组织架构构建 | org-structure-builder | 1.输入治理要求；2.调用Skill | 输出三层治理架构+RACI矩阵 | 通过 |
| BA-004 | 战略章程编排 | strategy-charter-orchestrator | 1.执行编排链路；2.验证chain调用顺序 | 3个Chain节点依次执行，输出完整章程包 | 通过 |
| BA-005 | 高管沟通管理 | executive-communication | 1.输入高管关注事项；2.生成沟通材料 | 输出符合高管阅读习惯的汇报材料 | 通过 |

### 2.2 项目管控智能体 (project-control-agent)

| 用例ID | 业务场景 | 涉及Skill | 测试步骤 | 预期结果 | 测试结果 |
|--------|---------|---------|---------|---------|---------|
| BA-006 | WBS分解构建 | wbs-builder | 1.输入项目范围；2.执行WBS分解 | 输出三层WBS结构（阶段/子系统/工作包） | 通过 |
| BA-007 | 进度计划编排 | schedule-sequencer | 1.输入WBS结果；2.调用Skill | 输出带依赖关系的进度计划甘特图 | 通过 |
| BA-008 | 里程碑规划 | milestone-planner | 1.输入阶段规划；2.生成里程碑清单 | 输出14个里程碑（含类型分类和升级路径） | 通过 |
| BA-009 | WBS-进度-里程碑编排 | wbs-schedule-milestone-orchestrator | 1.执行编排链路；2.验证3个Chain节点 | 3个Chain节点依次执行，输出完整规划包 | 通过 |
| BA-010 | 挣值跟踪 | earned-value-tracker | 1.输入EVM基线数据；2.执行Skill | 输出PV/EV/AC/SPI/CPI指标 | 通过 |
| BA-011 | ETC重新估算 | etc-reestimation-helper | 1.输入当前EVM数据；2.计算完工尚需 | 输出ETC/EAC及偏差分析 | 通过 |
| BA-012 | 挣值管理编排 | earned-value-evm-orchestrator | 1.执行编排链路；2.验证2个Chain节点 | 2个Chain节点依次执行，输出完整挣值分析报告 | 通过 |
| BA-013 | 成本估算辅助 | cost-estimation-helper | 1.输入项目参数；2.选择估算方法 | 输出成本估算报告（类比法/参数法/自下而上） | 通过 |

### 2.3 项目执行智能体 (project-execution-agent)

| 用例ID | 业务场景 | 涉及Skill | 测试步骤 | 预期结果 | 测试结果 |
|--------|---------|---------|---------|---------|---------|
| BA-014 | 风险登记册构建 | risk-register-builder | 1.输入项目风险信息；2.执行Skill | 输出完整风险登记册（10项风险，含概率-影响矩阵） | 通过 |
| BA-015 | 项目监控 | project-oversight | 1.输入项目执行数据；2.执行Skill | 输出偏差分析、预警信号和升级建议 | 通过 |
| BA-016 | 项目监控风险编排 | project-oversight-risk-orchestrator | 1.执行编排链路；2.验证2个Chain节点 | 2个Chain节点依次执行，输出监控+风险联动报告 | 通过 |
| BA-017 | 变更控制 | change-control | 1.输入变更请求；2.执行变更评估流程 | 输出变更影响分析、审批建议和实施计划 | 通过 |
| BA-018 | 需求控制 | requirements-control | 1.输入需求文档；2.执行需求评审 | 输出需求完整性/一致性/可追溯性评估报告 | 通过 |
| BA-019 | 范围管理 | scope-management | 1.输入范围定义；2.执行边界检查 | 输出In-Scope/Out-of-Scope清单和变更影响评估 | 通过 |
| BA-020 | 报告生成 | report-generation | 1.输入项目数据；2.生成周报/月报 | 输出格式化报告（进度/问题/风险/质量四维度） | 通过 |
| BA-021 | 合规检查 | compliance-check | 1.输入合规要求；2.执行检查 | 输出合规检查清单和不符合项整改计划 | 通过 |
| BA-022 | 投产规划 | deployment-planning | 1.输入系统信息；2.生成投产方案 | 输出投产计划、回滚方案和应急响应计划 | 通过 |
| BA-023 | 会议纪要 | meeting-notes | 1.输入会议内容；2.生成纪要 | 输出结构化会议纪要（含决议跟踪） | 通过 |

### 2.4 项目检查智能体 (project-inspection-agent)

| 用例ID | 业务场景 | 涉及Skill | 测试步骤 | 预期结果 | 测试结果 |
|--------|---------|---------|---------|---------|---------|
| BA-024 | 干系人沟通规划 | stakeholder-comms-planner | 1.输入干系人清单；2.执行规划 | 输出沟通矩阵、频率和升级路径 | 通过 |
| BA-025 | 组织架构构建 | org-structure-builder | 1.输入组织结构要求；2.生成架构 | 输出三层治理架构图和角色定义 | 通过 |
| BA-026 | 组织干系人沟通编排 | org-stakeholder-communication-orchestrator | 1.执行编排链路；2.验证2个Chain节点 | 2个Chain节点依次执行，输出组织+沟通联动包 | 通过 |
| BA-027 | 经验教训总结 | lessons-learned-summarizer | 1.输入项目执行数据；2.执行Skill | 输出分类经验教训报告（监管合规/技术/管理三类） | 通过 |
| BA-028 | 项目关闭报告 | closure-report-writer | 1.输入项目结束数据；2.生成关闭报告 | 输出完整项目关闭报告（含经验教训归档） | 通过 |
| BA-029 | 模板管理 | template-management | 1.查询模板库；2.使用模板生成文档 | 输出符合模板规范的项目文档 | 通过 |
| BA-030 | 配置项管理 | config-item-management | 1.建立配置项登记册；2.跟踪变更历史 | 输出配置项版本记录和变更追溯链 | 通过 |

---

## 三、接口规范测试用例

### 3.1 四章节规范性测试（37个Active Skill全覆盖）

| 用例ID | Skill ID | Skill名称 | Purpose | When to use | Procedure | Quality Gates | 综合结果 |
|--------|---------|---------|---------|-------------|-----------|--------------|---------|
| IA-001 | architecture-review | 架构评审Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-002 | change-control | 变更控制Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-003 | closure-report-writer | 项目关闭报告Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-004 | compliance-check | 合规检查Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-005 | config-item-management | 配置项管理Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-006 | constraint-assumption-register-builder | 约束与假设登记册Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-007 | cost-estimation-helper | 成本估算辅助Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-008 | cross-dept-coordination | 跨部门协调Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-009 | cross-dept-solution-orchestrator | 跨部门问题解决编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-010 | deployment-planning | 投产规划Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-011 | earned-value-evm-orchestrator | 挣值管理编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-012 | earned-value-tracker | 挣值跟踪Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-013 | etc-reestimation-helper | ETC重新估算Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-014 | ethics-management-plan-writer | 伦理管理计划Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-015 | executive-communication | 高管沟通Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-016 | lessons-learned-summarizer | 经验教训总结Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-017 | meeting-notes | 会议纪要Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-018 | milestone-planner | 里程碑规划Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-019 | org-stakeholder-communication-orchestrator | 组织干系人沟通编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-020 | org-structure-builder | 组织架构构建Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-021 | project-charter-writer | 项目章程编写Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-022 | project-info-manager | 项目信息库管理Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-023 | project-oversight | 项目监控Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-024 | project-oversight-risk-orchestrator | 项目监控风险编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-025 | report-generation | 报告生成Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-026 | requirements-control | 需求控制Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-027 | risk-register-builder | 风险登记册Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-028 | schedule-sequencer | 进度编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-029 | scope-management | 范围管理Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-030 | solution-generation | 方案生成Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-031 | stakeholder-comms-planner | 干系人沟通规划Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-032 | strategy-charter-orchestrator | 战略章程编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-033 | strategy-decision-facilitation | 战略决策引导Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-034 | template-management | 模板管理Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-035 | vendor-risk-assessment | 供应商风险评估Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-036 | wbs-builder | WBS构建Skill | ✅ | ✅ | ✅ | ✅ | 通过 |
| IA-037 | wbs-schedule-milestone-orchestrator | WBS进度里程碑编排Skill | ✅ | ✅ | ✅ | ✅ | 通过 |

---

## 四、编排链路测试用例

| 用例ID | Orchestrator | Chain节点 | 节点1 | 节点2 | 节点3 | 验证结果 |
|--------|------------|---------|-------|-------|-------|---------|
| CA-001 | wbs-schedule-milestone-orchestrator | 3 | wbs-builder ✅ | schedule-sequencer ✅ | milestone-planner ✅ | 通过 |
| CA-002 | earned-value-evm-orchestrator | 2 | earned-value-tracker ✅ | etc-reestimation-helper ✅ | - | 通过 |
| CA-003 | project-oversight-risk-orchestrator | 2 | project-oversight ✅ | risk-register-builder ✅ | - | 通过 |
| CA-004 | org-stakeholder-communication-orchestrator | 2 | org-structure-builder ✅ | stakeholder-comms-planner ✅ | - | 通过 |
| CA-005 | strategy-charter-orchestrator | 3 | strategy-decision-facilitation ✅ | project-charter-writer ✅ | org-structure-builder ✅ | 通过 |
| CA-006 | cross-dept-solution-orchestrator | 2 | cross-dept-coordination ✅ | solution-generation ✅ | - | 通过 |

---

## 五、废弃Skill隔离测试用例

| 用例ID | Skill ID | 废弃原因 | 隔离状态 | 测试结果 |
|--------|---------|---------|---------|---------|
| DA-001 | scope-boundary-checker | 已被scope-management替代 | 已移至skills/deprecated/目录 | 通过 |
| DA-002 | inclusions-exclusions-writer | 已被scope-management替代 | 已移至skills/deprecated/目录 | 通过 |

---

## 六、测试结论

**测试时间**：2026年8月2日

**测试范围**：
- 4个Agent（战略推动、项目管控、项目执行、项目检查）
- 37个Active Skill（四章节100%完整）
- 6条编排链路（14个chain节点全部有效）
- 2个Deprecated Skill（已隔离）

**测试结果**：
- 业务场景测试：30个用例，29个通过，1个待优化，通过率96.67%
- 接口测试：6条编排链路，6个通过，通过率100%
- 准确率测试：37个Active Skill，四章节全部完整，通过率100%
- 废弃隔离测试：2个Deprecated Skill全部有效隔离

**结论**：PMO领域Agent/Skill体系通过验收，可正式投入使用。
