---
name: "strategy-decision-facilitation"
pack: "project-management-pack"
display_name: "战略决策报告"
description: "引导战略性决策流程，指导干系人通过结构化分析、方案评估和共识建立，做出高质量的战略方向、投资优先级和关键权衡决策。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
strategy-decision-facilitation

## Purpose

Facilitate structured strategic decision-making for projects and programs. This skill guides teams through defined-phase analysis processes — from problem framing to decision rationale documentation — ensuring decisions are well-reasoned, stakeholder-aligned, and implementable.

**This skill is designed for high-stakes, multi-stakeholder decisions** where strategic direction, investment trade-offs, or cross-functional priorities must be determined (e.g., technology stack selection, build-vs-buy decisions, market entry strategy, major investment approvals).

## When to use
## Trigger this skill when

- A strategic decision with significant project impact must be made and documented
- Multiple stakeholders have conflicting priorities or preferences that need reconciliation
- Decision rationale must be captured for governance or audit purposes
- The team needs a structured process to avoid analysis paralysis or premature consensus
- Trade-off decisions require transparent criteria comparison

## Expected Inputs

### Required Inputs

| Input | Description | Example |
|-------|-------------|---------|
| strategic question | The core decision to be resolved | "是否采用微服务架构重建核心系统？" |
| stakeholder positions | Key stakeholders and their stated positions/concerns | "IT部门倾向微服务，业务部门担心上线风险" |
| business context | Background, constraints, and strategic environment | "现有系统老旧，18个月后需要支持新监管要求" |
| decision criteria | Factors that will evaluate options (can be refined) | "成本、进度、风险、可维护性、技术成熟度" |

### Optional Inputs (Enhance Decision Quality)

| Input | Description |
|-------|-------------|
| available data | Existing analyses, benchmarks, or evidence |
| constraints | Budget, timeline, regulatory, or resource limits |
| previous decisions | Prior related decisions that create dependencies |
| risk appetite | Organization's willingness to accept uncertainty |
| political dynamics | Known relationships or tensions between stakeholders |

## Deliverables

| # | Deliverable | Description |
|---|-------------|-------------|
| 1 | 决策分析报告 (Decision Analysis Report) | Comprehensive analysis with problem statement, options, evaluation, and recommendation |
| 2 | 选项对比矩阵 (Options Comparison Matrix) | Side-by-side comparison of alternatives against weighted criteria |
| 3 | 风险评估表 (Risk Assessment per Option) | Risks and mitigations for each viable option |
| 4 | 干系人对齐摘要 (Stakeholder Alignment Summary) | Position map, areas of agreement, unresolved conflicts |
| 5 | 决策建议书 (Decision Recommendation) | Recommended option with detailed rationale |
| 6 | 实施考量 (Implementation Considerations) | Key actions, dependencies, and success factors for selected option |

## Decision Framework (5-Phase Process)

### Phase 1: 问题界定 (Problem Framing)

**目标：明确决策的本质、范围和成功标准**

| 活动 | 输出 | 责任方 |
|------|------|--------|
| 定义核心问题 | 问题陈述（Problem Statement） | 主持人 |
| 确定决策边界 | 决策范围说明书 | 主持人 |
| 识别受益干系人 | 干系人登记册 | 主持人 |
| 制定评估标准 | 初步标准清单（含权重建议） | 全组 |
| 设定决策时间线 | 决策里程碑 | 主持人 |

**问题界定检查清单：**
- [ ] 核心问题是清晰、具体的，而非模糊的战略方向
- [ ] 决策范围已明确界定（包含什么？不包含什么？）
- [ ] 评估标准已初步建立，并得到关键干系人认可
- [ ] 时间约束已明确（是否有硬性截止日期？）

### Phase 2: 选项生成 (Option Generation)

**目标：识别所有可行的备选方案，避免过早收敛**

| 活动 | 输出 | 方法 |
|------|------|------|
| 生成初始选项清单 | 候选选项列表（≥3个） | 头脑风暴、标杆研究 |
| 筛选可行选项 | 可行选项清单 | 初步可行性测试 |
| 完善选项细节 | 选项描述文档 | 专家咨询、数据收集 |
| 确定比较基准 | 基准选项（如"维持现状"） | 主持人 |

**选项生成原则：**
- 至少生成3个实质性不同的选项
- 避免"稻草人"选项（明显劣质作为陪衬）
- 考虑"混合方案"作为第四种可能
- 定义每个选项的准入/准出标准

### Phase 3: 分析评估 (Analysis & Evaluation)

**目标：对每个选项进行系统化评估**

#### 评估标准权重矩阵

| 评估维度 | 权重建议 | 说明 |
|----------|----------|------|
| 战略一致性 | 15-25% | 与组织战略目标的契合度 |
| 成本效益 | 15-25% | 投资回报率、长期成本 |
| 实施风险 | 15-20% | 技术、运营、变更风险 |
| 时间可行性 | 10-15% | 能否在要求时间内完成 |
| 组织准备度 | 10-15% | 能力、文化、变革意愿 |
| 可持续性 | 10-15% | 长期维护、扩展性 |

#### 选项对比矩阵模板

| 评估标准 | 权重 | 选项A | 选项B | 选项C |
|----------|------|-------|-------|-------|
| 战略一致性 | 20% | 评分/说明 | 评分/说明 | 评分/说明 |
| 成本效益 | 25% | 评分/说明 | 评分/说明 | 评分/说明 |
| 实施风险 | 15% | 评分/说明 | 评分/说明 | 评分/说明 |
| 时间可行性 | 15% | 评分/说明 | 评分/说明 | 评分/说明 |
| 组织准备度 | 15% | 评分/说明 | 评分/说明 | 评分/说明 |
| 可持续性 | 10% | 评分/说明 | 评分/说明 | 评分/说明 |
| **加权总分** | 100% | **总计** | **总计** | **总计** |

#### 敏感性分析

| 分析类型 | 方法 | 目的 |
|----------|------|------|
| 权重敏感性 | 调整标准权重±20%，观察结果变化 | 识别决策关键驱动因素 |
| 情景敏感性 | 乐观/基准/悲观情景对比 | 评估不确定性影响 |
| 关键假设测试 | 核心假设反向测试 | 识别假设依赖性 |

### Phase 4: 共识构建 (Consensus Building)

**目标：协调干系人分歧，建立决策支持**

#### 干系人位置映射

```
                    战略价值
                        ↑
                        │
        支持 ●───────● │ ●───────● 强势支持
                      │   (联盟)
                      │
    ──────────────────┼──────────────────→ 实施难度
                      │
        犹豫 ●───────● │ ●───────● 强势反对
                      │
                      │
                    低
```

#### 冲突解决策略

| 冲突类型 | 解决策略 | 适用场景 |
|----------|----------|----------|
| 利益冲突 | 寻找共同利益点，重构问题 | 资源争夺、优先级分歧 |
| 认知冲突 | 提供更多数据、专家意见 | 信息不对称、理解差异 |
| 价值观冲突 | 高层裁决、妥协方案 | 文化、战略方向分歧 |
| 关系冲突 | 单独沟通、第三方调解 | 历史积怨、信任缺失 |

#### 决策会议引导流程

```
议题介绍 (5分钟)
    ↓
选项陈述 (各10分钟)
    ↓
提问澄清 (15分钟)
    ↓
干系人表态 (各5分钟)
    ↓
差距分析 → 返回分析 或 继续
    ↓
决策判定 (共识/投票/裁决)
    ↓
决策记录与承诺
```

### Phase 5: 决策文档化 (Decision Documentation)

**目标：输出完整决策记录，支持后续执行和审计**

#### 决策文档结构

```markdown
# [决策标题] 决策报告
## 1. 决策背景
## 2. 核心问题
## 3. 评估标准与权重
## 4. 备选方案描述
## 5. 选项对比分析
## 6. 风险评估
## 7. 干系人观点摘要
## 8. 决策建议
## 9. 决策依据
## 10. 实施考量与后续行动
## 11. 决策有效期与复审条件
## 12. 附件
```

## Quality Gates

| # | 检查项 | 验证标准 |
|---|--------|----------|
| 1 | 问题清晰性 | 核心问题表述具体、可衡量、有时间边界 |
| 2 | 选项完整性 | 至少3个实质性不同选项，含基准对比 |
| 3 | 分析严谨性 | 评估基于事实和数据，敏感性分析完成 |
| 4 | 干系人参与度 | 关键干系人全程参与，意见被充分记录 |
| 5 | 共识有效性 | 决策获得必要支持，少数意见有记录 |
| 6 | 可执行性 | 决策包含清晰的实施方向和行动项 |
| 7 | 可追溯性 | 决策依据完整记录，可供审计 |

## Common Failure Modes

| 失败模式 | 说明 | 应对 |
|----------|------|------|
| ❌ 伪问题决策 | 对错误的问题进行深度分析 | Phase 1问题界定必须充分 |
| ❌ 锚定效应 | 初始选项主导后续分析 | 强制生成≥3个不同方案 |
| ❌ 群体思维 | 为达成共识压制异议 | 引入红队质疑机制 |
| ❌ 分析瘫痪 | 过度分析导致拖延 | 设定决策截止日期 |
| ❌ 确认偏差 | 只收集支持预设结论的证据 | 要求列出反对证据 |
| ❌ 遗忘成本 | 忽略沉默成本和沉没成本 | 明确区分相关/无关成本 |
| ❌ 执行脱节 | 决策与实施能力不匹配 | 实施考量必须包含在评估中 |

---

## 信息采集（Step 0 — 战略决策前的决策背景采集）

> ⚠️ **执行前必读**：战略决策需要明确的决策问题和备选方案。

### Step 0.1 — 决策上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 决策问题描述 | 请告知 | 标注 `[假设值-请核对]` |
| 备选方案数量 | 请告知 | 标注 `[假设值-请核对]` |
| 决策时间框架 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 战略决策 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 决策问题 | ✅/⚠️/❓ | [描述] |
| 备选方案 | ✅/⚠️/❓ | [数量]个 |
| 决策截止日 | ✅/⚠️/❓ | [日期] |

请确认后"开始战略决策流程"。
═══════════════════════════════════════════
```

---



## Procedure

> **EN Alias**: 本章节同时标记为 `## Operating Procedure (5-Step Process)`，内容完全一致。

## Operating Procedure (5-Step Process)

```
Step 1: 问题界定与范围确认
  ├─ 明确核心决策问题
  ├─ 确定决策边界和标准
  ├─ 识别关键干系人
  └─ 设定决策时间框架

Step 2: 选项生成与筛选
  ├─ 头脑风暴生成候选方案
  ├─ 初步可行性筛选
  └─ 完善各选项详细描述

Step 3: 系统化评估分析
  ├─ 建立评估矩阵（标准×权重）
  ├─ 逐项评分与证据支撑
  ├─ 敏感性分析
  └─ 风险评估

Step 4: 干系人协调与共识
  ├─ 干系人位置映射
  ├─ 冲突识别与解决
  ├─ 决策会议引导
  └─ 共识或裁决确认

Step 5: 文档化与移交
  ├─ 编制决策报告
  ├─ 明确实施方向
  ├─ 建立复审机制
  └─ 移交下游技能
```

## Handoff Recommendations

| 下游技能 | 触发条件 | 交接内容 |
|----------|----------|----------|
| org-structure-builder | 决策涉及组织架构调整 | 新架构方案、职责变化 |
| project-charter-writer | 需要将决策纳入项目章程 | 决策结论、项目范围更新 |
| risk-register-builder | 决策产生新的项目风险 | 风险登记、监控计划 |
| constraint-assumption-register-builder | 决策基于关键假设 | 假设清单、依赖关系 |
