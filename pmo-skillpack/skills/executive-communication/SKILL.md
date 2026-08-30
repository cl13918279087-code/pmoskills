---
name: "executive-communication"
pack: "project-management-pack"
display_name: "高管简报"
description: "设计并制作高管级沟通材料，包括董事会报告、 Steering Committee 汇报材料、管理层简报，传递项目状态、风险和决策建议。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
executive-communication

## Purpose

Design and produce high-impact executive communications that convey project status, strategic rationale, and decision requirements to senior leadership — with the appropriate level of detail, tone, and visual polish to support governance effectiveness and executive engagement.

**This skill is critical for maintaining executive support and enabling governance decisions** in large-scale projects where leadership attention is limited and the consequences of miscommunication are high.

## When to use
## Trigger this skill when

- A steering committee, board meeting, or executive briefing is approaching
- Project status or risk profile requires leadership attention or decision
- A major milestone has been achieved or missed
- Executive buy-in or resource commitment is needed
- Communication with the board or sponsors must be prepared
- Crisis communication to executives is required

## Expected Inputs

### Required Inputs

| Input | Description | Example |
|-------|-------------|---------|
| communication objective | What the communication must achieve | "获得委员会批准进入下一阶段" |
| audience profile | Executive audience characteristics and preferences | "委员会偏好数据驱动型汇报，控制在10页以内" |
| key messages | Core messages that must be conveyed | "项目按计划推进，但供应商风险需要关注" |
| current project data | Status, metrics, and project information | 进度百分比、预算使用、关键风险 |

### Optional Inputs

| Input | Description |
|-------|-------------|
| previous communication context | Last communication received |
| format constraints | Page limit, template, branding requirements |
| decision questions | Specific decisions being requested |
| Q&A anticipated topics | Likely questions from executives |

## Deliverables

| # | Deliverable | Description |
|---|-------------|-------------|
| 1 | 高管简报 (Executive Briefing) | 1-2 page summary for quick executive consumption |
| 2 | 委员会报告 (Steering Committee Report) | Formal report for governance meeting |
| 3 | 董事会材料 (Board Update) | Presentation for board-level updates |
| 4 | 领导层沟通稿 (Leadership Communication) | Written communication for email/distribution |
| 5 | Q&A准备 (Q&A Preparation) | Anticipated questions with suggested responses |
| 6 | 关键信息要点 (Talking Points) | Key messages for verbal delivery |

## Executive Communication Principles

### 1. Pyramid Structure (金字塔结构)

```
┌─────────────────────────────────────────┐
│            核心结论 / 行动建议             │
│         (Executive Summary - 1句)        │
└─────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────┐
│         关键支撑点 (3个以内)              │
│    • 支持结论的主要论据                   │
│    • 每个支撑点含数据/证据                │
└─────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────┐
│           详细背景与数据                   │
│     (按需提供，供深入了解)                │
└─────────────────────────────────────────┘
```

### 2. Metrics That Matter to Executives

| 维度 | 指标类型 | 示例 |
|------|----------|------|
| **进度** | RAG状态、里程碑达成 | "8/12个里程碑已完成，偏差1周" |
| **成本** | 预算使用率、预测 | "预算使用65%，预测在±10%内" |
| **范围** | 变更数量、范围趋势 | "3项变更申请，评估影响中" |
| **风险** | 风险数量、关注级数量 | "12项风险，2项RED需关注" |
| **收益** | 实现的业务价值 | "系统响应时间缩短40%" |

### 3. Visual Hierarchy Guidelines

| 元素 | 原则 |
|------|------|
| **标题** | 结论先行，避免"项目周报"类泛标题 |
| **数据可视化** | 使用图表而非表格，每页一个核心信息 |
| **颜色使用** | RAG（红/黄/绿）谨慎使用，避免情绪误导 |
| **空白空间** | 高端感，减少密集文字 |
| **字体** | 标题粗体、正文清晰，层级分明 |

## Format Templates

### Executive Briefing Template (1-2 Pages)

```markdown
# [项目名称] 高管简报
**报告期：[日期范围]**
**报告人：[姓名]**

## 一、核心结论

> **[一句话核心结论，行动导向]**
> 例如：项目整体进展良好，但供应商交付风险需管理层关注，建议本周召开专项会议。

## 二、关键指标

| 指标 | 当前状态 | 趋势 | 状态 |
|------|----------|------|------|
| 整体进度 | 65% | ↑ | 🟡 |
| 预算使用 | 62% | → | 🟢 |
| 里程碑 | 8/12完成 | ↓ | 🟡 |
| 风险数量 | 12项(2RED) | → | 🟡 |

## 三、本周期重要进展

- **进展1：** [具体描述，包括可交付成果]
- **进展2：** [具体描述]

## 四、需关注事项

| 事项 | 影响 | 建议行动 | 责任人 |
|------|------|----------|--------|
| 供应商延迟 | 可能影响UAT | 启动备选方案评估 | [姓名] |
| 技术方案争议 | 可能影响架构 | 召开技术评审会 | [姓名] |

## 五、下周期计划

- [ ] 完成X里程碑
- [ ] 启动Y测试
- [ ] 解决供应商问题

## 六、请求事项

□ 批准进入下一阶段
□ 解决跨部门资源冲突
□ 提供额外预算授权
□ [具体请求]

---

*报告人：[姓名] | 联系方式：[邮箱/电话]*
```

### Steering Committee Report Template

```markdown
# [项目名称] 项目管理委员会报告
**报告期：** [季度/月度]
**报告人：** [项目总监姓名]
**日期：** [YYYY-MM-DD]

---

## 1. 执行摘要

[2-3段，提供项目整体状况的独立叙事，包括：
- 项目背景与目标
- 本报告期核心成果
- 主要风险和担忧
- 管理层决策需求]

## 2. 项目状态概览

### 2.1 关键绩效指标

| KPI | 目标 | 实际 | 状态 | 预测趋势 |
|-----|------|------|------|----------|
| 进度 | 100% | 65% | 🟡 | 可能在±10%内完成 |
| 预算(万) | 1200 | 742 | 🟢 | 正常 |
| 质量(缺陷密度) | <5 | 3.2 | 🟢 | 正常 |
| 风险指数 | <15 | 12 | 🟡 | 需监控 |

### 2.2 里程碑状态

| 里程碑 | 计划日期 | 实际日期 | 状态 | 备注 |
|--------|----------|----------|------|------|
| M1-项目启动 | 2024-01-15 | 2024-01-15 | 🟢 | 已完成 |
| M2-需求冻结 | 2024-03-01 | 2024-03-05 | 🟡 | 延迟5天 |
| M3-设计完成 | 2024-05-01 | — | 🟢 | 预计按期 |
| M4-开发完成 | 2024-08-01 | — | 🟡 | 存在风险 |

### 2.3 阶段燃尽图/进度趋势

[插入图表显示历史趋势和预测]

## 3. 本周期成果

### 3.1 交付成果

| 交付物 | 计划完成日 | 实际完成日 | 状态 |
|--------|------------|------------|------|
| 需求规格说明书 | 2024-03-01 | 2024-03-05 | 🟡 |
| 架构设计方案 | 2024-04-15 | 2024-04-14 | 🟢 |
| [其他...] | ... | ... | ... |

### 3.2 关键决策与变更

| 决策/变更 | 日期 | 内容 | 影响 |
|-----------|------|------|------|
| 需求变更#12 | 2024-03-10 | 新增X功能 | 工作量+5% |
| 技术方案调整 | 2024-03-15 | 改用Y技术栈 | 进度-1周，成本+3% |

## 4. 风险与问题

### 4.1 红区风险（需立即关注）

| 风险ID | 风险描述 | 影响评估 | 当前状态 | 应对措施 |
|--------|----------|----------|----------|----------|
| R-001 | 供应商交付延迟 | 可能导致UAT延误4周 | 正在监控 | 备选供应商评估中 |

### 4.2 问题升级

| 问题ID | 问题描述 | 影响 | 升级层级 | 所需支持 |
|--------|----------|------|----------|----------|
| I-003 | 跨部门资源冲突 | 影响开发进度 | PMO→委员会 | 裁决资源优先级 |

## 5. 财务状况

| 预算类别 | 已批准预算 | 已发生 | 预测最终 | 偏差率 |
|----------|------------|--------|----------|--------|
| 人力成本 | 600万 | 380万 | 590万 | -2% |
| 软硬件 | 300万 | 200万 | 310万 | +3% |
| 第三方服务 | 200万 | 150万 | 210万 | +5% |
| 其他 | 100万 | 12万 | 90万 | -10% |
| **总计** | **1200万** | **742万** | **1200万** | **0%** |

## 6. 下周期计划

### 6.1 关键活动

| 活动 | 计划日期 | 责任人 | 备注 |
|------|----------|--------|------|
| UAT测试启动 | 2024-04-01 | [姓名] | 依赖环境就绪 |
| 性能测试 | 2024-04-15 | [姓名] | — |

### 6.2 预期成果

- [ ] 完成X功能开发
- [ ] 通过Y测试
- [ ] 解决R-001风险

## 7. 决策请求

| # | 决策事项 | 选项 | 建议 | 截止日期 |
|---|----------|------|------|----------|
| 1 | 进入UAT阶段 | 批准/推迟/有条件批准 | 有条件批准（环境就绪后） | 2024-04-01 |

## 8. 附录

- A. 详细风险登记册
- B. 变更日志
- C. 术语表

---

*报告人：[姓名] | 审核：[PMO经理] | 日期：[日期]*
```

## Q&A Preparation Framework

### Anticipated Question Categories

| 类别 | 典型问题 | 准备要点 |
|------|----------|----------|
| **进度** | "项目能按时完成吗？" | 提供预测和置信区间，说明关键路径 |
| **成本** | "预算还够用吗？" | 预测vs预算，偏差原因，储备金状态 |
| **范围** | "为什么范围会有变化？" | 变化原因，业务价值，变更控制过程 |
| **风险** | "最坏情况会怎样？" | 风险敞口，应急计划，退出策略 |
| **资源** | "团队能力够吗？" | 技能缺口，解决方案，外部支持 |
| **价值** | "项目能带来什么业务价值？" | 量化收益，实现路径，时间线 |

### Q&A Response Structure (A-B-C Model)

```
A (Answer) - 直接回答问题
B (Background) - 简要背景（30秒内）
C (Commitment) - 承诺行动或后续回复时间
```

### Red Flag Questions & Responses

| 问题类型 | 危险信号 | 应对策略 |
|----------|----------|----------|
| 质疑进度 | "为什么又延期了？" | 诚实承认，提供根因分析，改进措施 |
| 质疑成本 | "钱花在哪里了？" | 具体数字，透明分解，趋势解释 |
| 挑战价值 | "这项目值得做吗？" | 重申业务价值，提供替代方案比较 |
| 施压资源 | "能不能减少人？" | 分析影响，提供选项，说明风险 |

## Visual Design Standards

### Slide Layout Principles

| 原则 | 说明 | 示例 |
|------|------|------|
| 单一信息点 | 每页一个核心信息 | 标题："进度状态"而非"项目周报" |
| 结论先行 | 图表标题即结论 | "进度领先2周" + 趋势图 |
| 数据密度控制 | 6x6法则（≤6行6列） | 复杂数据分页或提供附录 |
| 留白 | 边缘至少15%留白 | 高端感、易读性 |

### Chart Selection Guide

| 目的 | 推荐图表 | 避免 |
|------|----------|------|
| 展示趋势 | 折线图、燃尽图 | 饼图（除非构成对比） |
| 展示构成 | 堆叠柱图、瀑布图 | 多馅饼图 |
| 展示对比 | 柱图、条形图 | 3D图表 |
| 展示关系 | 散点图、热力图 | 过多颜色 |
| 展示状态 | RAG仪表盘、交通灯 | 主观颜色 |

### Color Palette for Executive Materials

| 用途 | 颜色 | 色值 | 原则 |
|------|------|------|------|
| 正面/正常 | 绿色 | #2E7D32 | 谨慎使用 |
| 警示/关注 | 琥珀色 | #F57C00 | 代表需要关注 |
| 负面/问题 | 红色 | #C62828 | 仅用于真正的问题 |
| 主色调 | 深蓝 | #1565C0 | 品牌色、标题 |
| 辅助色 | 灰色 | #616161 | 文字、边框 |
| 背景 | 白色/浅灰 | #FFFFFF/#F5F5F5 | 保持干净 |

## Presentation Delivery Tips

### Executive Meeting Dynamics

| 场景 | 策略 |
|------|------|
| 10分钟发言 | 结论→3个要点→每个要点1个数据→请求决策 |
| 30分钟汇报 | 结论→要点→深入数据→详细背景（按需）→Q&A |
| 问答环节 | 诚实回答，不知道的承认并承诺后续答复 |
| 被挑战时 | 保持冷静，感谢关注，具体回应，避免防御 |

### Handling Difficult Questions

| 问题类型 | 回应策略 |
|----------|----------|
| "为什么..."（质疑） | 先承认问题，提供原因和纠正措施 |
| "如果...会怎样"（假设） | 承认不确定性，提供情景分析 |
| "我认为..."（不同意见） | 感谢输入，解释考虑的因素 |
| "你确定吗？"（挑战） | 提供证据，说明置信度 |

## Quality Gates

| # | 检查项 | 验证标准 |
|---|--------|----------|
| 1 | 结论明确性 | 核心结论能在30秒内说清楚 |
| 2 | 受众匹配度 | 内容符合受众关注点和偏好 |
| 3 | 数据准确性 | 所有数字有来源，日期最新 |
| 4 | 可操作性 | 每项风险有明确的应对建议 |
| 5 | 请求清晰度 | 需要管理层决定的事项明确、具体 |
| 6 | 时间控制 | 材料时长符合会议安排 |
| 7 | 专业呈现 | 格式统一，无错别字，视觉专业 |

## Common Failure Modes

| 失败模式 | 说明 | 应对 |
|----------|------|------|
| ❌ 信息过载 | 提供过多细节，高管失去重点 | 按金字塔结构，结论先行 |
| ❌ 缺乏结论 | "以下是数据，请自己判断" | 每页必须有结论和建议 |
| ❌ 报喜不报忧 | 隐藏问题直到无法掩盖 | 主动暴露问题和建议，体现信任 |
| ❌ 数据不一致 | 不同材料数字矛盾 | 建立单一数据源，版本控制 |
| ❌ 格式不专业 | 排版混乱、错别字、过期信息 | 正式审核流程 |
| ❌ 请求不具体 | "请领导关注"而无明确决定 | 具体决策请求+截止日期 |
| ❌ 忽视政治因素 | 只讲数据不顾关系动态 | 了解干系人立场，私下沟通 |

---

## 信息采集（Step 0 — 高管沟通前的材料准备检查）

> ⚠️ **执行前必读**：高管沟通材料需要明确汇报周期和受众背景。

### Step 0.1 — 高管沟通上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 汇报周期 | 请告知 | 周报/月报/季度审查 |
| 高管背景 | 请告知 | 标注 `[假设值-请核对]` |
| 关键信息（成果/问题/请求） | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 高管沟通 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 汇报周期 | ✅/⚠️/❓ | [周期] |
| 高管背景 | ✅/⚠️/❓ | [说明] |
| 关键信息 | ✅/⚠️/❓ | [成果/问题/请求] |

请确认后"开始生成高管沟通材料"。
═══════════════════════════════════════════
```

---



## Procedure

> **EN Alias**: 本章节同时标记为 `## Operating Procedure (5-Step Process)`，内容完全一致。

## Operating Procedure (5-Step Process)

```
Step 1: 受众与目标分析
  ├─ 识别目标受众和决策者
  ├─ 了解受众关注点和偏好
  ├─ 明确沟通必须达到的目标
  └─ 确定格式和长度约束

Step 2: 内容策划与结构
  ├─ 确定核心信息和关键要点
  ├─ 收集和验证数据
  ├─ 设计金字塔结构
  └─ 准备Q&A预测

Step 3: 材料撰写
  ├─ 起草执行摘要
  ├─ 开发关键指标和数据可视化
  ├─ 撰写详细内容
  └─ 准备演讲稿和要点

Step 4: 视觉设计与审校
  ├─ 应用设计标准
  ├─ 确保数据一致性和准确性
  ├─ 内部审校和排练
  └─ 获取必要的审批

Step 5: 交付与跟进
  ├─ 按时提交/发送材料
  ├─ 准备现场演示
  ├─ 记录问题和后续行动
  └─ 跟进决策落实
```

## Handoff Recommendations

| 下游技能 | 触发条件 | 交接内容 |
|----------|----------|----------|
| stakeholder-comms-planner | 需要将执行层沟通纳入整体沟通计划 | 沟通频次、受众群体 |
| project-charter-writer | 治理层沟通机制需纳入章程 | 汇报结构、会议安排 |
| schedule-sequencer | 报告周期需纳入进度计划 | 报告节点、里程碑 |
