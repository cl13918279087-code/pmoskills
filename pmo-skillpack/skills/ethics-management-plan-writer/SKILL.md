---
name: "ethics-management-plan-writer"
pack: "project-management-pack"
display_name: "伦理合规管理计划"
description: "建立项目伦理、合规和利益冲突管理框架，识别潜在伦理风险，制定管理策略，确保项目符合组织道德标准和监管要求。"
author: li.chen56@gientech.com
department: "BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
ethics-management-plan-writer

## Purpose
Establish an **ethics, compliance, and conflicts-of-interest management framework** for a banking program, producing an **ethics management plan**, a **compliance checklist**, a **conflict of interest (COI) register**, and a **regulatory submission plan**. The framework addresses information security, data privacy, vendor conduct, anti-corruption, regulatory reporting, and conflicts of interest. It aligns with the PMO consulting principle of **"央企担当"** — the highest ethical standards and fiduciary duty — and ensures all ethics records are traceable in the digital management platform for audit purposes.

## When to use
## Trigger this skill when
- A new project or sub-project is initiated and the ethics/compliance framework must be established before work begins.
- A new vendor or contractor is onboarded and their personnel need to complete security and ethics onboarding.
- A regulatory reporting deadline is approaching and you need to prepare the regulatory submission package.
- A potential conflict of interest is identified during project execution.
- The project is audited by internal audit, external regulators, or the steering committee.
- You need to produce the ethics and compliance chapter of the closure report.

## Expected inputs
- **project scope** — scope from scope-boundary-checker, including any regulatory-sensitive components
- **vendor list** — all vendors, contractors, and outsourcing firms from procurement records
- **regulatory requirements** — applicable regulatory bodies (PBOC/CBIRC/SAFE) and their reporting deadlines
- **security classification** — data sensitivity classification and associated handling requirements

## Procedure

This skill executes the following procedure:

---

## 信息采集（Step 0 — 伦理合规计划前的组织上下文检查）

> ⚠️ **执行前必读**：伦理合规计划需要明确监管环境和供应商关系。

### Step 0.1 — 组织上下文检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目类型 | 请告知 | 提供类型选项供选择 |
| 监管环境 | 请告知 | 标注 `[假设值-请核对]` |
| 供应商关系 | 请告知 | 标注 `[假设值-请核对]` |
| 关键决策人 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 伦理合规计划 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目类型 | ✅/⚠️/❓ | [类型] |
| 监管环境 | ✅/⚠️/❓ | [要求] |
| 供应商数量 | ✅/⚠️/❓ | [数量] |
| 关键决策人 | ✅/⚠️/❓ | [干系人] |

请确认后"开始生成伦理合规计划"。
═══════════════════════════════════════════
```

---



1. **Confirm regulatory frame** — Identify applicable regulatory bodies (PBOC/CBIRC/SAFE) and their specific requirements based on the project's regulatory requirements input.
2. **Establish ethics management framework** — Execute `## Ethics Management Plan Structure` (Chapter 1–6): produce information security & confidentiality controls, conflicts of interest (COI) register, regulatory compliance path, compliance checklist, training requirements, and ethics record management.
3. **Register conflicts of interest** — Execute `## Conflicts of Interest (COI) Management`: identify COI sources, register all relevant personnel and vendors, obtain annual declarations, and manage ongoing disclosure obligations.
4. **Develop regulatory compliance plan** — Execute `## Regulatory Compliance Path`: map regulatory submissions to project milestones, establish submission calendar, and assign responsibility for each regulatory deliverable.
5. **Conduct pre-project compliance audit** — Execute `## Compliance Checklist` (Pre-Project section): verify all prerequisites are met before project work begins.
6. **Execute training program** — Execute `## Training Requirements`: deliver mandatory training matrix for all project personnel and vendors, track completion rates.
7. **Quality gate check** — Verify all Quality Gates are satisfied: ethics plan reviewed by legal/compliance, COI register complete, training completion ≥95%.

---

## Ethics Management Plan Structure

### Chapter 1 — Information Security & Confidentiality

#### 1.1 Personnel Security Requirements

| 要求类别 | 具体规定 | 执行方 | 检查点 |
|---------|---------|--------|--------|
| **保密协议签署** | 所有实施商成员必须在入场前签署《保密协议》(NDA) | 供应商HR / PMO | 入场审批流 |
| **工作机管控** | 严禁使用非行方提供的工作机处理项目文档 | 信息科技部 | IT资产清单 |
| **网络访问管控** | 项目系统访问需通过行方统一身份认证 | 信息科技部 | 权限清单每季度审计 |
| **移动介质管控** | 严禁使用私人U盘/移动硬盘；使用行方认证设备 | 信息科技部 | 安保巡检 |
| **文档外发管控** | 文档外发需经审批并记录；废弃资料需销毁 | 各组组长 | 文档外发审批记录 |
| **上网行为审计** | 生产数据提取上网行为受到审计 | 信息科技部/合规部 | 季度安全审计报告 |

#### 1.2 Data Privacy Protection

| 场景 | 管控要求 | 执行方 |
|------|---------|--------|
| **生产数据提取** | 必须经过脱敏处理，经数据Owner审批 | 信息科技部 |
| **测试数据管理** | 测试环境数据与生产数据严格隔离 | 测试组/运维 |
| **敏感信息标识** | 文档按密级标识（内部/机密/绝密） | 文档编写人 |
| **数据留存** | 生产数据留存不超过规定时限，到期销毁 | 运维/合规 |

---

### Chapter 2 — Vendor Conduct & Accountability

#### 2.1 Vendor Code of Conduct

All vendors and contractors are required to:
- **遵守职场管理办法** — professional conduct during project hours and on bank premises
- **履行合同义务** — deliver work products on time and to agreed quality standards
- **报告利益冲突** — proactively disclose any actual or potential conflicts of interest
- **保密义务** — protect confidential information with the same rigor as bank employees
- **反商业贿赂** — zero tolerance for bribery, gifts, or kickbacks in any form

#### 2.2 Vendor Personnel Management

| 活动 | 要求 | 审批流 |
|------|------|--------|
| **人员入场** | 填写《项目人员入场申请表》，签署保密协议、安全须知 | PMO → 信息科技部 |
| **人员调岗** | 提前5工作日提交申请，更新权限清单 | PMO审批 |
| **人员离场** | 完成工作交接，归还行方资产，清除本地数据 | PMO → IT资产盘点 |
| **外包入离场培训** | 入场前完成安全培训，离场前完成知识移交 | PMO/合规部 |

---

### Chapter 3 — Anti-Corruption & Professional Ethics

#### 3.1 Prohibited Behaviors

| 禁止行为 | 说明 |
|---------|------|
| **商业贿赂** | 严禁向任何相关方索取或收受贿赂、回扣、礼品（超过规定价值的礼品需报备） |
| **利益输送** | 严禁利用项目资源谋取私利，包括承接关联项目、转包合同等 |
| **资产侵占** | 严禁盗用或非法侵占项目组财物 |
| **虚假陈述** | 严禁在项目文档、报告、报销中提供虚假信息 |
| **内幕信息** | 严禁利用项目信息进行内幕交易或泄露给第三方 |

#### 3.2 Ethics Reporting Channel

| 渠道 | 负责人 | 处理时效 |
|------|--------|---------|
| **直接上级报告** | 项目经理/PMO | 24小时内 |
| **合规部门举报** | 合规部举报热线 | 5工作日内初步回复 |
| **纪检部门举报** | 行方纪检 | 按行内规定 |
| **保密举报邮箱** | PMO | 5工作日内初步回复 |

---

## Conflicts of Interest (COI) Management

### COI Identification and Registration

All project participants (bank staff, vendors, consultants) must disclose any actual or potential conflicts of interest at project initiation and throughout the project lifecycle.

#### COI Register Template

| ID | 披露人 | 部门/角色 | 冲突类型 | 冲突描述 | 潜在影响 | 管控措施 | 状态 | 披露日期 |
|----|-------|---------|---------|---------|---------|---------|------|---------|
| COI001 | | | | | | | | |

#### Common COI Scenarios in Banking Programs

| 场景 | 冲突描述 | 管控措施 |
|------|---------|---------|
| **厂商双重角色** | 同一厂商同时担任咨询方和实施方，可能影响评估客观性 | 将咨询职能和实施职能分离，由不同供应商承担 |
| **厂商与行方人员关联** | 行方人员曾在供应商任职，或存在亲属关系 | 调离相关项目组或供应商更换人员 |
| **方案推荐关联** | SA/BA收了厂商培训或咨询费用后倾向性推荐 | 方案评审引入独立第三方；扩大评审参与人范围 |
| **验收舞弊风险** | 验收人员同时是厂商推荐人选 | 验收组成员与供应商无直接利益关联 |

### Separation of Duties (SoD) — 职责分离

The project organizational structure enforces SoD to prevent any single party from controlling an entire process:

| 环节 | 编写主体 | 评审主体 | 审批主体 |
|------|---------|---------|---------|
| **需求规格** | 业务需求组 | 业务总体组 | SCCB |
| **技术设计** | 技术总体组 | 架构评审组 | 技术委员会 |
| **测试报告** | 测试管理组 | QA/PMO | 业务BA |
| **变更审批** | PMO | SCCB | 领导小组 |
| **验收签字** | 业务BA | PMO | 分管行长 |

**原则：** 编写、评审、审批不属于同一执行主体。

### COI Declaration Process

```
Step 1: 项目启动时，所有成员填写COI披露表
         ↓
Step 2: PMO汇总COI披露信息
         ↓
Step 3: PMO评估COI风险等级
         - 高风险 → 人员调离或供应商更换
         - 中风险 → 制定管控措施，持续监控
         - 低风险 → 记录在案
         ↓
Step 4: 高风险COI上报项目领导小组
         ↓
Step 5: COI状态变更时（出现新COI），立即重新披露
```

---

## Regulatory Compliance Path

### Applicable Regulatory Bodies

| 监管机构 | 全称 | 主要监管关注点 | 报告类型 |
|---------|------|-------------|---------|
| **人行 (PBOC)** | 中国人民银行 | 支付系统、征信、反洗钱、金融市场基础设施 | 系统报备、接口规范合规 |
| **银保监 (CBIRC)** | 中国银行保险监督管理委员会 | 银行业务系统合规、金融消费者保护、数据安全 | 合规评估、验收报备 |
| **外管局 (SAFE)** | 国家外汇管理局 | 外汇业务系统、国际收支统计 | 接口报备、数据报送 |
| **公安部/网安** | 公安部网络安全保卫局 | 网络安全等级保护、数据安全 | 等保测评、安全评估 |
| **行内合规/稽核** | 行内合规部/稽核部 | 内控合规、内部审计 | 内部审计配合 |

### Regulatory Submission Timeline

```
项目启动 → 合规需求识别 → 合规方案设计 → 实施 → 内部验收
  ↓                                                          
监管报备材料准备 → 提交监管 → 监管审查/现场检查 → 获取批复
  ↓
系统上线 → 投产后合规跟踪 → 年度合规评估
```

### Five-Piece Regulatory Submission Package (合规验收"五件套")

For go-live approval from PBOC, CBIRC, and SAFE, prepare the following five documents:

| # | 材料名称 | 内容要求 | 负责方 | 提交时间点 |
|---|---------|---------|--------|---------|
| **1** | **监管报备汇报材料 (PPT)** | 系统变更背景、业务影响范围、数据报送变化、合规改造说明 | 业务总体组 + PMO | 投产前30日 |
| **2** | **业务应急预案 (BCP)** | 投产失败场景、切换回退方案、应急预案启动条件、联系人清单 | 技术总体组 + 运维 | 投产前20日 |
| **3** | **监管沟通预案** | 日常沟通渠道、突发事件汇报路径、监管部门对接人 | 合规部 + PMO | 投产前20日 |
| **4** | **业务连续性方案 (BIA)** | 核心切换期间关键业务不中断保障措施、RTO/RPO指标 | 业务总体组 + 运维 | 投产前20日 |
| **5** | **投产上线分时计划** | 精确到分钟的切换动作指令集、回退触发条件及操作步骤 | 技术总体组 + 运维 | 投产前10日 |

---

## Compliance Checklist

### Pre-Project Compliance Checklist (项目启动前)

| # | 检查项 | 执行方 | 确认证据 |
|---|-------|--------|---------|
| 1 | 所有实施商成员已签署保密协议 | 供应商HR | 签署记录存档 |
| 2 | 所有人员完成入场安全培训 | PMO/合规部 | 培训记录 |
| 3 | 信息安全须知已传达并确认 | PMO | 入场申请签字栏 |
| 4 | 项目工作机已分配并登记 | IT部门 | 资产清单 |
| 5 | COI披露表已填写并归档 | PMO | COI Register |
| 6 | 供应商资质已通过审核 | 采购部/合规部 | 资质审核报告 |
| 7 | 监管合规需求已识别（PBOC/CBIRC/SAFE） | 合规部 | 合规需求清单 |
| 8 | 外包入离场培训计划已制定 | PMO | 培训方案 |

### During-Project Compliance Checklist (项目执行期间)

| # | 检查项 | 频率 | 执行方 | 确认证据 |
|---|-------|------|--------|---------|
| 1 | 文档外发审批记录检查 | 每月 | PMO/合规部 | 审批记录 |
| 2 | 上网行为审计（生产数据提取） | 每季度 | IT部门 | 审计报告 |
| 3 | 权限清单复核（离职/调岗清理） | 每季度 | IT部门 | 权限变更记录 |
| 4 | COI Register状态复核 | 每季度 | PMO | COI更新记录 |
| 5 | 保密协议签署状态复核 | 每季度 | PMO | 签署状态清单 |
| 6 | 安全巡检（移动介质、网络访问） | 不定期 | IT部门 | 巡检报告 |
| 7 | 监管报备进度跟踪 | 按节点 | 合规部 | 报备材料 |

### Project Closure Compliance Checklist (项目关闭前)

| # | 检查项 | 执行方 | 确认证据 |
|---|-------|--------|---------|
| 1 | 人员离场手续完成（资产归还、数据清除） | PMO/IT | 离场确认单 |
| 2 | 保密义务已再次提醒（离场访谈） | PMO | 访谈记录 |
| 3 | 所有敏感数据已销毁或迁移 | IT部门 | 销毁/迁移记录 |
| 4 | 合规整改项全部关闭 | 合规部 | 合规关闭报告 |
| 5 | 监管验收已通过（如适用） | 合规部 | 监管批复文件 |
| 6 | 审计配合材料已归档 | 稽核部 | 归档清单 |

---

## Training Requirements

### Mandatory Training Matrix

| 培训名称 | 参训对象 | 培训时机 | 时长 | 负责方 | 输出 |
|---------|---------|---------|------|--------|------|
| **开发安全培训** | 所有开发/测试人员 | 入场前 | 2小时 | 信息科技部 | 培训记录 |
| **外包入离场培训** | 所有外包/供应商人员 | 入场前 | 2小时 | PMO/合规部 | 培训记录 |
| **项目管理章程/规范培训** | 所有项目成员 | 项目启动时 | 4小时 | PMO | 培训签到表 |
| **合规与道德培训** | 所有项目成员 | 项目启动时 + 年度 | 2小时 | 合规部 | 培训记录 |
| **数据安全专项培训** | 接触生产数据的SA/BA | 上岗前 | 2小时 | 信息科技部 | 培训记录 |

---

## Ethics Record Management

### Record Types and Retention

| 记录类型 | 归档位置 | 保存期限 | 责任人 |
|---------|---------|---------|--------|
| 保密协议签署记录 | VP平台 / HR系统 | 项目结束+10年 | 人力资源部 |
| COI Register | VP平台 / 合规部 | 项目结束+10年 | PMO |
| 合规检查记录 | VP平台 / 合规部 | 项目结束+10年 | 合规部 |
| 安全巡检报告 | IT系统 | 项目结束+5年 | IT部门 |
| 监管报备材料及批复 | VP平台 / 合规部 | 永久 | 合规部 |
| 培训记录 | HR系统 | 项目结束+10年 | 人力资源部 |
| 违规处理记录 | 合规部 / 纪检 | 永久 | 合规部 |

### Audit Trail

All ethics and compliance records must be:
- **可追溯** — linked to the specific project, personnel ID, and date
- **不可篡改** — stored in a tamper-evident system (VP/X-Zeus with access control)
- **可审计** — accessible to internal audit, external regulators, and the steering committee upon request

---

## PMO Neutrality and Fiduciary Duty

The PMO operates under the following principles aligned with **"央企担当"**:

| 原则 | 说明 |
|------|------|
| **中立标准** | PMO以专业标准和中立视角评估风险和问题，不偏向任何业务部门、科技部门或供应商 |
| **整体利益优先** | PMO决策以项目整体利益为准，不受局部利益或供应商利益影响 |
| **透明披露** | PMO主动披露任何可能影响判断的关联关系或利益冲突 |
| **受托义务** | PMO对行方承担受托义务，以最高诚信标准履行管理职责 |
| **合规优先** | 在任何情况下，合规和道德要求优先于进度和成本目标 |

---

## Quality gates
- [ ] All project personnel (including vendors) have signed the NDA and completed security awareness training before accessing project resources
- [ ] The COI Register has been completed by all participants at project initiation and updated when status changes
- [ ] The regulatory submission package (5 documents) is complete and submitted to the regulator before the required deadline
- [ ] The PMO neutrality declaration has been signed by all PMO staff at project initiation
- [ ] All compliance checklist items have been completed and signed off at each checkpoint (project start, quarterly, closure)
- [ ] All ethics and compliance records are stored in VP/X-Zeus or the designated digital platform with proper version control
- [ ] Any ethics violation has been reported within 24 hours and processed through the ethics reporting channel
- [ ] The separation of duties (SoD) matrix is enforced — no single party controls the entire write-review-approve cycle for any deliverable

## Failure modes to avoid
- Do not allow vendor personnel to access project systems before completing NDA signing and security training — this is a regulatory and security risk
- Do not skip the COI declaration — an undisclosed conflict of interest can invalidate project decisions and create audit findings
- Do not submit regulatory materials late — regulatory deadlines are hard constraints; missing a filing deadline can result in fines or operational suspension
- Do not store ethics records in personal folders or informal systems — they must be in the official digital platform to be admissible in audits
- Do not allow the same party to write, review, and approve a deliverable — this violates SoD and creates integrity risks

## Handoff targets
- **stakeholder-comms-planner** — compliance training schedule and ethics reporting channels should be communicated in the communications matrix
- **closure-report-writer** — ethics compliance records and COI register status feed into the closure report as evidence of proper governance
- **risk-register-builder** — regulatory compliance risks (e.g., missing regulatory submission deadlines) should be registered as risks with mitigation plans

## Output skeleton
```md
## Ethics & Compliance Management Plan — [项目名称] — [日期]

### 1. 合规治理框架
[监管机构 | 适用法规 | 主要合规要求 | 负责部门]

### 2. 信息安全管控
[NDA签署状态 | 工作机管控 | 网络访问 | 介质管控 | 数据隐私]

### 3. 供应商行为准则
[供应商清单 | 资质审核状态 | 入离场培训 | 行为准则确认]

### 4. 利益冲突管理
[COI Register | 高风险COI清单 | SoD矩阵 | 回避机制]

### 5. 反腐败与职业道德
[禁止行为清单 | 举报渠道 | 处理流程]

### 6. 监管合规路径
[监管机构 | 报备时间节点 | 五件套准备状态]

### 7. 合规检查清单状态
[项目启动前 | 执行期间 | 项目关闭前 — 每项状态]

### 8. 培训完成状态
[培训矩阵 | 参训率 | 完成率]

### 9. PMO中立声明
[签署状态 | 中立承诺内容]

### 10. Recommended Next Skill
[risk-register-builder for regulatory compliance risks; stakeholder-comms-planner for compliance communications; closure-report-writer for ethics records]
```

## Quality Gates

All gates must be satisfied before the ethics management plan is considered complete:

| # | Quality Gate | Pass Criterion | Verify By |
|---|---|---|---|
| QG-1 | Regulatory Frame Confirmed | All applicable regulatory bodies (PBOC/CBIRC/SAFE) identified and their requirements mapped to project activities | Regulatory mapping document |
| QG-2 | COI Register Complete | All relevant personnel and vendors registered; annual declarations obtained for ≥95% of identified persons | COI register + declaration records |
| QG-3 | Ethics Plan Reviewed | Ethics management plan reviewed and approved by Legal and Compliance departments | Signed approval memo |
| QG-4 | Training Completion | Mandatory ethics training completed by ≥95% of all project personnel and vendor staff | Training completion matrix |
| QG-5 | Compliance Checklist Passed | All pre-project compliance items verified; no outstanding regulatory pre-conditions | Signed compliance checklist |
| QG-6 | Regulatory Submission Plan Filed | Submission calendar established; all regulatory deadlines mapped to project milestones with assigned owners | Regulatory submission plan document |

**If any gate fails:** Do not proceed to project execution. Escalate to the Compliance Officer and resolve the failing gate.
