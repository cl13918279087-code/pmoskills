---
name: "project-oversight-risk-orchestrator"
pack: "project-management-pack"
display_name: "项目监控与风险编排"
description: "编排项目监控与风险管理循环：进度/风险数据采集→偏差分析→预警评估→风险应对→升级管理，支持项目执行全程可视化和问题快速响应。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
handoffs: ["project-oversight", "risk-register-builder"]
---
project-oversight-risk-orchestrator

## Purpose

## When to use

Use this skill when:
- Regular project oversight monitoring cycle
- Risk review and update is scheduled
- Project health check is required
- Escalated risks or issues need attention
- Periodic project status assessment

This is the **monitoring and risk orchestration skill** for the PMO domain. It integrates project-oversight (五维度监控) with risk-register-builder (风险登记册) into a single闭环监控流:

```
数据收集 ──→ 健康度评估 ──→ 偏差分析 ──→ 风险更新
    │              │              │              │
    ▼              ▼              ▼              ▼
 project-      五维度       5-Why根因     风险登记册
 oversight     健康度        分析          更新/升级
    │              │              │              │
    └──────────────┴──────────────┴──────────────┘
                         │
                  ┌──────┴──────┐
                  │  升级简报    │
                  │ (如触发阈值) │
                  └─────────────┘
                         │
                  ┌──────┴──────┐
                  │ 纠正措施计划 │
                  │ (持续跟踪)  │
                  └─────────────┘
```

**When to trigger this skill:**
- Weekly at minimum (every Friday — weekly project monitoring cycle)
- Immediately when any escalation threshold is breached
- Before PMO monthly review meetings
- When a risk materializes into an issue

---

## Five Health Dimensions (五维度健康度)

| Dimension | Weight | Indicators | Threshold |
|-----------|--------|-----------|-----------|
| **进度健康** | 30% | SPI, milestone status | 🟢 SPI≥0.95 · 🟡 0.90-0.94 · 🔴 <0.90 |
| **成本健康** | 25% | CPI, budget utilization | 🟢 CPI≥0.95 · 🟡 0.90-0.94 · 🔴 <0.90 |
| **范围健康** | 20% | Change order count, scope creep | 🟢 0-2 changes/week · 🟡 3-5 · 🔴 >5 |
| **质量健康** | 15% | Defect density, escape rate | 🟢 达标 · 🟡 边缘 · 🔴 不达标 |
| **风险健康** | 10% | Red risk count, risk velocity | 🟢 0-1 RED · 🟡 2-3 RED · 🔴 >3 RED |

**综合健康度:**
- 🟢 85-100: 项目正常推进
- 🟡 70-84: 需要关注，建议干预
- 🔴 50-69: 高风险，积极干预
- ⚫ <50: 项目危急，考虑终止或重构

---

## Orchestration Procedure

## Procedure

> **Procedure** — This skill follows the **Orchestration Procedure** defined below. For execution, follow the numbered steps in that section.

### Stage 1 — Data Collection & Health Assessment (调用 project-oversight)

**Action:** Invoke `project-oversight` for data collection and health score calculation:

```
INPUTS传递给project-oversight:
- 项目基线: 计划基线（含WBS、里程碑计划）
- 本周期进展数据: 任务完成情况、里程碑进展
- 偏差阈值: 进度>5%/成本>5%/范围变更>3项为预警线
- 升级标准: 见下方升级触发条件

五维度监控要求:
1. 收集各工作组周报数据，更新L3详细计划完成百分比
2. 计算SPI/CPI，汇总里程碑完成情况
3. 识别本周新发风险和新问题
4. 计算综合健康度评分
5. 生成周度监控仪表盘
```

**输出:** Oversight Dashboard + Health Score + Deviation List

**Gate检查:**
- [ ] 所有数据有明确来源（系统导出或人工核实标注）
- [ ] 🟡和🔴项目有初步原因说明
- [ ] 里程碑状态灯与EVM数据一致

---

### Stage 2 — Deviation Analysis & Risk Update

For each 🟡 or 🔴 deviation, perform root cause analysis and update the risk register:

```
偏差分类处理:

【🔴关键偏差 — 触发风险登记册更新】
  ├─ 立即进行5-Why根因分析
  ├─ 判断：偏差是"风险实现"还是"新风险"
  ├─ 更新风险登记册：
  │   - 风险已实现 → 状态改为"已发生"，移入问题日志
  │   - 新风险识别 → 新增风险条目，上升到相应层级
  └─ 触发升级简报

【🟡预警偏差 — 记录并监控】
  ├─ 记录延迟原因（责任人说明）
  ├─ 判断是否会恶化为🔴（未来3周趋势预测）
  ├─ 已有对应风险 → 上调概率/影响评级
  └─ 无对应风险 → 考虑新增风险条目（低优先级）
```

**5-Why根因分析模板:**
```
问题：进度落后7天，影响M70里程碑

Why 1: 为什么进度落后？
→ 原因：UAT测试发现重大缺陷，需修复后重新测试

Why 2: 为什么测试阶段发现重大缺陷？
→ 原因：SIT测试覆盖不充分，漏测了账户联机交易场景

Why 3: 为什么SIT测试覆盖不充分？
→ 原因：测试环境搭建延迟2周，测试组压缩了测试时间

Why 4: 为什么测试环境搭建延迟？
→ 原因：第三方渠道系统接口规范变更，导致环境联调延期

Why 5: 为什么第三方接口规范变更？
→ 原因：监管新规提前发布，第三方系统紧急响应导致接口版本更换

根因：监管政策变化导致第三方接口规范紧急变更，属于外部不可控风险
```

---

### Stage 3 — Escalation Management

**Escalation Trigger Criteria:**

| 级别 | 触发条件 | 响应时限 | 行动 |
|------|---------|---------|------|
| **L1 - 关注** | 单维度🟡 | 1周内 | PMO例行跟踪 |
| **L2 - 警告** | 多维度🟡 或 综合健康度70-84 | 3天内 | PMO负责人介入 |
| **L3 - 升级** | 🔴 或 综合健康度<70 | 24小时内 | 项目总监/PMO经理介入 |
| **L4 - 危急** | ⚫ 或 里程碑延期>10天 | 即时 | SCCB/项目领导小组紧急会议 |

**升级简报必须包含:**
1. 问题概述（具体、可量化）
2. 当前状态和影响范围
3. 已尝试的解决措施（按时间顺序）
4. 根因分析（5-Why或等效方法）
5. 升级请求（具体决策需求）
6. 建议方案（含优缺点对比）
7. 时间敏感性（说明决策截止日）

---

### Stage 4 — Corrective Action Management

**For each 🟡 and 🔴 deviation, create and track corrective actions:**

```
纠正措施管理流程:

Step 1: 制定措施
  - 列出3个以内可行方案
  - 评估资源需求和预期效果
  - 选择推荐方案

Step 2: 审批措施
  - L1/L2: PMO经理批准
  - L3: 项目总监批准
  - L4: SCCB紧急会议批准

Step 3: 实施跟踪
  - 措施纳入每周监控
  - 设置验证检查点
  - 2周内验证效果

Step 4: 闭环确认
  - 验证措施有效 → 关闭跟踪项
  - 措施无效 → 升级并启动备选方案
```

**Corrective Action Register Fields:**
| 字段 | 说明 |
|------|------|
| CA编号 | CA-[年份]-[序号] |
| 来源偏差 | 关联偏差报告编号 |
| 纠正措施 | 具体行动描述 |
| 责任人 | 执行责任人 |
| 完成日期 | 计划完成日期 |
| 验证方式 | 如何确认措施有效 |
| 状态 | 开放/进行中/已验证/已关闭 |

---

### Stage 5 — Integration with Other Skill Chains

```
本Skill的输出触发以下Skill链:

【触发 earned-value-evm-orchestrator】
  条件: 🔴 SPI<0.90 或 🔴 CPI<0.90 持续2周以上
  交接: EVM偏差数据 + 根因分析 → 触发EVM重新估算链

【触发 schedule-sequencer】
  条件: 偏差导致里程碑日期需调整 > 5天
  交接: 受影响任务链 + 延迟分析 → 触发计划更新

【触发 cross-dept-coordination】
  条件: 根因分析显示跨部门协调问题
  交接: 问题定义 + 各方立场 → 触发协调会议

【触发 solution-generation】
  条件: 偏差没有标准解决方案（如新类型风险）
  交接: 问题背景 + 约束条件 → 生成解决方案选项

【触发 stakeholder-comms-planner】
  条件: L3/L4升级
  交接: 升级简报 + 干系人影响 → 生成干系人通报
```

---

## Dashboard Design

### Weekly Oversight Dashboard (周度监控仪表盘)

```
┌────────────────────────────────────────────────────────────────┐
│  项目监控仪表盘 — [项目名称]                      周报期：W13   │
│  综合健康度：🟡 78                                          │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐       │
│  │ 进度 🟡  │ │ 成本 🟢  │ │ 范围 🟢  │ │ 质量 🟡  │       │
│  │ SPI=0.91 │ │ CPI=1.02 │ │ 变更+2   │ │ 缺陷密度  │       │
│  │ M70延期3天│ │ 预算正常 │ │ 受控     │ │ 临界     │       │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘       │
│                                                                │
│  风险状态：12项(1🔴/2🟡)                                      │
│  升级简报：1项（L3-升级）                                     │
│  纠正措施在跟踪：3项                                          │
│                                                                │
├────────────────────────────────────────────────────────────────┤
│  里程碑状态                                                   │
│  M00🟢│M10🟢│M20🟢│M30🟢│M40🟢│M50🟢│M60🟡│M70🔴│M80─│M90─│  │
├────────────────────────────────────────────────────────────────┤
│  🔴 关注项                                                     │
│  • M70里程碑延期3天，可能影响开业目标                         │
│    原因：UAT测试发现重大缺陷，修复+重测需7天                  │
│    措施：已启动应急响应，申请增加2名测试人员                  │
│    责任人：张三 | 预计恢复：2026-03-15                       │
├────────────────────────────────────────────────────────────────┤
│  下周关注事项                                                  │
│  • UAT重测结果验证（3月15日）                                 │
│  • SCCB审批M70延期申请（3月12日）                            │
│  • 第三方接口规范变更影响评估                                  │
└────────────────────────────────────────────────────────────────┘
```

---

## Risk Trend Analysis

### Monthly Risk Trend Report

| 风险类别 | 上月末 | 本月新增 | 本月关闭 | 本月末 | 趋势 |
|---------|-------|---------|---------|-------|------|
| 外部依赖风险 | 3 | 1 | 2 | 2 | ↓ |
| 资源风险 | 2 | 0 | 0 | 2 | → |
| 技术风险 | 1 | 1 | 0 | 2 | ↑ |
| 范围蔓延风险 | 0 | 1 | 0 | 1 | ↑ |
| **合计** | **6** | **3** | **2** | **7** | ↓ |

---

## Quality Gates

- [ ] Weekly monitoring is conducted on schedule (every Friday)
- [ ] All 🟡 deviations have documented explanations (not just "monitoring")
- [ ] All 🔴 deviations have 5-Why root cause analysis completed
- [ ] L3/L4 escalations are reported within the required timeframes (24h for L3)
- [ ] Every corrective action has a named owner and target completion date
- [ ] Corrective actions are reviewed weekly until verified closed
- [ ] Risk register is updated whenever new risks are identified or risks materialize
- [ ] The oversight dashboard accurately reflects the current project state

## Failure Modes

| Failure Mode | Detection | Fix |
|-------------|-----------|-----|
| Monitoring skipped | Weekly dashboard not updated | Enforce weekly cycle; PMO accountability |
| 🟡 ignored → escalates to 🔴 | Repeated consecutive 🟡 without action | Require 🟡 to have documented mitigation plan |
| Root cause too shallow | "外部原因" repeated | Force 5-Why; challenge "external" assertions |
| Corrective action never verified | CA stuck in "进行中" for > 2 weeks | PMO monthly review of all open CAs |
| Risk register not updated | Materialized risks not in issue log | Enforce risk→issue conversion in SOP |
| Dashboard inconsistent with EVM data | Dashboard SPI ≠ EVM report SPI | Single source of truth: EVM report |

## Handoff Targets

| 下游Skill | 触发条件 | 交接内容 |
|-----------|---------|---------|
| earned-value-evm-orchestrator | 🔴 SPI<0.90 或 🔴 CPI<0.90 | EVM偏差数据 + 根因分析 |
| schedule-sequencer | 偏差导致里程碑日期调整>5天 | 受影响任务链 + 延迟分析 |
| cross-dept-coordination | 根因涉及跨部门协调问题 | 问题定义 + 各方立场 |
| solution-generation | 无标准解法的偏差问题 | 问题背景 + 约束条件 |
| stakeholder-comms-planner | L3/L4升级 | 升级简报 + 干系人沟通需求 |
