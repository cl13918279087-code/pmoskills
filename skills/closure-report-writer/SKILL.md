---
name: "closure-report-writer"
pack: "project-management-pack"
display_name: "项目关闭报告"
description: "正式关闭已完成或取消的项目，归档所有项目记录，捕获并总结经验教训，输出项目关闭报告。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
version: "v1.0.0"
---
closure-report-writer

## Purpose
Formally close a banking program project, producing a **project closure report**, a **project archives index**, a **lessons learned register**, and a **final financial statement**. The closure report confirms that all deliverables have been accepted, all risks and issues are resolved or formally handed over, and all project records are archived. Lessons learned are captured and fed into lessons-learned-summarizer for cross-project knowledge transfer.

## When to use
## Trigger this skill when
- The go-live milestone (M90) has been achieved and the post-production stabilization period (typically 1 month) has passed.
- A project is being cancelled or suspended and all active work must be formally closed.
- The project has achieved all its milestones and only administrative closure remains.
- The steering committee has approved the project's formal closure.
- You need to prepare the final financial statement and performance bonus distribution.

## Expected inputs
- **project charter** — original scope, budget, schedule baseline, and objectives from project initiation
- **final milestone status** — all milestones M00–M99 with actual dates and sign-offs from milestone-planner
- **final EVM data** — final CPI, SPI, final cost variance (CV), and final schedule variance (SV) from earned-value-tracker
- **deliverable sign-offs** — acceptance sign-off documents for all formal external deliverables
- **risk/issue log** — all risks and issues with final resolution status

## Procedure

This skill executes the following procedure:

1. **Verify closure entry criteria** — Confirm all 8 prerequisites (milestones signed, SIT/UAT defects resolved, documents archived, QA audit passed, financial settlement approved, steering committee approval) per the `## Project Closure Entry Criteria` checklist.
2. **Collect inputs** — Gather project charter, final milestone status, final EVM data, deliverable sign-offs, and risk/issue log from the relevant upstream skills.
3. **Produce Closure Report** — Execute `## Closure Report Structure` (Chapters 1–7): project overview, scope summary, quality summary, milestone achievement, final EVM & financial statement, deliverable archive index, and performance bonus distribution.
4. **Capture lessons learned** — Execute `## Lessons Learned Process`: collect via workshops/interviews/surveys, classify by dimension (管理/技术/过程), and register in the Lessons Learned Register template.
5. **Archive all documents** — Execute `## Document Archiving Requirements`: verify QA baseline audit, catalog all management/engineering/configuration items, assign archive destinations and retention periods.
6. **Execute post-closure activities** — Execute `## Post-Closure Activities`: submit closure report for approval, send closure notification to all stakeholder groups, release project team resources.
7. **Quality gate check** — Verify all 8 Quality Gates are satisfied before declaring project formally closed.

---

## Project Closure Entry Criteria

### Prerequisites Before Initiating Closure

| # | 关闭启动条件 | 负责方 | 确认方式 |
|---|-----------|--------|---------|
| 1 | 所有里程碑(M00–M90)已完成且签字确认 | PMO | milestone-planner签认单 |
| 2 | 试运行总结报告已提交并通过（试运行期≥1个月） | PMO/运维 | 《试运行总结报告》 |
| 3 | 全部外部交付物已获业务部门签署验收 | PMO/业务总体组 | 《交付物验收签字表》 |
| 4 | SIT/UAT遗留缺陷已按准出标准关闭，或已转入生产运维流程 | 测试组/PMO | 遗留缺陷清单+业务确认函 |
| 5 | 全部文档已上传VP/X-Zeus/Docshare并通过QA基线审计 | PMO/QA | QA审计报告 |
| 6 | 源代码及受控文档已纳入配置基线管理 | 配置管理员 | 配置基线清单 |
| 7 | 财务决算已完成并通过审批 | PMO/财务部 | 《财务决算报告》批准件 |
| 8 | 项目领导小组批准关闭 | 领导小组 | 项目关闭批准决议 |

### Post-Production Stabilization Criteria

| 指标 | 判定标准 | 说明 |
|------|---------|------|
| **试运行期** | ≥ 1个月 | 上线后正式进入试运行 |
| **严重缺陷数** | ≤ 10个 | 投产后1个月内生产环境严重缺陷数 |
| **系统可用性** | ≥ 99.5% | 关键系统可用时长百分比 |
| **缺陷修复率** | 高/中优先级100%，低优先级≥90% | UAT后遗留缺陷最终处置率 |

---

## Closure Report Structure

### Chapter 1 — Project Overview & Objective Achievement

#### 1.1 Project Basic Information

| 字段 | 内容 |
|------|------|
| **项目名称** | [项目名称] |
| **项目编号** | [项目编号] |
| **项目类型** | 新建/配套改造/配合测试/保留/替换下线 |
| **启动日期** | YYYY/MM/DD |
| **计划投产日期** | YYYY/MM/DD |
| **实际投产日期** | YYYY/MM/DD |
| **项目关闭日期** | YYYY/MM/DD |
| **项目经理** | [姓名] |
| **项目总监** | [姓名] |
| **项目群经理** | [姓名] |

#### 1.2 Project Objectives Achievement

| 项目目标 | 原定指标 | 实际达成 | 达成情况 |
|---------|---------|---------|---------|
| 开业目标 | YYYY/MM/DD | YYYY/MM/DD | ✅达成 / ⚠️延期(±X天) |
| 监管报送达标 | [监管要求] | [实际结果] | ✅达成 / ⚠️偏差 |
| 需求覆盖 | X个功能点 | X个功能点 | ✅达成 / ⚠️范围变更 |
| 预算控制 | BAC = XXX万元 | EAC = XXX万元 | ✅节约XXX万 / ⚠️超支XXX万 |
| 里程碑完成率 | X/X = 100% | X/X = XX% | ✅100% / ⚠️X项未完成 |

---

### Chapter 2 — Scope Summary

#### 2.1 Scope Baseline vs. Actual

| 项目 | 范围基线 | 实际执行 | 变更量 |
|------|---------|---------|--------|
| WBS顶层包数量 | [基线] | [实际] | +/− X |
| L3工作包数量 | [基线] | [实际] | +/− X |
| 功能模块数量 | [基线] | [实际] | +/− X |

#### 2.2 Change Control Summary

| 指标 | 数量 | 说明 |
|------|------|------|
| SCCB审批变更数量 | X项 | 涉及工作量和预算调整 |
| PMO批准变更数量 | X项 | 范围内部调整 |
| 变更工作量增加 | XX人天 | 占原总工作量X% |
| 变更预算影响 | +/−XX万元 | 占BAC X% |

---

### Chapter 3 — Quality Summary

#### 3.1 Test Metrics

| 测试阶段 | 用例数 | 执行率 | 通过率 | 缺陷密度 | 准出标准 |
|---------|--------|--------|--------|---------|---------|
| 单元测试 | | | | | |
| SIT | | ≥95% | | ≤5/功能点 | ✅/❌ |
| UAT | | =100% | | | ✅/❌ |

#### 3.2 Defect Summary

| 缺陷级别 | 总数 | 修复数 | 修复率 | 未关闭 | 处置方式 |
|---------|------|--------|-------|--------|---------|
| 致命 | X | X | 100% | 0 | — |
| 严重 | X | X | 100% | 0 | — |
| 中等 | X | X | ≥90% | X | 转入生产运维 |
| 轻微 | X | X | ≥80% | X | 后续版本处理 |

#### 3.3 Production Stability

| 指标 | 实际值 | 判定标准 | 是否达标 |
|------|-------|---------|---------|
| 试运行时长 | X个月 | ≥1个月 | ✅/❌ |
| 严重缺陷数（1个月内） | X个 | ≤10个 | ✅/❌ |
| 系统可用性 | 99.X% | ≥99.5% | ✅/❌ |

---

### Chapter 4 — Milestone Achievement Summary

| 里程碑ID | 里程碑名称 | 计划日期 | 实际日期 | 偏差(天) | 签字确认 |
|---------|---------|---------|---------|---------|---------|
| M00 | 项目立项 | | | | ✅/签字日期 |
| M10 | 需求冻结 | | | | ✅/签字日期 |
| M30 | 代码冻结 | | | | ✅/签字日期 |
| M50 | SIT准出 | | | | ✅/签字日期 |
| M70 | UAT准出 | | | | ✅/签字日期 |
| M90 | 切换投产 | | | | ✅/签字日期 |
| M99 | 项目关闭 | | | | ✅/签字日期 |

**里程碑达成率:** X/X = XX%
**平均偏差:** ±X天
**关键里程碑全部按期完成:** ✅/❌

---

### Chapter 5 — Final EVM & Financial Statement

#### 5.1 Final EVM Metrics

| 指标 | 基线值 | 最终值 | 偏差 | 状态 |
|------|-------|-------|------|------|
| **BAC** (预算总额) | XXX万元 | XXX万元 | — | — |
| **AC** (实际成本) | — | XXX万元 | — | — |
| **EV** (挣值) | — | XXX万元 | — | — |
| **CPI** | 1.00 | X.XX | +/−X.XX | 🟢/🟡/🔴 |
| **SPI** | 1.00 | X.XX | +/−X.XX | 🟢/🟡/🔴 |
| **CV** (成本偏差) | 0 | +/−XXX万元 | XXX万元 | 🟢/🟡/🔴 |
| **SV** (进度偏差) | 0 | +/−XXX万元 | XXX万元 | 🟢/🟡/🔴 |
| **EAC** (完工估算) | BAC | XXX万元 | +/−XXX万元 | — |
| **VAC** (完工偏差) | 0 | +/−XXX万元 | XXX万元 | 🟢/🟡/🔴 |

#### 5.2 Final Cost Breakdown

| 预算科目 | 预算(万元) | 实际(万元) | 偏差(万元) | 说明 |
|---------|---------|---------|---------|------|
| 人力成本（内部） | | | | |
| 人力成本（外包） | | | | |
| 第三方费用 | | | | |
| 基础设施 | | | | |
| 信创改造 | | | | |
| 培训与知识转移 | | | | |
| 项目管理 | | | | |
| 风险储备动用 | | | | |
| 管理储备动用 | | | | |
| **合计** | **XXX万元** | **XXX万元** | **+/−XXX万元** | |

#### 5.3 Financial Approval Flow

```
Step 1: PMO依据考勤、质量、进度等量化指标
        → 完成各组及个人绩效考核计算
        → 生成《绩效考核报告》

Step 2: 报项目领导小组办公室审批
        → 输出《财务决算报告》

Step 3: 人力资源部及财务部执行发放
        → 输出《奖金发放记录》

Step 4: 存档《财务决算报告》至VP/Docshare
```

---

### Chapter 6 — Deliverable Archive Index

All deliverables must be catalogued in the archive index:

| 序号 | 文档编号 | 文档名称 | 版本 | 归档日期 | 归档位置 | QA审计 | 备注 |
|------|---------|---------|------|---------|---------|--------|------|
| 1 | | | | | | ✅/❌ | |
| … | | | | | | | |

#### Management Documents (管理类)
- [ ] 项目章程 (Project Charter)
- [ ] 项目主计划 (Project Master Schedule)
- [ ] 风险登记与跟踪表 (Risk Register)
- [ ] 问题跟踪表 (Issue Log)
- [ ] 会议纪要 (Meeting Minutes) — all meetings
- [ ] 周报/月报 (Weekly/Monthly Status Reports)
- [ ] SCCB变更审批记录 (SCCB Change Records)
- [ ] 绩效考核报告 (Performance Review Report)
- [ ] 财务决算报告 (Final Financial Statement)

#### Engineering Documents (工程类)
- [ ] 需求规格说明书 (Requirements Specification)
- [ ] 架构设计文档 (Architecture Design)
- [ ] 详细设计文档 (Detailed Design)
- [ ] 数据库设计文档 (Database Design)
- [ ] 单元测试报告 (Unit Test Reports)
- [ ] SIT测试报告 (SIT Test Report)
- [ ] UAT测试报告 + 验收签字 (UAT Report + Sign-off)
- [ ] 上线方案 (Go-Live Plan)
- [ ] 切换方案 (Cutover Plan)
- [ ] 应急预案 (Contingency Plan)
- [ ] 运维手册 (Operations Manual)
- [ ] 培训教材 (Training Materials)
- [ ] 试运行总结报告 (Trial Operation Summary)

#### Configuration Items (配置项)
- [ ] 源代码 (Source Code) — CC/SVN基线
- [ ] 受控文档 (Controlled Documents) — CC/SVN基线
- [ ] 构建版本 (Build Artifacts) — 发布版本库

---

### Chapter 7 — Performance Bonus & Team Recognition

#### 7.1 Performance Bonus Distribution

| 评估维度 | 权重 | 各组得分 | 说明 |
|---------|------|---------|------|
| 进度达成 | 30% | | 里程碑按期完成率 |
| 质量达成 | 30% | | 缺陷密度、测试覆盖率 |
| 成本控制 | 20% | | EAC vs BAC偏差 |
| 团队协作 | 20% | | PMO/领导小组评分 |

| 团队/个人 | 评定等级 | 奖金分配 | 备注 |
|---------|---------|---------|------|
| [团队名称] | 优秀/良好/合格 | XX元 | |
| [个人姓名] | 优秀 | XX元 | |

#### 7.2 Outstanding Contributor Recognition

| 姓名 | 部门/角色 | 推荐理由 | 荣誉级别 |
|------|---------|---------|---------|
| | | | 行级/部门级 |

---

## Lessons Learned Process

### Collection Methods

| 方法 | 适用场景 | 负责人 | 输出 |
|------|---------|--------|------|
| **阶段总结会/研讨会** | 各阶段结束、重大项目里程碑 | PMO/资深顾问 | 总结材料、会议纪要 |
| **相关方访谈** | 项目收尾阶段 | PMO | 访谈记录 |
| **问卷调查** | 广泛收集改进建议 | PMO | 问卷汇总报告 |
| **小组总结文档** | 各组自行编写 | 各职能组组长 | 《季度/项目总结》 |

### Classification Dimensions

| 维度 | 内容 | 银行项目典型主题 |
|------|------|----------------|
| **管理维度** | 组织架构效率、计划偏差原因、变更控制有效性、跨部门协作 | 多厂商协调失败、BA/SA资源争用、变更控制流程过长 |
| **技术/工艺维度** | 架构适配经验、信创环境问题、数据迁移特殊场景 | 分布式架构适配教训、人行接口版本不锁定、信创性能调优 |
| **过程/质量维度** | 测试覆盖不足、环境准备延迟、需求冻结后范围蔓延 | SIT-UAT阶段缺陷收敛过慢、环境交付延迟导致连环延误 |

### Lessons Learned Register Template

| ID | 维度 | 经验/教训描述 | 正面/负面 | 适用场景 | 建议 | 来源团队 | 归档位置 |
|----|------|-------------|---------|---------|------|---------|---------|
| LL001 | 管理 | 多厂商PM周例会机制有效减少信息不对称 | 正面 | 多厂商项目协调 | 建议延续该机制 | PMO | Docshare |
| LL002 | 技术 | 人行接口规范未在项目初期锁定，导致联调返工 | 负面 | 外部依赖管理 | 建议在项目启动后1个月内完成所有第三方接口规范锁定 | 技术组 | Docshare |

---

## Document Archiving Requirements

### Archive Destinations

| 文档类型 | 归档位置 | 版本管理 | 保存期限 | 责任人 |
|---------|---------|---------|---------|--------|
| **管理类文档** | VP平台 / X-Zeus / Docshare | 版本号 | 项目结束+5年 | PMO |
| **工程类文档** | VP平台 / Docshare | 版本号 | 项目结束+5年 | 配置管理员 |
| **源代码/受控文档** | CC/SVN配置库基线 | 基线标签 | 项目结束+永久 | 配置管理员 |
| **企业资产** | 企业级资产库 | 资产编号 | 永久 | PMO/架构组 |
| **财务决算报告** | VP平台 / 财务系统 | 版本号 | 项目结束+15年 | 财务部 |

### QA Baseline Audit

Before archiving, all documents must pass QA audit:
- [ ] 文档命名符合项目命名规范
- [ ] 文档版本号与变更记录一致
- [ ] 文档内容与需求（规格说明书）一致
- [ ] 文档格式符合行方模板要求
- [ ] 敏感信息已脱敏处理（如有）

---

## Post-Closure Activities

### Project Closure Approval

```
Step 1: PMO编制《项目关闭报告》
         ↓
Step 2: PMO负责人初审
         ↓
Step 3: 提交SCCB/项目领导小组审议
         ↓
Step 4: 获得书面批准文件
         ↓
Step 5: 归档所有项目文档
         ↓
Step 6: 发出项目关闭通知（抄送所有相关方）
         ↓
Step 7: 项目团队解散，资源释放
```

### Post-Closure Notification Template

```
Subject: 【项目关闭通知】[项目名称] 项目正式关闭

各位同事：

[项目名称] 项目已顺利完成，并经[领导小组/SCCB]于[YYYY/MM/DD]正式批准关闭。

一、项目交付成果
[主要交付物列表]

二、项目关键指标
  - 项目周期: YYYY/MM/DD – YYYY/MM/DD
  - 预算执行: EAC = XXX万元 (VAC = +/−XXX万元)
  - 里程碑达成: X/X项按期完成
  - 项目评级: 优秀/良好/合格

三、经验教训
  经验教训已归档至Docshare，供后续项目参考。
  归档位置: [链接]

四、感谢
  感谢各位在项目实施期间的辛勤付出与大力支持。

                              [PMO负责人姓名]
                              YYYY/MM/DD
```

---

## Quality gates
- [ ] All 8 closure entry criteria are formally confirmed before initiating closure (sign-off checklist)
- [ ] All milestones M00–M99 have actual dates and signed acceptance in the closure report
- [ ] All external deliverables have signed acceptance from business BA — no unsigned deliverables
- [ ] The final EVM metrics (CPI, SPI, CV, SV) are reconciled and signed by PMO and Finance
- [ ] The lessons learned register contains at least one entry per major project phase
- [ ] All documents are archived in the correct system (VP/X-Zeus/Docshare) and the archive index is complete
- [ ] The QA baseline audit has been passed for all archived documents before closure is finalized
- [ ] The project closure notification has been sent to all stakeholder groups listed in stakeholder-comms-planner

## Failure modes to avoid
- Do not close a project with open 🔴 risks — risks must be either closed, handed over to production support, or formally escalated
- Do not close a project without signed acceptance for all external deliverables — unsigned deliverables are a legal and operational risk
- Do not close a project without completing the financial final statement — this is required for audit and for performance bonus distribution
- Do not skip the lessons learned session — a project that ends without capturing lessons learned is a wasted opportunity for organizational improvement
- Do not archive documents without QA audit — documents that don't match the requirements baseline create problems for future maintenance

## Handoff targets
- **lessons-learned-summarizer** — the lessons learned register feeds into the organizational lessons learned knowledge base for future banking programs
- **stakeholder-comms-planner** — closure notification must be sent per the stakeholder communications matrix; all stakeholder groups must be formally notified

## Output skeleton
```md
## Project Closure Report — [项目名称] — [日期] — 版本：[V{n}]

### 1. 项目概况与目标达成
[Basic info table + objective achievement table]

### 2. 范围总结
[Scope baseline vs actual + change control summary]

### 3. 质量总结
[Test metrics + defect summary + production stability]

### 4. 里程碑达成情况
[Milestone table with dates, deviations, sign-offs]

### 5. 最终EVM与财务决算
[Final EVM table + cost breakdown + financial approval flow]

### 6. 交付物归档目录
[Archive index table: all documents catalogued]

### 7. 绩效考核与团队评优
[Performance bonus distribution + outstanding contributor recognition]

### 8. 经验教训总结
[Lessons learned register by dimension]

### 9. 关闭审批签字
[PMO负责人 | 项目总监 | SCCB主席 | 行长/分管行长] [Date | Signature]

### 10. Recommended Next Skill
[lessons-learned-summarizer for organizational knowledge base; stakeholder-comms-planner for closure notification]
```

## Quality Gates

All gates must be satisfied before the project is declared formally closed:

| # | Quality Gate | Pass Criterion | Verify By |
|---|---|---|---|
| QG-1 | All 8 Closure Prerequisites Met | All items in `## Project Closure Entry Criteria` checklist are checked and signed | PMO sign-off on checklist |
| QG-2 | All Milestone Sign-offs Complete | All M00–M99 milestones have actual dates and acceptance signatures | Milestone tracker |
| QG-3 | Defect Resolution Rate | SIT/UAT defect resolution rate = 100% (no open critical/high defects) | QA defect report |
| QG-4 | Deliverable Acceptance | All formal external deliverables have signed acceptance documents | Acceptance file archive |
| QG-5 | Financial Settlement Approved | Final cost statement approved by Finance; performance bonus distribution confirmed | Finance approval memo |
| QG-6 | Lessons Learned Captured | ≥80% of team members submitted lessons learned; all items classified by dimension | Lessons learned register |
| QG-7 | Document Archive Complete | All project records cataloged in archive index; QA baseline audit passed | Archive index + QA audit report |
| QG-8 | Steering Committee Approval | SCCB formally approved project closure via meeting minutes or written resolution | SCCB meeting minutes |

**If any gate fails:** Do not issue closure notification. Escalate to PMO负责人 and resolve the failing gate before proceeding.
