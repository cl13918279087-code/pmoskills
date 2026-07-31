---
name: "org-structure-builder"
pack: "project-management-pack"
display_name: "组织架构说明书"
description: "设计并记录项目组织结构，包括治理层级、功能团队定义、角色职责矩阵（RACI）和汇报路线，为大型银行IT项目建立清晰的组织框架。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
---
org-structure-builder

## Purpose

Design comprehensive organizational structures for projects that define governance hierarchies, functional responsibilities, reporting relationships, and coordination mechanisms — ensuring clear accountability and effective information flow across all levels.

**This skill is essential for large-scale, multi-team projects** (e.g., enterprise system implementations, organizational transformations, infrastructure projects) where unclear accountability is a primary failure risk.

## When to use
## Trigger this skill when

- A new project requires establishing an organizational framework from scratch
- Existing organizational structures need to be adapted for project execution
- Governance boundaries between project and BAU (Business As Usual) need clarification
- Multiple vendors or external parties must be integrated into the project structure
- RACI confusion or accountability gaps have been identified as project risks

## Expected Inputs

### Required Inputs

| Input | Description | Example |
|-------|-------------|---------|
| project scope | High-level scope defining work domains | "核心系统重建，包含12个模块，涉及8个部门" |
| known stakeholders | Departments and groups involved | "IT部、营运部、财务部、客服部、外部供应商" |
| governance requirements | Decision-making authority and escalation paths | "重大变更需项目管理委员会批准" |
| team size | Approximate headcount or resource estimate | "项目团队约50人，含20人外部供应商" |

### Optional Inputs

| Input | Description |
|-------|-------------|
| existing organizational context | Current BAU structure that may influence project org |
| regulatory constraints | Compliance requirements affecting org design |
| vendor/integration complexity | Number and nature of external parties |
| governance forums | Existing meeting cadences or decision bodies |
| location/distribution | Geographic distribution of team members |

## Deliverables

| # | Deliverable | Description |
|---|-------------|-------------|
| 1 | 组织架构图 (Organization Chart) | Visual hierarchy showing reporting lines and team groupings |
| 2 | 治理层级图 (Governance Hierarchy Diagram) | Three-layer governance (决策层/领导层/执行层) structure |
| 3 | 角色定义矩阵 (Role Definition Matrix) | Each role's authority, responsibilities, and boundaries |
| 4 | RACI矩阵 (RACI Matrix) | Responsible, Accountable, Consulted, Informed for key activities |
| 5 | 职责说明书 (Responsibility Descriptions) | Detailed role descriptions for key positions |
| 6 | 协调机制规范 (Coordination Mechanism Specs) | Meeting cadences, communication channels, escalation paths |

## Three-Layer Governance Architecture

### Standard Governance Model

```
┌─────────────────────────────────────────────────────────────┐
│                     决策层 (Decision Layer)                   │
│  项目管理委员会 / Project Steering Committee                   │
│  ┌─────────────────────────────────────────────────────┐    │
│  │ 主任：___    副主任：___    成员：___                │    │
│  │                                                     │    │
│  │ 职责：                                               │    │
│  │ • 制订战略方向和重大里程碑                           │    │
│  │ • 审批高层计划、预算、重大变更                       │    │
│  │ • 解决重大、全局性问题                               │    │
│  │ • 资源配置和优先级裁决                               │    │
│  │ • 项目终止或重大方向调整决策                         │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                             │
│  会议频率：每月或重大节点                                     │
│  上报机制：季度汇报、事件触发汇报                              │
└─────────────────────────────────────────────────────────────┘
                            ↑
┌─────────────────────────────────────────────────────────────┐
│                     领导层 (Leadership Layer)                 │
│  项目管理办公室 / PMO                                        │
│  ┌─────────────────────────────────────────────────────┐    │
│  │ 项目总监：___    PMO经理：___                       │    │
│  │                                                     │    │
│  │ 职责：                                               │    │
│  │ • 监督项目实施进展，管控预算和进度                   │    │
│  │ • 批准关键业务和技术方案                             │    │
│  │ • 向决策层汇报进展、问题和风险                       │    │
│  │ • 协调跨组资源和优先级                               │    │
│  │ • 审批重要交付物和阶段成果                           │    │
│  │ • 项目群层面的沟通和协调                             │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                             │
│  会议频率：双周例会、专项会议                                  │
│  上报机制：周报、月报、问题升级                               │
└─────────────────────────────────────────────────────────────┘
                            ↑
┌─────────────────────────────────────────────────────────────┐
│                     执行层 (Execution Layer)                  │
│  ┌────────────┬────────────┬────────────┬────────────┐       │
│  │ 总体组     │ 技术架构组 │ 需求管理组 │ 质量管理组 │       │
│  ├────────────┼────────────┼────────────┼────────────┤       │
│  │ 测试管理组 │ 安全管理组 │ 基础环境组 │ 综合保障组 │       │
│  ├────────────┴────────────┴────────────┴────────────┤       │
│  │              风险管理组 / 各项目组                 │       │
│  └───────────────────────────────────────────────────┘       │
│                                                             │
│  职责：                                                     │
│  • 日常实施管理                                             │
│  • 需求/设计/开发/测试/上线执行                              │
│  • 组内协调和问题解决                                       │
│  • 向PMO/总体组汇报进展                                     │
│                                                             │
│  会议频率：每日站会、周例会、专项会议                         │
└─────────────────────────────────────────────────────────────┘
```

## Functional Group Definitions (10 Standard Groups)

### 1. 总体组 (Project Management Office / PMO)

| 属性 | 内容 |
|------|------|
| **组长** | 项目经理 / 项目管理办公室负责人 |
| **核心职责** | 范围/进度把控，审核发布需求/技术方案，牵头制定演练和投产方案 |
| **关键交付物** | 项目主计划、架构决策、需求变更评审、整体协调 |
| **汇报对象** | PMO经理 → 项目总监 → 决策层 |
| **协作关系** | 与所有功能组协作，负责整体统筹 |

### 2. 技术架构组 (Technical Architecture Group)

| 属性 | 内容 |
|------|------|
| **组长** | 架构师 / 技术负责人 |
| **核心职责** | 技术路线选择，应用架构原则，服务/数据标准制定 |
| **关键交付物** | 架构设计方案、服务规范、数据标准、技术评审报告 |
| **汇报对象** | 总体组/PMO |
| **协作关系** | 与需求组、开发组、测试组紧密协作 |

### 3. 需求管理组 (Requirements Management Group)

| 属性 | 内容 |
|------|------|
| **组长** | 需求分析师 / 业务分析师 |
| **核心职责** | 需求完整性/正确性，业务目标定义，变更管理 |
| **关键交付物** | 需求规格说明书、需求跟踪矩阵、需求变更申请 |
| **汇报对象** | 总体组/PMO |
| **协作关系** | 与业务方、技术组紧密协作 |

### 4. 质量管理组 (Quality Management Group)

| 属性 | 内容 |
|------|------|
| **组长** | 质量经理 / QA负责人 |
| **核心职责** | 质量保证计划，项目进度管控，周/月报告，配置管理 |
| **关键交付物** | 质量报告、进度报告、会议纪要、配置审计报告 |
| **汇报对象** | PMO |
| **协作关系** | 与所有功能组协作，监控整体质量 |

### 5. 测试管理组 (Testing Management Group)

| 属性 | 内容 |
|------|------|
| **组长** | 测试经理 |
| **核心职责** | 测试准入/准出标准，系统/性能/安全测试规划 |
| **关键交付物** | 测试方案、测试报告、缺陷管理报告 |
| **汇报对象** | 质量管理组/PMO |
| **协作关系** | 与开发组、需求组、安全组协作 |

### 6. 安全管理组 (Security Management Group)

| 属性 | 内容 |
|------|------|
| **组长** | 安全工程师 / 安全负责人 |
| **核心职责** | 安全方案制定，安全测评组织，安全合规 |
| **关键交付物** | 安全评估报告、安全需求说明书、合规报告 |
| **汇报对象** | PMO/总体组 |
| **协作关系** | 与技术组、测试组、外部安全审计协作 |

### 7. 基础环境组 (Infrastructure Group)

| 属性 | 内容 |
|------|------|
| **组长** | 基础设施工程师 / 运维负责人 |
| **核心职责** | 硬件/网络/存储资源规划，环境搭建与维护 |
| **关键交付物** | 基础设施方案、环境部署计划、资源使用报告 |
| **汇报对象** | PMO/总体组 |
| **协作关系** | 与技术组、开发组、测试组协作 |

### 8. 综合保障组 (Admin & Support Group)

| 属性 | 内容 |
|------|------|
| **组长** | 综合管理员 / 项目协调员 |
| **核心职责** | 场地/设备/会议/后勤保障，考勤/请假/保密管理 |
| **关键交付物** | 场地协调记录、考勤报告、后勤保障记录 |
| **汇报对象** | PMO |
| **协作关系** | 与所有功能组协作 |

### 9. 风险管理组 (Risk Management Group)

| 属性 | 内容 |
|------|------|
| **组长** | 风险经理 / 内控专员 |
| **核心职责** | 风险制度建设、内控合规、监管协调 |
| **关键交付物** | 风险评估报告、监管沟通记录、合规审计报告 |
| **汇报对象** | PMO/总体组 |
| **协作关系** | 与所有功能组协作，独立评估 |

### 10. 各项目组 (Sub-Project Teams)

| 属性 | 内容 |
|------|------|
| **组长** | 子项目经理 |
| **核心职责** | 日常实施管理，需求/设计/开发/测试/上线执行 |
| **关键交付物** | 各阶段交付物、进度报告、问题记录 |
| **汇报对象** | 总体组/PMO |
| **协作关系** | 按项目需要与各功能组协作 |

## RACI Matrix Template

### Key Project Activities RACI

| 活动 | 项目总监 | PMO经理 | 总体组 | 架构组 | 需求组 | 质量组 | 测试组 | 安全组 | 基础组 | 综合组 |
|------|----------|---------|--------|--------|--------|--------|--------|--------|--------|--------|
| 项目启动决策 | A | R | C | C | C | C | C | C | C | I |
| 整体计划制定 | A | R | R | C | C | C | I | I | C | I |
| 需求定义 | I | C | A | C | R | I | I | C | I | I |
| 架构设计 | I | C | A | R | C | I | I | C | C | I |
| 开发执行 | I | I | A | C | C | I | C | I | C | I |
| 测试执行 | I | I | C | I | C | A | R | C | C | I |
| 上线发布 | A | R | R | C | C | C | C | C | C | R |
| 变更审批 | A | R | R | C | C | C | I | I | I | I |
| 风险管理 | I | A | R | C | C | C | C | C | C | I |
| 进度汇报 | I | A | R | I | I | C | I | I | I | I |

**RACI定义：**
- **R (Responsible)** - 负责执行该活动
- **A (Accountable)** - 对活动结果最终负责
- **C (Consulted)** - 提供输入、参与决策
- **I (Informed)** - 事后通知

## Role Definition Matrix

### Executive Roles

| 角色 | 层级 | 核心职责 | 权限范围 | 汇报频率 |
|------|------|----------|----------|----------|
| 项目管理委员会主任 | 决策层 | 委员会召集，重大决策拍板 | 批准项目章程、预算、重大变更 | 季度/事件触发 |
| 项目管理委员会副主任 | 决策层 | 协助主任，主持日常决策 | 审核非重大变更，指导PMO | 月度 |
| 项目管理委员会成员 | 决策层 | 参与决策，资源调配 | 各职能部门资源调配权 | 月度 |
| 项目总监 | 领导层 | 项目整体把控，跨域协调 | 项目全权管理，向委员会汇报 | 月度 |
| PMO经理 | 领导层 | PMO日常运作，进度管控 | 日常决策，资源协调 | 双周 |

### Functional Lead Roles

| 角色 | 所属组 | 核心职责 | 权限范围 | 汇报频率 |
|------|--------|----------|----------|----------|
| 总体组组长 | 总体组 | 范围进度把控，技术方案审核 | 技术方案批准，变更建议 | 周报 |
| 架构组组长 | 技术架构组 | 架构标准制定，技术决策 | 架构决策，技术规范审批 | 周报 |
| 需求组组长 | 需求管理组 | 需求质量把控，变更管理 | 需求审批，范围建议 | 周报 |
| 质量组组长 | 质量管理组 | 质量管理，进度监控 | 质量标准制定，进度预警 | 周报 |
| 测试组组长 | 测试管理组 | 测试规划与执行 | 测试方案批准，缺陷仲裁 | 周报 |

## Coordination Mechanisms

### Meeting Cadence

| 会议类型 | 频率 | 参与者 | 主持人 | 时长 | 主要议题 |
|----------|------|--------|--------|------|----------|
| 项目管理委员会 | 每月/重大节点 | 委员会成员、PMO | 主任 | 2小时 | 进度汇报、重大决策、风险审议 |
| PMO例会 | 双周 | PMO、各组组长 | PMO经理 | 1小时 | 进展跟踪、问题升级、跨组协调 |
| 项目例会 | 每周 | 全体成员 | 总体组 | 1小时 | 周报、问题讨论、下周计划 |
| 每日站会 | 每日 | 执行层成员 | 轮流 | 15分钟 | 当日任务、阻塞问题 |
| 变更评审会 | 按需 | 总体组、相关组长 | 总体组组长 | 1小时 | 变更评估、影响分析 |
| 风险评审会 | 每月 | PMO、风险组、各组长 | PMO经理 | 1小时 | 风险更新、应对措施 |

### Communication Channels

| 渠道 | 用途 | 参与者 | 频率/时效 |
|------|------|--------|-----------|
| 项目邮件组 | 正式通知、纪要 | 全体成员 | 按需 |
| 项目群（即时通讯） | 日常沟通、紧急事项 | 全体成员 | 实时 |
| 项目门户/文档库 | 文档共享、版本控制 | 全体成员 | 按需 |
| 进度报告系统 | 进度填报、追踪 | 各组长填报，PMO汇总 | 周报 |
| 问题跟踪系统 | 问题录入、跟踪、闭环 | 全体成员 | 实时 |

### Escalation Paths

| 问题级别 | 定义 | 升级路径 | 解决时限 |
|----------|------|----------|----------|
| L1 - 日常问题 | 组内可解决 | 组内自行处理 | 24小时 |
| L2 - 组内升级 | 跨组协调需求 | 组长→总体组/PMO | 48小时 |
| L3 - PMO升级 | PMO无法协调 | PMO→项目总监 | 72小时 |
| L4 - 决策升级 | 需委员会决策 | 项目总监→委员会 | 按会议安排 |

## Organizational Structure Types

### Type A: Functional Organization

**适用场景：** 单一业务线、技术栈一致、外部依赖少

```
项目总监
    └── PMO经理
            ├── 需求组
            ├── 开发组
            ├── 测试组
            └── 运维组
```

### Type B: Matrix Organization (Balanced Matrix)

**适用场景：** 多业务线共享资源、跨部门协调复杂

```
项目总监
    ├── 业务PM ──── 业务线A组
    ├── 业务PM ──── 业务线B组
    └── 技术PM ──── 共享技术平台组
              └── 共享资源池（QA、安全、运维）
```

### Type C: Projectized Organization

**适用场景：** 大型复杂项目、外部供应商多、独立项目团队

```
项目管理委员会
    └── 项目总监
            ├── 总体组
            ├── 业务组（多个）
            ├── 技术组（多个）
            └── 供应商管理组
```

## Quality Gates

| # | 检查项 | 验证标准 |
|---|--------|----------|
| 1 | 完整性 | 所有工作有负责组织，无遗漏区域 |
| 2 | 责任明确性 | 每项活动有且仅有一个A角（Accountable） |
| 3 | 可行性 | 组织设置与可用资源匹配 |
| 4 | 沟通效率 | 层级不超过4层，汇报线清晰 |
| 5 | 变更适应性 | 结构能适应范围/进度变更 |
| 6 | 协调机制 | 跨组协调机制明确定义 |
| 7 | 可视性 | 架构图能被人理解并正确使用 |

## Common Failure Modes

| 失败模式 | 说明 | 应对 |
|----------|------|------|
| ❌ 职责重叠 | 多组对同一工作负责，导致推诿或冲突 | RACI明确区分，每个活动仅一个A角 |
| ❌ 职责空白 | 某项工作无人负责，成为风险盲区 | 全面检查WBS与组织对应关系 |
| ❌ 层级过多 | 超过4层导致信息失真、决策延迟 | 扁平化设计，合并中间层级 |
| ❌ 重技术轻管理 | 只设技术角色，缺少PMO/质量/风险角色 | 按10组标准配置补齐 |
| ❌ 忽略支持角色 | 综合保障、配置管理等被忽视 | 明确支持组职责和资源配置 |
| ❌ 供应商整合缺失 | 外部供应商与内部团队两张皮 | 供应商管理组设置，对齐内部协作 |

## Procedure

> **EN Alias**: 本章节同时标记为 `## Operating Procedure (5-Step Process)`，内容完全一致。

## Operating Procedure (5-Step Process)

```
Step 1: 范围与干系人分析
  ├─ 分析项目范围和工作分解结构
  ├─ 识别关键干系人和职能部门
  ├─ 了解现有组织治理要求
  └─ 确定外部供应商和整合需求

Step 2: 治理架构设计
  ├─ 确定三层治理架构（决策/领导/执行）
  ├─ 定义决策层组成和职责
  ├─ 设计PMO/领导层结构和职责
  └─ 建立汇报和上报机制

Step 3: 功能组设计与配置
  ├─ 按10组标准配置功能组
  ├─ 定义每组职责和关键交付物
  ├─ 确定组长人选和汇报关系
  └─ 评估资源需求和配置

Step 4: RACI与协调机制定义
  ├─ 编制关键活动RACI矩阵
  ├─ 定义会议类型和频率
  ├─ 建立沟通渠道和升级路径
  └─ 明确跨组协调规则

Step 5: 输出与移交
  ├─ 输出组织架构图和治理层级图
  ├─ 编制角色定义和职责说明书
  ├─ 完成RACI矩阵定稿
  └─ 移交下游技能
```

## Handoff Recommendations

| 下游技能 | 触发条件 | 交接内容 |
|----------|----------|----------|
| project-charter-writer | 组织结构需纳入项目章程 | 完整组织架构图、职责定义 |
| stakeholder-comms-planner | 沟通计划需匹配组织架构 | 各角色沟通需求、汇报关系 |
| schedule-sequencer | 进度计划需考虑组织结构 | 各组工作分配、人员配置 |
| wbs-builder | WBS需与组织对应 | 组织-交付物映射关系 |
