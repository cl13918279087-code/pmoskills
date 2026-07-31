---
name: "earned-value-tracker"
pack: "project-management-pack"
display_name: "EVM绩效报告"
description: "使用挣值管理（EVM）指标（PV/AC/EV、SPI/CPI、EAC）跟踪和报告银行IT项目的成本与进度绩效，输出标准化的EVM绩效报告。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
---
earned-value-tracker

## Purpose

Track and report cost and schedule performance of banking IT projects using Earned Value Management (EVM). Provides SPI/CPI indicators with RAG thresholds, variance interpretation, and actionable next-step commentary for PMO and SCCB review cycles.

This skill is the **data collection and calculation engine** for the EVM control loop. It does NOT make re-estimation decisions — that is handled by `etc-reestimation-helper` after this skill produces its indicators.

## When to use

Invoke this skill when:
- **Weekly or monthly project status reporting cycle** (every Friday / last business day of month)
- **Before SCCB or PMO review meetings** — EVM indicators must be current
- **When a project phase completes** — update BAC baseline and report phase-end EVM
- **When any deviation threshold is breached** — SPI or CPI crosses RAG boundary
- **As input to `etc-reestimation-helper`** — this skill's outputs feed the re-estimation chain

**Trigger frequency:** Weekly at minimum; immediately when any 🔴 threshold is breached.

## Expected Inputs

### Required Inputs

| Input | Description | Example |
|-------|-------------|---------|
| planned_value_data | Planned Value by milestone/WBS element (PV, baseline) | `{里程碑A: 100万, 里程碑B: 200万}` |
| earned_value_data | Earned Value by milestone/WBS element (EV, completed work) | `{里程碑A: 完成, 里程碑B: 50%}` |
| actual_cost_data | Actual Cost from financial system (AC) | `{人工: 80万, 第三方: 30万}` |
| schedule_context | Current project phase, active milestones, go-live date | "系统设计阶段，里程碑C进行中" |

### Optional Inputs

| Input | Description |
|-------|-------------|
| BAC | Budget at Completion (initial approved budget) |
| baseline_dates | Original milestone target dates |
| previous_period_data | Last cycle's EVM indicators for trend analysis |

## EVM Core Formulas

### Fundamental Metrics

| Metric | Formula | Unit | Description |
|--------|---------|------|-------------|
| **PV** | — | ¥ | Planned Value: budget authorized for work scheduled |
| **EV** | — | ¥ | Earned Value: budget for completed work |
| **AC** | — | ¥ | Actual Cost: actual spending |
| **BAC** | — | ¥ | Budget at Completion: total approved budget |
| **EAC** | varies | ¥ | Estimated at Completion: forecasted final cost |
| **VAC** | BAC − EAC | ¥ | Variance at Completion |
| **SPI** | EV / PV | ratio | Schedule Performance Index |
| **CPI** | EV / AC | ratio | Cost Performance Index |
| **TCPI** | (BAC−EV) / (EAC−AC) | ratio | To-Complete Performance Index |

### EAC Formulas (Three Standard Scenarios)

| Scenario | Formula | Use When | Bank Threshold |
|----------|---------|---------|----------------|
| **典型偏差 (Typical)** | `EAC = BAC / CPI` | Cost偏差为系统性问题，未来维持当前效率 | CPI < 0.95 |
| **非典型偏差 ( Atypical)** | `EAC = AC + (BAC − EV)` | 一次性异常（如疫情），不延续 | 重大单次事件 |
| **复合偏差 (Combined)** | `EAC = AC + (BAC − EV) / (CPI × SPI)` | 进度+成本均偏差 | SPI < 0.95 AND CPI < 0.95 |

### RAG Threshold Table (银行项目)

| Indicator | 🟢 Green | 🟡 Yellow | 🔴 Red |
|-----------|----------|-----------|--------|
| **SPI** | ≥ 0.95 | 0.85 – 0.94 | < 0.85 |
| **CPI** | ≥ 0.95 | 0.85 – 0.94 | < 0.85 |
| **VAC** | ≥ 0 (on/below budget) | — | < 0 (over budget) |
| **TCPI** | ≤ 1.0 | 1.0 – 1.1 | > 1.1 |

> **Note:** 银行IT项目通常SPI/CPI阈值略严于行业标准（行业常用0.95绿/0.90红），因银行监管要求更严格。

## Procedure
## Operating Procedure

### Step 1 — 数据收集与校验

**收集以下数据（来源标注清楚）：**

1. **PV数据**：从L3计划提取每个WBS元素的计划预算，按周期汇总
2. **EV数据**：根据里程碑完成情况 + 工作包%完成，计算挣值
3. **AC数据**：从财务系统导出实际支出（按成本类型：人工/第三方/硬件/软件）
4. **BAC**：确认当前批准的预算基线

**数据质量检查：**
- [ ] PV + EV + AC 数据时间口径一致（同一周期）
- [ ] EV ≤ PV + 10%（超产检查，防止数据错误）
- [ ] AC来源标注（财务系统导出 vs 人工估算）
- [ ] 变更已反映在数据中（范围变更后基线已更新）

**输出：** 数据收集清单（含每项数据来源）

### Step 2 — EVM指标计算

**计算顺序：**

```
1. EV = Σ(每个里程碑权重 × 完成百分比)
2. PV = Σ(每个里程碑预算 × 计划完成百分比)
3. AC = 实际人工成本 + 实际第三方成本 + 实际其他成本
4. CV = EV − AC     (成本偏差)
5. SV = EV − PV     (进度偏差)
6. CPI = EV / AC    (成本绩效)
7. SPI = EV / PV    (进度绩效)
8. VAC = BAC − EAC  (完工偏差)
```

**S曲线数据点（按周期）：**

生成以下周期的S曲线数据点（用于绘制挣值曲线图）：

| 周期 | PV | EV | AC | SPI | CPI |
|------|----|----|----|-----|-----|
| Week 1 | X | X | X | X.XX | X.XX |
| Week 2 | X | X | X | X.XX | X.XX |
| ... | ... | ... | ... | ... | ... |

**输出：** EVM计算表（含每步计算公式和结果）

### Step 3 — RAG状态判定

**对每个指标判定RAG状态：**

```
IF SPI ≥ 0.95 → 🟢 Green
ELIF SPI ≥ 0.85 → 🟡 Yellow  
ELSE → 🔴 Red  → 触发 etc-reestimation-helper 评估

IF CPI ≥ 0.95 → 🟢 Green
ELIF CPI ≥ 0.85 → 🟡 Yellow
ELSE → 🔴 Red  → 触发 etc-reestimation-helper 评估
```

**组合风险判定：**

| SPI | CPI | 综合评级 | 行动 |
|------|------|---------|------|
| 🟢 | 🟢 | 正常 | 正常报告 |
| 🟡 | 🟢/🟡 | 关注 | 增加进度监控频率 |
| 🟢/🟡 | 🟡 | 关注 | 增加成本监控频率 |
| 🔴 | 🔴 | 严重 | 立即触发 etc-reestimation-helper + 通知PMO |
| 🟡 | 🔴 | 严重 | 触发 etc-reestimation-helper |
| 🔴 | 🟡 | 严重 | 触发 etc-reestimation-helper |

**输出：** RAG状态表 + 里程碑偏差明细表

### Step 4 — 偏差分析报告撰写

**结构化偏差分析（每项🔴指标必须包含）：**

```
🔴 [指标名称，如SPI=0.78]

偏差描述：
[具体数值，如：原计划本周完成4个里程碑，实际仅完成1个]

根本原因：
[从以下类别选择：需求变更/资源不足/技术问题/外部依赖/估算错误/监管要求/其他]

影响评估：
- 对项目整体的影响：[进度延误X天 / 成本超支X万]
- 对里程碑的影响：[是否影响go-live目标]
- 对监管的影响：[是否触发合规风险]

初步纠正建议：
[不需要给出完整方案，但要识别方向，如：增加资源/范围调整/优先保证关键路径]
```

**输出：** 偏差分析报告（含里程碑偏差表）

### Step 5 — Handoff决策

**根据RAG状态决定下一步：**

```
IF SPI < 0.85 OR CPI < 0.85:
    → handoff to: etc-reestimation-helper
    → 提供: EVM计算表 + 偏差分析报告 + BAC + 当前SPI/CPI
    → 并通知: 项目管控智能体 (通过 orchestrator)

ELIF SPI < 0.95 OR CPI < 0.95:
    → 记录在performance commentary中，列入重点观察清单
    → handoff to: stakeholder-comms-planner（如需向高管汇报偏差）

ELIF SPI ≥ 0.95 AND CPI ≥ 0.95:
    → 正常报告流程，handoff to: closure-report-writer（如为项目收尾阶段）
```

**输出：** Handoff推荐（含接收方Skill和传递的数据包）

## Quality Gates

- [ ] **数据溯源**：PV/EV/AC每项数据有明确来源标注，无"人工估算"混入系统数据
- [ ] **SPI/CPI逻辑一致**：SPI反映进度 reality，EV完成应与里程碑状态匹配
- [ ] **RAG判定有据**：每个🔴判定有具体数值依据，不是定性判断
- [ ] **偏差有根因**：🔴指标必须有初步根因分析，不可只报数字
- [ ] **Handoff有据**：下一步Skill的触发条件与实际数据匹配，不是预设路由
- [ ] **周期可比**：与上一周期数据可比（基线未中途修改）

## Handoff Targets

### Primary: etc-reestimation-helper
**Trigger condition:** SPI < 0.85 OR CPI < 0.85 (🔴 Red)
**Data package:**
- EVM计算表（PV/EV/AC/SPI/CPI/VAC）
- 偏差分析报告（Step 4输出）
- BAC和当前里程碑完成情况
- 趋势数据（上3周期SPI/CPI）

### Secondary: stakeholder-comms-planner
**Trigger condition:** SPI < 0.95 OR CPI < 0.95，需要向高管汇报
**Data package:**
- EVM摘要（RAG状态 + 关键数字）
- 偏差分析摘要（1段话）
- 预测（EAC/ETC估算，如已计算）

### Tertiary: closure-report-writer
**Trigger condition:** 项目收尾阶段，生成最终EVM总结
**Data package:**
- 全项目EVM历史数据
- 最终VAC和根本原因总结

## Output Style

- **数字必须精确**：SPI/CPI保留2位小数，金额取整万元
- **RAG必须显眼**：🟢🟡🔴状态灯必须标注
- **偏差有上下文**：报SPI=0.85必须同时说明"进度延误X天，影响哪个里程碑"
- **语言简洁**：PMO报告风格，每节不超过3句话
- **图表优先**：优先输出S曲线数据点而非纯文字

## Failure Modes to Avoid

- **不核实数据来源**：直接用PM口头数字，未标注数据质量
- **只报数字不分析**：SPI=0.8但不说明原因和不采取行动
- **混淆EV和PV**：EV是已完成工作价值，PV是计划工作价值，不可混用
- **基线中途修改**：基线变更必须通过SCCB，不可在EVM计算中悄悄调整
- **遗漏第三方成本**：银行项目第三方费用占比高，AC采集必须包含
- **TCPI计算错误**：TCPI分母是EAC-AC而非BAC-AC，常见公式错误

## Minimum Output Skeleton

```markdown
# EVM Performance Report — [项目名称] — [周期: YYYY-MM-DD]

## 1. 数据概览
| 指标 | 数值 | RAG |
|------|------|-----|
| PV | ¥X万 | — |
| EV | ¥X万 | — |
| AC | ¥X万 | — |
| BAC | ¥X万 | — |
| SPI | X.XX | 🟢/🟡/🔴 |
| CPI | X.XX | 🟢/🟡/🔴 |
| VAC | ¥X万 | 🟢/🔴 |

## 2. S曲线数据
[按周期列表]

## 3. 里程碑偏差明细
| 里程碑 | 计划日期 | 实际日期 | 偏差(天) | 状态 |

## 4. RAG指标详情
[仅对🟡/🔴指标填写]
### 🔴 SPI = X.XX
[根因分析 + 影响评估]

## 5. 偏差趋势（近4周期）
| 周期 | SPI | CPI | 综合评级 |

## 6. 建议行动
- [ ] 触发 etc-reestimation-helper（条件：SPI<0.85 OR CPI<0.85）
- [ ] 通知PMO [日期]
- [ ] 下周期关注项：[具体]

## 7. Handoff
- → etc-reestimation-helper [条件满足时]
- → stakeholder-comms-planner [如需高管汇报]
```
