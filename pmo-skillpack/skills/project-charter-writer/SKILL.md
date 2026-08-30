---
name: "project-charter-writer"
pack: "project-management-pack"
display_name: "项目管理章程"
description: "编写全面的项目章程，定义项目目的、范围、目标、干系人、治理结构、组织层级、实施阶段和管理流程，引导项目团队从立项到执行全流程。"
author: li.chen56@gientech.com
department: "BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
project-charter-writer

## Purpose

Write a comprehensive, implementation-grade project charter that goes beyond project initiation to define the full governance framework, organizational structure, management processes, implementation phases, and deliverable register — enabling the project team to execute from day one.

**This skill produces project charters suitable for large-scale, multi-team, multi-phase projects** (e.g., banking core system modernization, government IT transformation, enterprise ERP implementations) where multiple departments, vendors, and stakeholder groups must coordinate over 12+ months.

## When to use
## Trigger this skill when

- A project, delivery effort, or formal planning activity needs a authoritative control artifact that teams will reference throughout the project lifecycle.
- The project involves multiple departments, multiple implementation vendors, or a complex governance hierarchy (decision layer → leadership layer → execution layer).
- The output must be specific enough to assign work, track deliverables, escalate issues, and measure success — not just a one-page executive summary.
- You need a charter that defines WHO does WHAT, WHEN, with WHAT process, producing WHICH documents, across all implementation phases.

## Expected inputs

### Required inputs

| Input | Description | Example |
|-------|-------------|---------|
| problem/opportunity statement | Business driver or opportunity being addressed | "现有核心系统老化，频繁故障影响业务连续性" |
| project objective | Clear, measurable project goal | "18个月内完成新核心系统上线，实现平稳切换" |
| known stakeholders | List of departments, groups, or individuals involved | "行领导、IT部门、营运部、财务部等10个部门" |
| constraints | Budget, timeline, resource, regulatory constraints | "预算1200万，18个月周期，须符合监管要求" |
| success criteria | Quantifiable success metrics | "按时投产，系统可用性≥99.5%" |

### Optional inputs (enhance charter quality significantly)

| Input | Description |
|-------|-------------|
| implementation phases | Known phase boundaries or milestones |
| organizational structure | Existing governance or team structure |
| major risks | Already-identified high-level risks |
| regulatory requirements | Compliance or regulatory constraints |
| vendor/involvement | External partners or implementation vendors |

## Deliverables

| # | Deliverable | Description |
|---|-------------|-------------|
| 1 | 项目章程 (Project Charter) | Master document containing all sections below |
| 2 | 项目组织架构 (Organization Structure) | Three-layer governance hierarchy (决策层/领导层/执行层) |
| 3 | 项目范围说明书 (Scope Statement) | In-scope and out-of-scope boundaries |
| 4 | 治理矩阵 (Governance Matrix) | RACI for key decisions and processes |
| 5 | 实施阶段规划 (Implementation Phases) | 6-8 phases with entry/exit criteria |
| 6 | 管理规范摘要 (Management Process Summary) | Plan, issue escalation, communication, quality, requirements, architecture |
| 7 | 交付物清单 (Deliverable Register) | 28+ documents with owner, timing, template reference |
| 8 | 风险问题清单 (Risk & Issue Register) | Top risks and escalation paths |
| 9 | 沟通计划摘要 (Communication Plan Summary) | Meeting cadence, reporting rhythm |
| 10 | 下一技能建议 (Handoff Recommendations) | Next skills to invoke based on charter outputs |

## Organizational Structure (Required for Large Projects)

### Three-Layer Governance Architecture

```
┌─────────────────────────────────────────────────────┐
│                   决策层 (Decision Layer)            │
│  项目管理委员会 / Project Steering Committee          │
│  - 制订战略方向和重大里程碑                          │
│  - 审批高层计划、重大变更                           │
│  - 解决重大、全局性问题                              │
└─────────────────────────────────────────────────────┘
                          ↑
┌─────────────────────────────────────────────────────┐
│                   领导层 (Leadership Layer)           │
│  项目管理办公室 / PMO                                │
│  - 监督项目实施，管控预算和进度                      │
│  - 批准关键业务和技术方案                            │
│  - 向决策层汇报进展                                  │
└─────────────────────────────────────────────────────┘
                          ↑
┌─────────────────────────────────────────────────────┐
│                   执行层 (Execution Layer)            │
│  总体组 / 技术架构组 / 需求管理组 / 质量管理组       │
│  测试管理组 / 安全管理组 / 基础环境组 / 综合保障组    │
│  风险管理组 / 各项目组                               │
└─────────────────────────────────────────────────────┘
```

### 10 Functional Group Responsibilities

| 组织/组 | 核心职责 | 关键交付物 |
|---------|----------|------------|
| **总体组** | 范围/进度把控，审核发布需求/技术方案，牵头制定演练和投产方案 | 项目主计划、架构决策、需求变更评审 |
| **技术架构组** | 技术路线选择，应用架构原则，服务/数据标准制定 | 架构设计方案、服务规范、数据标准 |
| **需求管理组** | 需求完整性/正确性，业务目标定义，变更管理 | 需求规格说明书、需求跟踪矩阵、需求变更申请 |
| **质量管理组** | 质量保证计划，项目进度管控，周/月报告，配置管理 | 质量报告、进度报告、会议纪要、配置审计报告 |
| **测试管理组** | 测试准入/准出标准，系统/性能/安全测试规划 | 测试方案、测试报告、缺陷管理报告 |
| **安全管理组** | 安全方案制定，安全测评组织，安全合规 | 安全评估报告、安全需求说明书 |
| **基础环境组** | 硬件/网络/存储资源规划，环境搭建与维护 | 基础设施方案、环境部署计划 |
| **综合保障组** | 场地/设备/会议/后勤保障，考勤/请假/保密管理 | 场地协调记录、考勤报告 |
| **风险管理组** | 风险制度建设、内控合规、监管协调 | 风险评估报告、监管沟通记录 |
| **各项目组** | 日常实施管理，需求/设计/开发/测试/上线执行 | 各阶段交付物 |

## Implementation Phases (6 Phases)

| 阶段 | 名称 | 周期参考 | 关键活动 | 主要交付物 |
|------|------|----------|----------|------------|
| 1 | **项目启动** | Phase 1 | 项目实施方案、团队入场、组织架构、整体计划、工作说明书编制；项目启动会 | 工作说明书、项目实施方案、整体实施计划、人力资源规划、环境资源规划、项目管理要求、开发规范 |
| 2 | **需求分析** | Phase 2 | 需求调研、需求编写、需求评审、需求确认；测试方案和培训方案制定 | 需求规格说明书、用户验收测试方案、测试案例、培训方案 |
| 3 | **系统设计** | Phase 3 | 概要设计、详细设计、接口设计、基础设施设计；测试方案和用户手册编写启动 | 功能设计说明书、详细设计说明书、接口说明书、集成测试方案、性能测试方案、部署计划、用户手册 |
| 4 | **开发与测试** | Phase 4-5 | 客户化开发、单元测试、代码审核；集成测试、性能测试、用户验收测试；投产演练方案制定 | 单元测试报告、代码审核报告、集成测试报告、性能测试报告、用户验收测试报告、切换上线方案 |
| 5 | **上线与演练** | Phase 6 | 投产演练、数据迁移、系统切换、绿灯测试、试营业；上线后保障 | 切换演练报告、切换上线方案、分时计划、指挥方案、上线总结报告 |
| 6 | **验收与收尾** | Phase 7 | 试运行稳定后验收、项目文档归档、项目后评价 | 试运行总结报告、项目验收报告、投产报告、后评价报告 |

## Management Process Summaries

### 1. 计划管理 (Plan Management)

**流程：制定 → 审核 → 发布 → 跟踪 → 变更**

| 环节 | 责任组 | 说明 |
|------|--------|------|
| 主计划制定 | 质量管理组 | 提出主计划框架（含里程碑），征求各组意见 |
| 子计划制定 | 各项目组 | 根据主计划制定本组详细计划 |
| 计划审核 | 质量管理组 | 检查任务完整性、跨组一致性、与主计划无冲突 |
| 计划发布 | 总体组/PMO | 报项目管理办公室/委员会批准后发布 |
| 计划跟踪 | 质量管理组 | 周/日跟踪，关键环节每日更新 |
| 计划变更 | 变更申请人→总体组→PMO→委员会 | 变更影响分析→审批→发布新计划 |

**计划制定要求：**
- 任务覆盖全部工作内容，完成全部任务即完成项目
- 每项任务描述清晰、无歧义
- 计划时间要求到天
- 准确描述任务间关联关系（前置任务）
- 每项任务落实到具体负责人和执行人
- 明确任务交付物（报告、手册、清单、表单、会议纪要等）
- 最小级别任务工期不超过一周；提前两周做滚动细化

### 2. 问题/风险管理 (Issue & Risk Management)

**问题/风险收集 → 推进解决 → 升级上报 → 跟踪闭环**

| 级别 | 推进主体 | 升级路径 |
|------|----------|----------|
| 一般问题 | 项目组自行解决 | — |
| 升级问题（组内无法解决） | 项目组 → 质量管理组 | 周报/邮件/专题会 |
| 重大问题（PMO无法协调） | 质量管理组 → 总体组 | 问题风险报告 |
| 全局问题（总体组无法解决） | 总体组 → PMO → 委员会 | 专题汇报 |

### 3. 沟通管理 (Communication Management)

| 沟通类型 | 频率 | 责任人 | 内容 | 提交时间 |
|----------|------|--------|------|----------|
| 工作周报 | 每周 | 项目经理 | 进度、工作总结、下周计划、问题风险 | 周五12:00 |
| 项目月报 | 每月 | 项目经理 | 总体进展、阶段成果、下月安排、问题建议 | 每月最后工作日24:00 |
| 项目群简报 | 每月 | 质量管理组 | 项目群整体执行情况 | 每月第一个工作日24:00 |
| 项目群周例会 | 每周 | 质量管理组 | 进度汇报、关键问题风险、下周安排 | 周一 |
| 项目组周例会 | 每周 | 项目经理 | 工作通报、问题讨论、下周安排 | 周五 |
| 阶段汇报会 | 重要节点 | PMO | 向委员会汇报进度、问题、需决策事项 | 节点完成后 |

### 4. 质量管理 (Quality Management)

**活动循环：质量计划 → 交付物提交 → 质量审计 → 问题跟踪 → 改进**

| 质量审计类型 | 审计内容 | 执行主体 |
|--------------|----------|----------|
| 产品审计 | 各阶段交付物质量（文档规范、范围完整性、功能点） | 质量管理组 |
| 过程审计 | 项目执行是否按要求执行了规定动作（如WBS制定、评审记录） | 质量管理组 |

### 5. 需求管理 (Requirements Management)

**流程：受理 → 分析 → 评审 → 变更评估 → 审批 → 实现 → 跟踪**

| 环节 | 责任组 | 说明 |
|------|--------|------|
| 需求受理 | 需求管理组+技术架构组 | 评估需求与项目的关联性、协同关系 |
| 需求跟踪 | 项目组专人 | 维护需求跟踪矩阵，记录功能点和状态 |
| 需求变更评估 | 项目经理 | 判断是否为重大变更（工作量>10%或影响里程碑） |
| 重大变更评审 | 项目经理组织 | 技术可行性、关联影响、风险分析、紧急程度 |
| 变更审批 | 总体组/PMO/委员会 | 按影响程度逐级审批 |

### 6. 架构管理 (Architecture Management)

| 管理领域 | 流程 | 责任组 |
|----------|------|--------|
| 应用系统基线 | 申请→审核→修改→发布 | 技术架构组 |
| 服务/数据规范 | 建议→形成规范→审核→发布 | 技术架构组 |
| 架构例外 | 申请→技术架构组审核→科技部门审批→执行 | 技术架构组 |

## Deliverable Register (28 Documents)

### 启动阶段 (Initiating)

| # | 文档名称 | 模板号 | 责任人 | 提交时机 |
|---|----------|--------|--------|----------|
| 1 | 商务合同 | 3 | 项目经理 | 项目启动前 |
| 2 | 项目工作任务说明书 | 4 | 项目经理 | 项目启动前 |
| 3 | 项目章程 | 6 | 业务经理 | 项目启动前 |
| 4 | 项目总体（高层）实施计划 | 7 | 业务经理 | 项目启动前 |

### 规划阶段 (Planning)

| # | 文档名称 | 模板号 | 责任人 | 提交时机 |
|---|----------|--------|--------|----------|
| 5 | 业务需求报告 | 8 | 业务经理 | 需求阶段 |
| 6 | 需求跟踪矩阵 | 53 | 业务经理 | 需求阶段，定期更新 |
| 7 | 业务需求说明书 | 9 | 业务经理 | 需求阶段 |
| 8 | 安全需求说明书 | 10 | 项目经理 | 需求阶段 |
| 9 | 架构管理意见书 | 11 | 架构管理组 | 需求报告提交后 |
| 10 | 项目详细任务（WBS）计划 | 12 | 项目经理 | 计划阶段 |
| 11 | 配置管理计划 | 13 | 配置管理员 | 计划阶段 |

### 执行阶段 (Executing)

| # | 文档名称 | 模板号 | 责任人 | 提交时机 |
|---|----------|--------|--------|----------|
| 12 | 总体架构设计说明书 | 17 | 项目经理 | 实施阶段 |
| 13 | 详细设计说明书 | 18 | 项目经理 | 实施阶段 |
| 14 | 测试需求 | 51 | 测试经理 | 实施阶段 |
| 15 | 测试需求评审表 | 52 | 测试经理 | 实施阶段 |
| 16 | 性能测试用例 | 55 | 性能测试经理 | 测试阶段 |
| 17 | 性能测试计划(方案) | 56 | 性能测试经理 | 测试阶段 |
| 18 | 性能测试报告 | 26 | 性能测试经理 | 测试阶段 |
| 19 | 用户验收测试计划 | 27 | 业务经理 | 测试阶段 |
| 20 | 用户验收测试用例 | 29 | 业务经理 | 测试阶段 |
| 21 | 用户验收测试（总结）报告 | 30 | 业务经理 | 测试阶段 |

### 监控阶段 (Monitoring)

| # | 文档名称 | 模板号 | 责任人 | 提交时机 |
|---|----------|--------|--------|----------|
| 22 | 用户操作手册 | 31 | 业务经理 | 系统投产前 |
| 23 | 运维手册 | 32 | 项目经理 | 系统投产前 |
| 24 | 用户培训计划 | 56 | 项目经理 | 系统投产前 |
| 25 | 培训记录 | 57 | 项目经理 | 系统投产后 |
| 26 | 新系统（项目）上线申请报告 | 35 | 业务经理 | 系统上线前一周 |
| 27 | 上线方案（含风险评估和应急预案） | 36 | 业务经理 | 系统上线前一周 |
| 28 | 项目变更申请表 | 38 | 业务经理 | 需求定稿后 |
| 29 | 项目变更管理记录表 | 54 | 业务经理 | 需求定稿后 |
| 30 | 项目状态报告（月报、会议纪要） | 39 | 项目经理 | 项目启动到结项 |
| 31 | 风险问题会议决议项跟踪表 | 55 | 项目经理 | 定期提交 |

### 收尾阶段 (Closing)

| # | 文档名称 | 模板号 | 责任人 | 提交时机 |
|---|----------|--------|--------|----------|
| 32 | 信息系统后评价工作计划 | 42 | 架构管理员 | 按后评价周期 |
| 33 | 信息系统自评价报告 | 43 | 业务经理 | 按后评价周期 |
| 34 | 信息系统后评价方案 | 44 | PMO牵头 | 按后评价周期 |
| 35 | 信息系统后评价报告 | 45 | 后评价工作组 | 按后评价周期 |
| 36 | 试运行总结报告 | 46 | 项目经理 | 上线试运行满一个月后 |
| 37 | 项目验收报告 | 48 | 业务经理 | 满足验收条件后 |
| 38 | 投产报告 | 50 | 项目经理 | 重要系统投产后1个月内 |

---

## 信息采集（Step 0 — 项目章程编写前的数据就绪检查）

> ⚠️ **执行前必读**：项目章程编写需要明确的项目背景和干系人信息。

### Step 0.1 — 章程数据缺口检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 项目目标/范围 | 请告知 | 标注 `[假设值-请核对]` |
| 干系人清单 | 请告知 | 标注 `[假设值-请核对]` |
| 治理架构 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 项目章程 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 项目目标/范围 | ✅/⚠️/❓ | [目标] |
| 干系人 | ✅/⚠️/❓ | [数量]人 |
| 治理架构 | ✅/⚠️/❓ | [说明] |

请确认后"开始编写项目章程"。
═══════════════════════════════════════════
```

---



## Procedure

> **EN Alias**: 本章节同时标记为 `## Operating Procedure (5-Step Process)`，内容完全一致。

## Operating Procedure (5-Step Process)

```
Step 1: 信息收集与背景澄清
  ├─ 确认项目背景、目标、约束
  ├─ 识别干系人及其关注点
  ├─ 了解实施阶段和周期
  └─ 收集已知风险和假设

Step 2: 设计治理架构与组织结构
  ├─ 确定三层层级架构
  ├─ 定义各功能组职责（对照10个标准组）
  └─ 建立RAC矩阵（关键决策×干系人）

Step 3: 规划实施阶段与管理流程
  ├─ 划分实施阶段（启动→规划→执行→监控→收尾）
  ├─ 定义每阶段入口/出口标准
  └─ 制定核心管理流程（计划/问题/沟通/质量/需求/架构）

Step 4: 输出结构化章程文档
  ├─ 按本技能规定的标准结构输出
  ├─ 包含28项交付物清单（带责任人/时间点）
  └─ 显式暴露风险、假设、决策依赖

Step 5: 推荐下游技能衔接
  ├─ scope-boundary-checker（范围边界细化）
  ├─ constraint-assumption-register-builder（约束假设登记）
  ├─ stakeholder-comms-planner（沟通计划）
  ├─ milestone-planner（里程碑规划）
  ├─ wbs-builder（WBS分解）
  └─ risk-register-builder（风险登记册）
```

## Quality Gates

| # | 检查项 | 验证标准 |
|---|--------|----------|
| 1 | 针对性 | 章程完全针对当前项目背景和组织实际情况 |
| 2 | 可执行性 | 治理架构可落地，各组职责明确，无重叠盲区 |
| 3 | 完整性 | 覆盖6大实施阶段、7大管理领域、28项交付物 |
| 4 | 可见性 | 不确定性、假设、风险、决策依赖均显式列出 |
| 5 | 可追踪 | 每项交付物有责任人、时间点、模板号 |
| 6 | 可操作 | 流程清晰，可直接指导项目组日常执行 |
| 7 | 可度量 | 成功标准量化（时间/成本/质量/范围指标） |

## Failure Modes to Avoid

| 失败模式 | 说明 | 应对 |
|----------|------|------|
| ❌ 混淆章程与计划 | 章程定义WHAT/WHO，不定义HOW细节 | 章程管方向，详细计划另立 |
| ❌ 套用通用模板 | 不考虑组织实际情况的章程无法落地 | 基于真实组织架构定制 |
| ❌ 隐藏不确定性 | 将假设当作已知事实会导致后期崩塌 | 所有假设必须显式声明 |
| ❌ 平等对待所有干系人 | 10个部门≠同等参与度 | RACI矩阵区分决策/执行/知会 |
| ❌ 忽略变更控制 | 没有变更流程的章程会快速失效 | 明确变更审批层级 |
| ❌ 交付物清单残缺 | 缺少关键文档（如演练方案、切换计划） | 严格对照28项清单检查 |
| ❌ 组织职责缺失 | 基础环境组、综合保障组常被忽略 | 10个功能组全覆盖 |

## Output Format

The charter shall follow this structure:

```markdown
# [项目名称] 项目管理章程
## 1. 项目背景与目标
## 2. 项目范围
   - 2.1 工作范围（In Scope）
   - 2.2 除外责任（Out of Scope）
## 3. 项目组织架构
   - 3.1 治理层级架构图
   - 3.2 各组织/组职责定义
   - 3.3 RACI矩阵
## 4. 实施阶段规划
   - 4.1 阶段划分与里程碑
   - 4.2 各阶段入口/出口标准
## 5. 项目管理规范
   - 5.1 计划管理
   - 5.2 问题/风险管理
   - 5.3 沟通管理
   - 5.4 质量管理
   - 5.5 需求管理
   - 5.6 架构管理
## 6. 交付物清单
## 7. 约束条件与假设
## 8. 成功衡量标准
## 9. 主要风险与应对
## 10. 待明确事项
## 11. 下游技能建议
```
