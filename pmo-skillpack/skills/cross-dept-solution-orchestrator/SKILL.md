---
name: "cross-dept-solution-orchestrator"
pack: "project-management-pack"
display_name: "跨部门问题解决编排"
description: "编排跨部门问题解决流程：问题分析→多方案生成→干系人对齐→方案评审→执行跟踪，确保复杂跨部门问题得到系统性解决。"
author: li.chen56@gientech.com
department: "BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
handoffs: ["cross-dept-coordination", "solution-generation"]
---
cross-dept-solution-orchestrator

## Purpose


跨部门问题解决编排 Skill 协调多方利益相关者，通过结构化流程推动跨部门问题的系统性分析与解决，确保方案获得各方认可并有效执行。
## When to use

Use this skill when:
- A cross-department issue requires coordination
- Deadlocks or disputes between teams need resolution
- Multi-stakeholder alignment is needed for a solution
- Issues escalated from project teams require org-level intervention
- Problem-solving workshops need facilitation

This is the **cross-departmental coordination and solution generation orchestrator** for the PMO domain. It chains two skills into one协调-解决 workflow:

```
cross-dept-coordination ──→ solution-generation
           ↓                        ↓
     跨部门协调                   对策建议生成
     (问题界定/各方立场)           (方案生成/评估/推荐)
           ↓                        ↓
     协调讨论纪要               解决方案选项
           │                        │
           └────────────┬───────────┘
                        ↓
               ┌─────────────────┐
               │  协调解决方案包   │
               │  问题+方案+计划   │
               └─────────────────┘
                        │
               ┌────────┴────────┐
               ▼                 ▼
        项目执行层            PMO监控层
      (措施跟踪)          (进度跟踪)
```

**When to trigger this skill:**
- A cross-departmental issue is identified (conflict over resources, priorities, scope, timeline)
- A blocker requires coordination between multiple work groups or vendors
- A project-oversight analysis identifies a cross-functional root cause
- An escalation arrives that requires multi-party negotiation
- Before SCCB meetings where cross-functional decisions are needed

---

## Issue Classification

| 类别 | 描述 | 典型场景 | 解决层次 |
|------|------|---------|---------|
| **资源争用** | 多方争夺有限资源（人员/预算/环境） | BA被多个子项目同时占用 | PMO协调 → SCCB裁决 |
| **优先级冲突** | 不同业务/系统的优先级排序争议 | 两个系统的UAT时间重叠 | PMO协调 → SCCB裁决 |
| **范围争议** | 范围边界模糊，归属不清 | 某功能属于核心还是外围 | PMO协调 → 范围边界检查 |
| **技术方案分歧** | 不同技术团队对实现方案有争议 | 架构选型、数据模型争议 | 技术总体组 → PMO裁决 |
| **进度影响** | 一方延迟影响其他方 | 第三方接口延误导致整体延期 | 立即协调 → 升级评估 |
| **依赖关系** | 跨组织依赖未满足 | 某厂商交付物延误 | 升级协调 → 纠正措施 |

---

## 信息采集（Step 0 — 编排前的上下文检查）

> ⚠️ **执行前必读**：本编排Skill需要明确编排的目标和问题类型。信息缺失时应主动采集，而非直接执行编排流程。

### Step 0.1 — 上下文就绪检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 问题类型 | 请告知 | 提供类型选项供选择 |
| 涉及部门数量 | 请告知 | 标注 `[假设值-请核对]` |
| 已有分析材料 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 问题类型说明

| 问题类型 | 说明 | 典型场景 |
|---------|------|---------|
| 跨部门流程断点 | 接口不清晰或职责重叠 | 需求变更、缺陷处理 |
| 资源冲突 | 多部门争抢有限资源 | 人员调度、基础设施 |
| 目标不一致 | 各方优先级存在分歧 | 项目排序、技术选型 |
| 沟通失效 | 信息传递失真或延迟 | 会议纪要、邮件沟通 |

### Step 0.3 — 数据采集问题

**请逐项回答（已知的跳过，直接告知）：**

1. **问题描述**：跨部门问题的具体表现是什么？涉及哪些部门？
2. **问题背景**：问题从何时开始？已尝试过哪些解决措施？
3. **关键干系人**：谁参与了问题的解决？谁能做最终决策？

### Step 0.4 — 数据确认

```
📊 跨部门问题解决编排 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 问题类型 | ✅/⚠️/❓ | [类型] |
| 涉及部门数 | ✅/⚠️/❓ | [数量]个 |
| 关键干系人 | ✅/⚠️/❓ | [人员] |

请确认后"开始编排"，我将基于问题类型选择合适的编排流程。
═══════════════════════════════════════════
```

---

## Orchestration Procedure

## Procedure

> **Procedure** — This skill follows the **Orchestration Procedure** defined below. For execution, follow the numbered steps in that section.

### Stage 1 — Problem Definition & Stakeholder Analysis (调用 cross-dept-coordination)

**Action:** Invoke `cross-dept-coordination`:

```
INPUTS传递给cross-dept-coordination:
- 问题定义: 具体描述（谁/何时/发生了什么/影响了什么）
- 涉及部门: 所有涉及的部门/团队/厂商
- 各方立场: 每个部门/团队对问题的看法和关切
- 影响评估: 对里程碑/成本/质量/范围的影响

协调分析要求:
1. 梳理问题定义与涉及部门
2. 分析各方立场（利益/关切/底线）
3. 主持协调讨论（引导各方聚焦问题而非立场）
4. 推动形成共识方案或明确分歧点
5. 明确各方责任与行动计划
6. 输出：协调讨论纪要（含共识/分歧/行动项）
```

**输出:** 协调分析报告（各方立场、共识、分歧、行动项）

**Gate检查:**
- [ ] 所有涉及方都有机会表达立场
- [ ] 问题本质被准确定义（不是表面症状）
- [ ] 分歧点和共识点都有记录

---

### Stage 2 — Solution Generation & Evaluation (调用 solution-generation)

**Trigger condition:** When the issue has multiple potential solutions and stakeholder alignment is needed.

**Action:** Invoke `solution-generation`:

```
INPUTS传递给solution-generation:
- 问题背景: Stage 1输出的问题定义和影响评估
- 约束条件: 可用资源、时间窗口、政策限制
- 各方立场: Stage 1输出的各方关切和底线
- 已知限制: 哪些方案不可行（为什么）

解决方案生成要求:
1. 生成3个以上实质性解决方案选项
2. 对每个方案进行影响分析（进度/成本/范围/质量/风险）
3. 评估各方案的可行性（技术/资源/时间）
4. 结合干系人立场评估接受度
5. 输出推荐方案（明确首选+备选）
```

**输出:** 解决方案选项矩阵（含评估、推荐）

**Gate检查:**
- [ ] 至少3个实质性方案（含不作为基准）
- [ ] 每个方案的影响分析有量化数据支撑
- [ ] 推荐方案有明确依据

---

### Stage 3 — Stakeholder Alignment & Decision

**When the issue requires formal decision:**

```
协调会议引导流程:

Step 1: 问题确认（5分钟）
  - 主持人陈述问题定义（确保各方理解一致）
  - 确认影响范围和紧迫性

Step 2: 方案陈述（每个方案10分钟）
  - 各提议方陈述方案
  - 主持人追问关键问题（资源/时间/风险）

Step 3: 干系人表态（每个部门5分钟）
  - 各方明确表态（支持/有条件支持/反对）
  - 记录关键关切是否被回应

Step 4: 差距分析
  - 如存在分歧 → 返回Step 2补充信息 或 进入决策裁决
  - 如基本共识 → 进入决策确认

Step 5: 决策记录
  - 记录决策内容和依据
  - 记录少数意见（如有）
  - 明确各方行动项和责任人
```

**Decision Types:**

| 决策类型 | 适用场景 | 后续动作 |
|---------|---------|---------|
| **共识决策** | 各方对方案基本达成一致 | 形成会议纪要，各方签字确认 |
| **妥协方案** | 各方均有让步 | 明确各方让步内容，形成协议 |
| **裁决决策** | 无法达成共识 | PMO/SCCB/技术总体组裁决，记录少数意见 |
| **分步决策** | 无法一次决定全部 | 先解决紧迫问题，其他问题延期处理 |

---

### Stage 4 — Action Plan & Tracking

**For each agreed action:**

```
行动项管理:

1. 明确行动项内容（具体、可交付）
2. 指定责任人（明确到个人，不只是部门）
3. 设置完成日期（考虑各方时间窗口）
4. 定义验证方式（如何确认行动项已完成）

跟踪机制:
- 下次PMO周例会：确认行动项进展
- 如行动项未完成：分析原因，决定是否升级
- 行动项完成：验证效果，确认问题解决
- 问题复发：重新触发本orchestrator
```

**Action Item Register Fields:**

| 字段 | 说明 |
|------|------|
| 编号 | CX-[年份]-[序号] |
| 来源问题 | 关联问题编号 |
| 行动项 | 具体行动描述 |
| 责任人 | 个人姓名（不只是部门） |
| 协作方 | 涉及的其他部门/团队 |
| 完成日期 | 计划完成日期 |
| 验证方式 | 如何确认完成 |
| 状态 | 待启动/进行中/已完成/已验证/未完成 |
| 验证日期 | 实际验证日期 |

---

### Stage 5 — Integration with Other Skill Chains

```
本Skill输出触发以下Skill链:

【触发 project-oversight-risk-orchestrator】
  条件: 协调问题导致里程碑延期或新增风险
  交接: 问题分析报告 + 影响评估 → 更新监控仪表盘和风险登记册

【触发 earned-value-evm-orchestrator】
  条件: 协调问题导致进度偏差超过EVM阈值
  交接: 偏差分析 → 触发挣值重新估算

【触发 wbs-schedule-milestone-orchestrator】
  条件: 协调结果导致范围、里程碑或依赖关系变化
  交接: 变更内容 → 触发计划更新流程

【触发 stakeholder-comms-planner】
  条件: 重要协调结论需要通报相关干系人
  交接: 协调结论摘要 + 需通知的干系人范围
```

---

## Solution Options Matrix Template

```
【问题】第三方接口联调延迟，影响核心系统UAT进度

【涉及部门】核心开发组、第三方厂商、测试组

┌─────────────┬──────────────┬──────────────┬──────────────┐
│   方案      │   方案A       │   方案B       │   方案C       │
│             │  等待联调完成  │  使用模拟接口  │  调整UAT顺序  │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 方案描述     │ 暂停UAT，等   │ 开发mock接口  │ 先测试不依赖  │
│             │ 第三方联调完成 │ 替代联调      │ 第三方接口的  │
│             │              │              │ 功能          │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 对进度的影响 │ 延期10天      │ 延期2天       │ 延期5天       │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 对成本的影响 │ 无额外成本    │ 增加5人天    │ 无额外成本    │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 对质量的影响 │ 无影响        │ 低风险(mock  │ 无影响        │
│             │              │ 质量依赖实现)  │             │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 资源需求    │ 测试组可休息  │ 核心组2人天  │ 测试组重组   │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 第三方配合  │ 需要(联调完成)│ 需要(接口规范)│ 不需要       │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 各方接受度  │ 测试组:反对   │ 测试组:支持   │ 核心组:有条件│
│             │ 核心组:支持   │ 核心组:中立   │              │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 风险        │ 时间风险高    │ 技术风险低    │ 范围风险中   │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 综合评分    │ ★★☆         │ ★★★★        │ ★★★        │
├─────────────┼──────────────┼──────────────┼──────────────┤
│ 推荐        │              │ ✅ 首选      │              │
└─────────────┴──────────────┴──────────────┴──────────────┘

【推荐方案B的理由】
1. 进度影响最小（仅2天）
2. 各方接受度最高
3. 风险可控（模拟接口有成熟方案）
4. 不依赖第三方进度（主动可控）
```

---

## Quality Gates

- [ ] All affected departments/teams have been identified and invited to the coordination session
- [ ] The problem definition is specific and agreed upon by all parties (not vague or blaming)
- [ ] At least 3 substantive solution options have been generated (including "do nothing" as a baseline)
- [ ] Each option's impact analysis (schedule/cost/scope/quality) is quantified, not just qualitative
- [ ] The final decision has documented rationale and all stakeholder positions are recorded (including dissent)
- [ ] Every action item has a named individual owner (not just a department name)
- [ ] Action items are tracked in the PMO tracking system and reviewed at each weekly meeting
- [ ] The issue is formally closed only when all action items have been verified complete

## Failure Modes

| Failure Mode | Detection | Fix |
|-------------|-----------|-----|
| Wrong stakeholders at table | Issue resurfaces after "resolution" | Re-invite missing department; reschedule session |
| Problem misdiagnosed | Symptom treated, root cause not addressed | Apply 5-Why; challenge initial problem statement |
| Action items without owners | Items stuck in "进行中" | Assign named individuals; no department-level assignments |
| Solution imposed without buy-in | Affected team blocks implementation | Require consensus or documented dissent before imposing |
| Follow-up never happens | Issue marked "resolved" but not verified | PMO must verify closure at next weekly meeting |
| Pattern of same issues | Same CX issue recurring | Trigger lessons-learned review; update SOP |

## Handoff Targets

| 下游Skill | 触发条件 | 交接内容 |
|-----------|---------|---------|
| project-oversight-risk-orchestrator | 问题导致里程碑延期或新增风险 | 问题分析 + 影响评估 + 风险 |
| earned-value-evm-orchestrator | 问题导致进度偏差超EVM阈值 | 偏差数据 |
| wbs-schedule-milestone-orchestrator | 协调结果导致计划变更 | 变更内容 + 里程碑影响 |
| stakeholder-comms-planner | 协调结论需通报 | 结论摘要 + 通知范围 |
