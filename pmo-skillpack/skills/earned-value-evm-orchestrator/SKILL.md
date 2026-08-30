---
name: "earned-value-evm-orchestrator"
pack: "project-management-pack"
display_name: "挣值管理编排"
description: "编排挣值管理全链条：EVM数据采集→绩效分析→重新估算→审批更新→基线变更，支持月度/季度项目绩效评估和银行IT项目监控。"
author: li.chen56@gientech.com
department: "BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
handoffs: ["earned-value-tracker", "etc-reestimation-helper"]
---
earned-value-evm-orchestrator

## Purpose


挣值管理编排 Skill 将 PV/AC/EV 数据采集、绩效分析、ETC 重新估算串联为完整链条，为项目管理层提供基于数据的进度与成本健康度判断。
## When to use

Use this skill when:
- Monthly or quarterly project performance review
- SPI/CPI deviation exceeds threshold
- ETC re-estimation is needed
- Project status reporting cycle
- Earned value management reporting

This is the **EVM control loop orchestrator** for the PMO domain. It chains three skills into one闭环管控 workflow:

```
earned-value-tracker → etc-reestimation-helper → SCCB审批 → 更新基线
        ↓                      ↓                     ↓
    EVM数据分析            偏差重估算           基线变更审批
    SPI/CPI计算            EAC重算              计划更新
        ↓                      ↓                     ↓
    偏差分析报告            决策建议书            风险重评估
```

**When to trigger this skill:**
- Weekly or monthly EVM data collection cycle (every Friday / last business day of month)
- When earned-value-tracker reports 🔴 SPI < 0.90 or 🔴 CPI < 0.90
- When PMO needs to prepare an SCCB approval package for baseline change
- Before milestone reviews, to ensure EVM data feeds milestone status

**Trigger frequency:** Weekly at minimum; immediately when any 🔴 threshold is breached.

---

## EVM Data Collection Standards

### Weekly Data Collection (项目执行层)

| Data Point | Source | Frequency | Owner |
|-----------|--------|----------|-------|
| Planned Value (PV) | L3 schedule, % complete planned | Weekly | PM |
| Earned Value (EV) | Milestone completion + % complete | Weekly | PM |
| Actual Cost (AC) | 财务系统实际支出 | Weekly | PMO |
| BAC | 初始预算批准值 | Baseline | PMO |

### EVM Metrics Calculation

| Metric | Formula | Status Thresholds |
|--------|---------|------------------|
| **SPI** | EV / PV | 🟢 ≥0.95 · 🟡 0.90-0.94 · 🔴 <0.90 |
| **CPI** | EV / AC | 🟢 ≥0.95 · 🟡 0.90-0.94 · 🔴 <0.90 |
| **EAC** | varies (see below) | Compare to BAC |
| **VAC** | BAC - EAC | 🔴 negative = over budget |
| **TCPI** | (BAC-EV) / (EAC-AC) | 🟢 ≤1.0 · 🔴 >1.0 |

### EAC Formulas (from etc-reestimation-helper)

| Scenario | Formula | Use When |
|----------|---------|---------|
| **典型偏差** | EAC = BAC / CPI | Cost偏差典型，未来维持当前效率 |
| **非典型偏差** | EAC = AC + (BAC - EV) | 一次性异常，不延续 |
| **复合偏差** | EAC = AC + (BAC - EV) / (CPI × SPI) | 进度+成本均偏差 |

---

## 信息采集（Step 0 — EVM编排前的数据就绪检查）

> ⚠️ **执行前必读**：本编排Skill需要明确的EVM数据来源。数据缺失时编排将无法正常执行，应先采集数据。

### Step 0.1 — EVM数据缺口检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目名称 | 请告知 | 标注 `[假设值-请核对]` |
| 当前EVM指标（SPI/CPI/EV/PV/AC/BAC） | 请告知 | 先调用 `earned-value-tracker` |
| 项目所处阶段 | 请告知 | 标注 `[假设值-请核对]` |
| 绩效偏差原因 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 触发条件判断

| 触发条件 | 是否满足 | 说明 |
|---------|---------|------|
| SPI < 0.95 或 CPI < 0.95 | 请告知 | 触发EVM重新估算 |
| SCCB/PMO要求 | 请告知 | 管理层要求 |
| 重大项目变更 | 请告知 | 触发基线变更评估 |

### Step 0.3 — 数据确认

```
📊 EVM编排 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目名称 | ✅/⚠️/❓ | [名称] |
| EVM指标 | ✅/⚠️/❓ | [值] |
| 项目阶段 | ✅/⚠️/❓ | [阶段] |
| 触发原因 | ✅/⚠️/❓ | [原因] |

请确认后"开始编排"，我将基于EVM数据选择编排路径。
═══════════════════════════════════════════
```

---

## Orchestration Procedure

## Procedure

> **Procedure** — This skill follows the **Orchestration Procedure** defined below. For execution, follow the numbered steps in that section.

### Stage 1 — EVM Data Collection & Analysis (调用 earned-value-tracker)

**Action:** Invoke `earned-value-tracker` with current cycle data:

```
INPUTS传递给earned-value-tracker:
- planned_value_data: L2计划的%完成数据（按里程碑）
- earned_value_data: 本周期挣值数据（里程碑完成情况）
- actual_cost_data: 财务系统实际支出
- schedule_context: 当前处于哪个Phase，里程碑完成情况
- baseline: BAC和初始PV基线（里程碑级别分解）

分析要求:
1. 计算SPI和CPI，标注状态灯
2. 生成S曲线数据点（每周/每月）
3. 识别超出阈值的偏差（SPI<0.90或CPI<0.90 → 🔴）
4. 生成EVM Performance Report（含里程碑偏差表）
```

**输出:** EVM Performance Report

**Gate检查:**
- [ ] 所有数据有据可查（系统导出 vs 人工估算标注清楚）
- [ ] SPI和CPI与里程碑完成情况一致
- [ ] 🔴偏差有初步原因说明

---

### Stage 2 — Re-estimation (调用 etc-reestimation-helper)

**Trigger condition:** This stage is invoked ONLY when:
- 🔴 SPI < 0.90 (schedule deviation significant)
- 🔴 CPI < 0.90 (cost deviation significant)
- 🟡 连续3个周期SPI或CPI在0.90-0.94区间
- SCCB或PMO要求重新估算

**Action:** When triggered, invoke `etc-reestimation-helper`:

```
INPUTS传递给etc-reestimation-helper:
- current_performance_data: SPI, CPI, EV, PV, AC, BAC
- remaining_work: L3计划中剩余工作包及估算工时
- risk_changes: 风险状态变化（哪些风险已实现？哪些新风险出现？）
- original_estimate: 原始BAC和里程碑计划
- variance_drivers: Stage 1识别的偏差驱动因素

重新估算要求:
1. 判断偏差类型（典型/非典型/复合）
2. 选择合适的EAC公式
3. 预测项目完工日期（倒排 vs 正排）
4. 生成SCCB审批所需的偏差分析报告
5. 提出SCCB行动建议（压缩/增加资源/调整范围/接受现状）
```

**输出:** ETC重新估算报告 + SCCB行动建议

**Gate检查:**
- [ ] EAC有明确依据，非拍脑袋
- [ ] 三种情景（乐观/基准/悲观）均有估算
- [ ] SCCB行动建议明确、可执行

---

### Stage 3 — SCCB Approval Workflow

**Trigger condition:** When Stage 2 produces a re-estimation that changes BAC or milestone dates.

**SCCB Approval Trigger Criteria:**

| 变更类型 | 触发SCCB审批 | 审批层级 |
|---------|-------------|---------|
| EAC变化 > 5% BAC | ✅ 必须 | SCCB |
| 里程碑日期调整 > 5天 | ✅ 必须 | SCCB |
| 涉及项目范围基线变更 | ✅ 必须 | SCCB |
| SCCB要求的重估算报告 | ✅ 必须 | SCCB |
| EAC变化 ≤ 5% BAC | PMO备案即可 | PMO |

**SCCB Approval Package Contents:**

```
1. 偏差分析报告
   - 偏差量（金额/天数）
   - 根本原因（5-Why分析）
   - 影响评估（进度/成本/范围/质量）

2. 重新估算方案
   - 三种情景估算（乐观/基准/悲观）
   - EAC计算过程和假设
   - 推荐方案及理由

3. 纠正措施计划
   - 具体行动项、责任人、完成日期
   - 预期效果
   - 风险和残余问题

4. 变更申请表格
   - 变更类型、范围、金额
   - 签字栏（PM/PMO负责人/项目总监/SCCB主席）
```

**SCCB Decision Types:**

| 决策 | 含义 | 后续动作 |
|------|------|---------|
| **批准新基线** | EAC和里程碑日期变更生效 | 更新计划基线，通知所有干系人 |
| **批准压缩措施** | 不调整基线，要求执行纠正措施 | 进入Stage 4监控 |
| **拒绝** | 不批准变更，原始基线维持 | 重新制定纠正措施 |
| **搁置** | 需补充信息，下次会议再议 | PMO在5工作日内补充材料 |

---

### Stage 4 — Baseline Update & Handoff

When SCCB approves the new baseline:

```
1. 更新计划基线
   - L1里程碑计划：新里程碑日期
   - L2项目主计划：任务完成日期调整
   - L3详细计划：受影响工作包调整
   
2. 通知干系人
   - 调用 stakeholder-comms-planner 生成干系人通报
   - 内容：基线变更摘要、原因、影响、措施
   
3. 风险重评估
   - 调用 risk-register-builder 更新风险登记册
   - 偏差实现的风险从"风险"移入"已实现/已关闭"
   - 新风险加入登记册
   
4. 归档变更记录
   - SCCB会议纪要编号
   - 变更前后对比表
   - PMO存档
```

---

## EVM Control Loop Cycle

```
        ┌──────────────────────────────────────────────────────┐
        │                  EVM 管控循环                          │
        │                                                      │
        │  ┌─────────┐    ┌──────────────────┐                 │
        │  │ 数据收集 │ ──→ │ EVM指标计算      │                 │
        │  │  周/月末  │    │ SPI / CPI / EAC │                 │
        │  └─────────┘    └────────┬─────────┘                 │
        │                          │                           │
        │               ┌───────────┴───────────┐              │
        │               ▼                       ▼              │
        │        ┌────────────┐           ┌──────────┐         │
        │        │  🟢正常     │           │  🟡/🔴偏差 │         │
        │        │  继续监控   │           │ 触发重估算 │         │
        │        └────────────┘           └────┬─────┘         │
        │                                        │              │
        │                               ┌────────▼────────┐      │
        │                               │ ETC重新估算     │      │
        │                               │ EAC / 新日期    │      │
        │                               └────────┬────────┘      │
        │                                        │              │
        │                               ┌─────────▼─────────┐     │
        │                               │ SCCB审批 (如需)  │     │
        │                               └─────────┬────────┘     │
        │                                         │              │
        │                               ┌─────────▼─────────┐     │
        │                               │  更新基线/通知    │     │
        │                               │  风险重评估       │     │
        │                               └─────────┬────────┘     │
        │                                         │              │
        │                               ┌─────────▼─────────┐     │
        │                               │  回到数据收集     │     │
        │                               │  (下周期)         │     │
        │                               └──────────────────┘     │
        └──────────────────────────────────────────────────────┘
```

---

## Quality Gates

- [ ] EVM data is collected from authoritative sources (schedule system, finance system) and clearly labeled
- [ ] SPI and CPI calculations are verified against milestone completion evidence
- [ ] 🔴 deviations have documented root cause (5-Why or equivalent) before re-estimation is triggered
- [ ] SCCB approval is obtained BEFORE any baseline change is implemented
- [ ] The re-estimation report distinguishes between typical and atypical variances
- [ ] Three scenarios (optimistic/baseline/pessimistic) are always provided for SCCB decision
- [ ] Stakeholders are notified within 2 business days of SCCB decision

## Failure Modes

| Failure Mode | Detection | Fix |
|-------------|-----------|-----|
| EVM data stale or inconsistent | SPI/CPI 与里程碑完成情况矛盾 | 立即核查数据源，要求PM提供说明 |
| Re-estimation without SCCB approval | Baseline updated before SCCB meeting | Roll back to previous baseline; enforce approval gate |
| Optimistic EAC without justification | EAC = BAC (assumes perfect performance) without explanation | Require three-scenario analysis |
| Repeated 🟡 without escalation | 3+ consecutive 🟡 cycles without triggering re-estimation | PMO mandates re-estimation review |
| Data entry errors | AC or EV data transposition errors | Cross-check with finance system monthly |

## Handoff Targets

| 下游Skill | 触发时机 | 交接内容 |
|-----------|---------|---------|
| risk-register-builder | SCCB批准新基线后 | 已实现的风险（从风险登记册转入问题日志）；新发现的风险 |
| stakeholder-comms-planner | SCCB决策后2工作日内 | 基线变更通知、偏差摘要、干系人行动项 |
| schedule-sequencer | SCCB批准里程碑日期变更后 | 新里程碑日期、需调整的任务链 |
| project-charter-writer | 重大范围/预算变更批准后 | 变更内容、变更理由、已批准变更申请单 |
