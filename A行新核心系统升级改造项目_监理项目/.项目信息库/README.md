# A行新核心系统升级改造项目监理项目 - 项目信息库

**版本**：v1.0  
**创建日期**：2026年8月2日  
**信息来源**：项目章程v1.0.md  
**更新维护**：项目执行过程中持续更新

---

## 目录结构

```
.项目信息库/
├── README.md                    # 本文件（索引）
├── project_config.yaml           # 项目基础配置
├── project_background.yaml      # 项目背景与目标
├── project_scope.yaml           # 项目范围（In/Out Scope）
├── org_structure.yaml           # 组织架构（三层治理+执行组+RACI）
├── phases.yaml                 # 阶段规划（7阶段）
├── milestones.yaml              # 里程碑清单（14个）
├── deliverables.yaml            # 交付物清单（17项）
├── constraints.yaml            # 约束条件（4项）
├── assumptions.yaml            # 关键假设（5项）
├── success_criteria.yaml       # 成功衡量标准（5类）
├── top_risks.yaml              # 主要风险（Top 5）
├── communication.yaml          # 沟通管理机制
├── pending_matters.yaml        # 待明确事项（5项）
├── information_registry.yaml   # 信息项索引（来源/用途/完整性）
└── skill_info_needs.yaml       # Skill信息需求矩阵
```

---

## 信息库设计原则

1. **持久化存储**：所有项目信息存储在`.项目信息库/`目录，各Skill运行时从信息库读取，而非每次重新采集
2. **一次性采集**：同一信息仅需采集一次，所有用到该信息的Skill共享
3. **缺失标记**：未采集的信息标记为`[待采集]`，Skill运行时可快速定位
4. **来源追踪**：每条信息记录来源文件，便于追溯和更新
5. **完整性检查**：每个信息项标注`data_completeness`，缺失信息可快速定位

---

## 缺失信息清单（待采集）

| 信息项 | 涉及Skill | 采集方式 | 负责方 |
|--------|----------|---------|--------|
| 业务优先级清单 | wbs-builder | 向行方业务部门确认 | 行方业务部门 |
| 实施商名称及合同条款 | vendor-risk-assessment, deployment-planning | 向行方采购确认 | 行方采购部 |
| 监管报送要求明细 | compliance-check | 向行方合规部门索取 | 行方合规部 |
| 安全等级保护定级 | compliance-check | 向行方安全部门确认 | 行方安全部 |
| 硬件/基础设施到位计划 | deployment-planning | 向行方科技部索取 | 行方科技部 |
| EVM基线数据 | earned-value-tracker, etc-reestimation-helper | 项目启动后由PMO录入 | PMO |
| 干系人详细联系方式 | stakeholder-comms-planner | 项目启动后由PMO提供 | PMO |
| SCCB变更控制委员会成员 | change-control | 项目启动后确认 | 行方PMO |
| 风险偏好/阈值具体数值 | risk-register-builder | 向行方/PMO确认 | 行方风险部/PMO |

---

## Skill信息需求矩阵（已匹配）

| Skill | 信息状态 | 缺什么 | 何时采集 |
|--------|---------|--------|---------|
| milestone-planner | ✅ 完整 | — | — |
| risk-register-builder | ✅ 完整 | — | — |
| constraint-assumption-register-builder | ✅ 完整 | — | — |
| stakeholder-comms-planner | ✅ 完整 | — | — |
| org-structure-builder | ✅ 完整 | — | — |
| wbs-builder | ⚠️ 部分缺失 | 业务优先级清单 | 项目启动后 |
| schedule-sequencer | ✅ 完整（WBS后） | — | WBS完成后 |
| earned-value-tracker | ⚠️ 部分缺失 | EVM基线数据 | 项目执行中 |
| deployment-planning | ⚠️ 部分缺失 | 硬件到位计划 | 上线前1个月 |
| compliance-check | ⚠️ 部分缺失 | 监管要求/安全定级 | 项目启动后 |
| change-control | ⚠️ 部分缺失 | SCCB成员/变更阈值 | 项目启动后 |
| etc-reestimation-helper | ⚠️ 部分缺失 | EVM基线数据 | 项目执行中 |
| project-charter-writer | ✅ 完整 | — | — |
| closure-report-writer | ✅ 完整（收尾时） | — | — |
| lessons-learned-summarizer | ✅ 完整（收尾时） | — | — |
| cost-estimation-helper | ✅ 完整 | — | — |

---

*本信息库为项目全生命周期服务，执行新Skill前请先检查信息库完整性*
