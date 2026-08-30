---
name: "scope-management"
pack: "project-management-pack"
display_name: "范围管理计划"
description: "统一范围管理，融合边界检查和范围定义写作，确保项目范围清晰、变更受控、交付物完整，支持大型银行IT项目的范围管控需求。"
author: li.chen56@gientech.com
department: "BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
scope-management

## Purpose

Unified scope management that combines boundary checking and scope definition writing into a single end-to-end skill: scope analysis → boundary definition → in/out scope catalog → change trigger definition → WBS linkage. Ensures clear scope boundaries, prevents scope creep, and provides traceability to WBS.

> **中文章节名**: `## 目的`（见本skill原始 Purpose 段落内容）

## Procedure

> **EN Alias**: 本章节同时标记为 `## Operating Procedure (4-Step Process)`，内容完全一致。

---

## 信息采集（Step 0 — 范围管理前的上下文采集）

> ⚠️ **执行前必读**：范围管理需要明确的项目范围定义和变更背景。

### Step 0.1 — 范围上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 范围定义来源 | 请告知 | 项目章程/需求/合同 |
| 项目阶段 | 请告知 | 标注 `[假设值-请核对]` |
| 范围边界 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 范围管理 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 范围定义来源 | ✅/⚠️/❓ | [来源] |
| 项目阶段 | ✅/⚠️/❓ | [阶段] |
| 范围边界 | ✅/⚠️/❓ | [说明] |

请确认后"开始范围管理"。
═══════════════════════════════════════════
```

---



## Operating Procedure (4-Step Process)

## When to use

Use this skill when:
- A new project or phase requires clear scope boundaries
- Scope ambiguity is causing cross-team disputes or scope creep
- A change request needs boundary impact analysis
- Creating or reviewing the scope definition document
- Project kickoff planning phase

This skill merges and replaces two fragmented skills:
- `scope-boundary-checker` (PMC-001) — boundary risk analysis
- `inclusions-exclusions-writer` (PMC-007) — in/out scope catalog

**Why merge?** These two skills are two halves of the same workflow. You cannot write the in/out scope catalog without first checking boundaries, and you cannot check boundaries without knowing what deliverables are in scope.

This unified skill handles the **complete scope governance lifecycle:**
```
范围需求 ──→ 边界分析 ──→ 范围定义表 ──→ WBS衔接
              ↓
         灰区待定清单
              ↓
         变更触发定义
```

**When to trigger this skill:**
- A new project is initiated and scope needs to be baselined
- A change request is submitted (scope变更分析)
- A dispute arises about whether something is in scope or out of scope
- Moving from one phase to another (scope reassessment for new phase)
- Before WBS decomposition begins (scope must be baselined first)

---

## Scope Definition Table (范围定义表)

The primary output is a **《范围定义表》** that maps each system or functional item to:
- **Construction Method** (建设方式): 新建/改造/外购/接口
- **Business Owner** (业务负责人): 哪个业务部门
- **Technical Owner** (技术负责人): 哪个技术组
- **Change Trigger** (变更触发条件): 什么情况下可变更
- **Boundary Risk** (边界风险): 🔴高/🟡中/🟢低

### Scope Definition Table Template

| 序号 | 系统/功能项 | 业务类别 | 建设方式 | 业务负责人 | 技术负责人 | 变更触发条件 | 边界风险 | 备注 |
|------|-----------|---------|---------|---------|---------|------------|---------|------|
| 1 | 核心账务系统 | 存款/贷款/结算 | 新建 | 营运部 | 核心组 | 监管重大政策变更 | 🟢 | 里程碑M90 |
| 2 | 客户信息系统(CIF) | 客户管理 | 改造 | 客户管理部 | 客户组 | 监管CIF规范变更 | 🟡 | 关联核心系统 |
| 3 | 支付系统 | 清算结算 | 改造 | 支付部 | 渠道组 | 人行接口规范锁定后禁止大变 | 🔴 | 硬依赖人行 |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

### Construction Method Classification (建设方式)

| 建设方式 | 定义 | 适用场景 | 变更敏感性 |
|---------|------|---------|----------|
| **新建** | 从零开始构建 | 全新的业务系统/平台 | 中等（需求相对可控） |
| **改造** | 对现有系统进行功能增强 | 存量系统升级 | 高（存量逻辑复杂） |
| **外购** | 采购成熟套装软件 | 通用功能如CRM/报表 | 低（受限于产品） |
| **接口** | 系统间对接集成 | 第三方系统连接 | 高（依赖方不可控） |

---

## Boundary Analysis (边界分析)

### Scope Edge Types

| 边界类型 | 定义 | 示例 | 风险等级 |
|---------|------|------|---------|
| **清晰边界** | 明确属于项目范围 | 核心系统新功能开发 | 🟢 |
| **清晰排除** | 明确不属于项目范围 | 旧系统历史数据清理 | 🟢 |
| **灰区-高风险** | 归属不清晰且对项目有重大影响 | 历史数据迁移范围 | 🔴 |
| **灰区-中风险** | 归属不清晰但影响有限 | 报表格式调整 | 🟡 |
| **争议区** | 多方对归属有不同理解 | 某一功能属于核心还是外围 | 🔴 |

### Boundary Risk Classification

| 风险等级 | 判定标准 | 处理方式 |
|---------|---------|---------|
| 🟢 低 | 归属清晰，双方无争议 | 直接纳入范围定义表 |
| 🟡 中 | 灰区，但影响有限（工时<5人天或不影响里程碑） | 纳入范围定义表，注明"待确认" |
| 🔴 高 | 灰区，影响显著（工时>5人天或影响里程碑/成本>1%） | 移入"灰区待定清单"，上报PMO裁决 |

---

## Gray Zone Pending List (灰区待定清单)

Items that cannot be immediately classified go into a pending list:

| 序号 | 灰区事项描述 | 涉及方 | 影响评估 | 建议方案 | 决策权限 | 计划裁决日期 |
|------|------------|--------|---------|---------|---------|------------|
| G01 | 历史数据清理是否在项目范围内 | 营运部/IT部 | 影响成本估算±15% | 建议排除，由运维团队处理 | PMO | 2026/03/15 |

**灰区处理流程:**
```
Step 1: 识别灰区 → 移入待定清单
Step 2: 评估影响（工时/成本/进度）
Step 3: 提出建议方案
Step 4: 确定决策权限（PMO裁决 / SCCB裁决）
Step 5: 确定裁决日期（不超过2周）
Step 6: 裁决后移出待定清单，纳入范围定义表
```

---

## Change Trigger Definition (变更触发条件)

Every scope item must have an explicit **change trigger** — the condition under which its scope can be legitimately changed:

### Change Trigger Types

| 触发类型 | 定义 | 示例 | 变更流程 |
|---------|------|------|---------|
| **监管强制** | 法律法规或监管要求变化 | 人行新规导致接口范围变更 | 免SCCB，PMO特批后即生效 |
| **业务必要** | 业务目标无法达成 | 核心功能遗漏导致开业风险 | 正常变更流程 |
| **技术必要** | 技术方案不可行 | 现有架构无法支撑需求性能 | 正常变更流程 |
| **双方认可** | 甲方主动要求增加 | 行方提出新需求 | 正常变更流程，需甲方确认 |
| **不可抗力** | 外部不可控因素 | 供应商倒闭/政策突变 | 紧急变更流程 |

### Change Trigger NOT Valid Examples

| ❌ 不正当触发 | 说明 | 正确做法 |
|------------|------|---------|
| "业务觉得应该做" | 未经正式变更流程的口头要求 | 必须走变更申请流程 |
| "技术上可以顺手做" | 范围外的顺手行为 | 不得擅自扩大范围 |
| "其他项目也在做" | 攀比式范围蔓延 | 明确范围边界，禁止攀比 |
| "合同没写不能做" | 合同未明确排除即默认包含 | 合同起草时明确排除项 |

---

## WBS Linkage Map (WBS衔接图)

Each scope item in the 范围定义表 must link to WBS elements:

```
范围定义表 ──→ WBS映射规则:
- 一个系统/功能项 → 对应一个或多个WBS Level 2工作组
- 每个WBS Level 3工作包 → 必须回溯到某个范围定义表序号
- 范围变更时 → 同步评估WBS工作包影响
```

### WBS Linkage Fields (added to 范围定义表)

| 字段 | 说明 |
|------|------|
| 关联WBS Level 2 | 对应的子系统/工作组编号 |
| 关联WBS Level 3数量 | 该系统涉及的工作包数量 |
| 估算工时(人天) | 该系统分解后的总工时 |
| 范围变更WBS影响 | 变更触发时需重新评估的WBS范围 |

---

## Operating Procedure (4-Step Process)

```
Step 1: 范围需求输入
  ├─ 收集项目背景、业务目标、已知约束
  ├─ 收集候选交付物清单（来自项目章程或业务需求）
  ├─ 收集变更申请（如有）
  └─ 识别涉及的业务/技术干系人

Step 2: 边界分析
  ├─ 对每个交付物判定：清晰包含/清晰排除/灰区
  ├─ 对每个灰区评估影响和风险等级
  ├─ 灰区🔴 → 灰区待定清单，限期PMO裁决
  └─ 输出：初步范围清单（带边界风险标注）

Step 3: 范围定义表编制
  ├─ 为每个清晰项填写范围定义表
  ├─ 为每个🟡灰区填写建议方案
  ├─ 为每个范围项定义变更触发条件
  ├─ 建立WBS映射（Level 2/3对应关系）
  └─ 输出：完整范围定义表 + 灰区待定清单

Step 4: 范围基线发布
  ├─ PMO审核范围定义表
  ├─ SCCB审批重大灰区裁决（如有）
  ├─ 范围基线纳入配置管理（版本锁定）
  └─ 移交wbs-builder进行WBS分解
```

---

## Quality Gates

- [ ] Every system/functional item in scope has a corresponding entry in the 范围定义表
- [ ] Every entry has a defined Change Trigger (变更触发条件)
- [ ] All gray zone items (🟡/🔴) are on the 灰区待定清单 with a resolution date
- [ ] Every 🔴 gray zone has been escalated to PMO or SCCB for resolution
- [ ] Every scope item is linked to at least one WBS Level 2 element
- [ ] The total estimated effort in the 范围定义表 is consistent with WBS totals (±5%)
- [ ] The scope baseline has been approved and locked in the configuration management system

## Failure Modes

| Failure Mode | Detection | Fix |
|-------------|-----------|-----|
| Scope items lack change triggers | Changes requested without clear basis | Add change trigger to every entry before baselining |
| Gray zones left unresolved | G-zone items remain on pending list > 2 weeks | PMO weekly review of pending list |
| Scope-WBS linkage missing | Scope changes don't update WBS | Enforce scope-WBS mapping as a quality gate |
| Boundary risk too low | 🔴 situations not identified early | Challenge "obvious" scope items; apply boundary risk assessment |
| Change trigger too loose | "任何合理变更" as trigger | Change triggers must be specific events, not subjective judgment |
| Scope baseline changed without CCB | Unauthorized scope changes | All scope changes must go through change-control skill |

## Handoff Targets

| 下游Skill | 触发时机 | 交接内容 |
|-----------|---------|---------|
| wbs-builder | 范围基线发布后 | 范围定义表（含WBS Level 2映射） |
| constraint-assumption-register-builder | 范围基线发布后 | 范围假设（哪些是假设而非已知） |
| requirements-control | 范围基线发布后 | 范围基线（需求管控的基准） |
| change-control | 任何范围变更申请 | 变更影响分析 + 范围定义表当前版本 |
