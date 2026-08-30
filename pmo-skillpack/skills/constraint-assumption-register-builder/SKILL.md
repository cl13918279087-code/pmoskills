---
name: "constraint-assumption-register-builder"
pack: "project-management-pack"
display_name: "约束与假设登记册"
description: "建立和维护约束条件与假设清单，识别影响项目规划和执行的内外部约束，记录项目关键假设，支持风险评估和决策分析。"
author: li.chen56@gientech.com
department: "PMO-BUCON"
usage_scope: "仅本地使用"
version: "v0.8.0"
---
constraint-assumption-register-builder（银行业务定制版）

## Purpose
Build a working register of **constraints** (fixed limitations that must be respected) and **assumptions** (unverified beliefs that underpin the plan) that affect planning and execution. Produces two separate but linked registers — the Constraint Register and the Assumption Register — with clear ownership, validity periods, and validation status. When assumptions fail or constraints tighten, the Skill surfaces the resulting risks to the risk-register-builder.

> **银行业务定制说明**：本定制版面向银行 IT 项目群管理场景，覆盖监管合规、数据治理、信创改造、跨行互联等典型约束与假设，已内置银行业特有的约束类型分类、假设验证逻辑及行业参考示例。

## When to use
## Trigger this skill when
- A new project phase begins and the planning assumptions need to be revalidated.
- A constraint is discovered or imposed mid-project (regulatory deadline, budget cut, resource withdrawal).
- An assumption has reached its validation date and needs to be confirmed or escalated.
- The WBS or schedule is producing unrealistic estimates and the root cause is hidden constraints.
- A change request arrives and you need to assess whether it introduces a new constraint or invalidates an existing assumption.
- Monthly milestone reviews require a滚动 update of constraint and assumption status.
- 监管政策发布或变更（如资管新规、理财新规、数据安全法细则）
- 行内IT规划方案发布或重大修订
- 两行合并/收购等重大战略决策带来的约束变更

## Expected inputs
- **project context** — 项目名称（如"理财销售平台重构项目"）、当前phase、已批准的基线（进度计划、预算范围、需求范围）
- **planning notes** — 项目章程（行领导签批版）、高层 schedule、WBS 初稿
- **technical/organizational limits** — 已知 IT 架构约束（信创要求、主机下移策略）、团队规模、厂商合同条款、数据权限限制
- **unknowns** — 团队、BA、SA 在规划过程中标注为不确定的事项

---

## Core Concepts

### Constraint vs. Assumption — The Key Distinction

| | **Constraint** | **Assumption** |
|---|---|---|
| **Nature** | 已确定的限制 (Established fact) | 尚未证实的信念 (Unverified belief) |
| **Action required** | 必须在其框架内规划 | 为规划提供基础，验证其成立 |
| **If violated** | Plan is non-compliant; must renegotiate or seek waiver | Plan is invalidated; must replan and surface risk |
| **Example** | "理财销售必须于2024年12月前完成资管新规改造"（监管强制） | "假设人行二代支付系统接口规范在本项目周期内不发生V3重大变更" |

### Constraint Type Taxonomy (银行业约束类型)

| 枚举值 | 类型 | 典型示例 |
|--------|------|---------|
| **时间 / Time** | 监管报送达标时限、行领导强制投产日期、重大活动保障窗口 | 理财销售系统必须在2024年资管新规过渡期结束前完成改造；年终决算期间（12月25-31日）禁止投产 |
| **预算 / Budget** | 项目总投资额度、信创改造专项预算、科技部门可用资源上限 | 信创改造专项预算不超过X万元；基础设施投入占总预算比例不超30% |
| **资源 / Resource** | 有限的IT人力（两行合并团队整合）、特定系统厂商专家、现场驻场人员限制 | 合并后IT团队仅可投入X人月；核心系统厂商仅提供2名架构师驻场 |
| **技术 / Technical** | 信创要求（国产OS/数据库/中间件）、主机下移、分布式架构、数据本地化 | 必须支持国产麒麟OS + 达梦DB；客户数据不得出省（数据安全法合规） |
| **法规/合规 / Regulatory** | 等保三级/四级、理财新规、数据安全法、个人信息保护法、反洗钱 | 等保三级测评必须在UAT前完成；反洗钱系统必须与信贷平台同步上线 |
| **外部依赖 / External** | 人行/银联/网联联调窗口、第三方支付接口、征信/公安等外部系统接口规范版本 | 人行支付系统联调窗口为每月10-15日；征信接口版本锁定为V2.5 |

### Assumption Validation Logic

An assumption flows through three states:

```
待验证 (Pending) → 验证中 (Validating) → 已确认 (Confirmed) 或 已证伪 (Falsified)
```

**When to escalate an Assumption to Risk:**
- Validation date passes with no result → escalate immediately
- Validator reports partial evidence of failure → escalate immediately
- 监管机构发布与本项目相关的新规征求意见稿 → re-evaluate and potentially escalate
- 外部事件增加了假设的不确定性（如第三方宣布API版本变更）→ re-evaluate and potentially escalate

---

## Procedure

> **EN Alias**: 本章节同时标记为 `## Operating Procedure（银行业业务定制流程）`，内容完全一致。

---

## 信息采集（Step 0 — 约束与假设登记前的上下文检查）

> ⚠️ **执行前必读**：约束与假设登记需要明确的约束来源和假设背景。

### Step 0.1 — 约束假设检查

| 数据项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| 项目基本信息 | 请告知 | 标注 `[假设值-请核对]` |
| 项目当前阶段 | 请告知 | 标注 `[假设值-请核对]` |
| 已识别的约束 | 请告知 | 标注 `[假设值-请核对]` |
| 已识别的假设 | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 数据确认

```
📊 约束与假设登记 信息采集确认单
═══════════════════════════════════════════

| 数据项 | 状态 | 采集值 |
|--------|------|--------|
| 项目基本信息 | ✅/⚠️/❓ | [摘要] |
| 项目阶段 | ✅/⚠️/❓ | [阶段] |
| 已识别约束 | ✅/⚠️/❓ | [数量]项 |
| 已识别假设 | ✅/⚠️/❓ | [数量]项 |

请确认后"开始登记约束与假设"。
═══════════════════════════════════════════
```

---



### Step 1 — 从行内文档中提取约束

系统搜索以下文档中的显式约束陈述，将每条记录为约束条目：

| 参考文档 | 约束类型 | 提取重点 |
|---------|---------|---------|
| 《项目章程》/ 《立项批复》 | 时间、预算 | 行领导/监管强制类约束（开业时间、预算上限、立项有效期） |
| 《IT规划方案》/ 《信息科技战略规划》 | 技术、资源 | 信创要求、架构规范、主机下移时间表、人力配置上限 |
| 《监管合规清单》/ 《合规风险评估报告》 | 法规/合规 | 报送时限、等保要求、理财新规、数据安全法达标时间 |
| 《第三方接口协议》/ 《联调测试方案》 | 外部依赖 | 联调窗口期、接口版本锁定、网银/支付/征信对接规范 |
| 合同条款（厂商合同/采购合同） | 资源、预算 | 外包团队规模限制、专家到场要求、知识产权归属 |
| 《数据治理办法》/ 《数据安全管理策略》 | 法规/合规 | 数据分类分级要求、客户信息脱敏规则、跨境数据流动限制 |
| 《信息安全管理制度》 | 技术、法规 | 身份认证要求、密钥管理规范、日志留存期限 |

> **联调窗口速查**：人行支付系统（每月10-15日）、银联（工作日联络窗口）、网联（提前5工作日预约），均需在《联调测试方案》中记录排期。

### Step 2 — 从需求/设计评审中引出假设

主持或审阅需求澄清会、技术方案评审会，聚焦以下维度：

| 假设维度 | 典型问题 | 银行场景示例 |
|---------|---------|------------|
| **监管合规** | 相关法规在本项目周期内是否保持稳定？ | 《个人信息保护法》实施细则是否在2024年内发布？ |
| **行内审批** | 跨部门审批流程是否顺畅？ | 信贷产品变更是否需要额外消保审查？ |
| **技术架构** | 选型技术栈是否在行内已有成功案例？ | 分布式数据库在本行生产环境的性能基准是否可参考？ |
| **数据迁移** | 历史数据质量是否支撑迁移假设？ | 客户画像数据完整率是否>95%？ |
| **外部接口** | 人行/银联/征信接口行为是否与文档一致？ | 人行ACS系统超时重试机制是否符合预期？ |
| **资源供给** | 厂商交付能力与人员稳定性 | 核心系统厂商是否能在项目周期内保持5名以上专家驻场？ |
| **环境就绪** | 开发/测试/演练环境能否按时就绪 | 准生产环境是否能提前2周开放用于演练？ |

### Step 3 — 填充约束登记台账（Constraint Register）

| 字段名 | 填写规范 | 数据类型 | 示例 |
|--------|---------|---------|------|
| **ID** | 格式：`C{nnn}`，如 C001 | string | C001 |
| **约束描述** | 具体限制内容，不超过2行 | string | 理财销售系统必须在2024年12月31日前完成资管新规改造并通过监管验收 |
| **约束来源** | 行领导/监管机构/科技部/架构组/第三方厂商/数据治理委员会 | string | 银保监会/行领导 |
| **约束类型** | 枚举：时间/预算/资源/技术/法规/外部依赖 | enum | 法规 |
| **影响维度** | 进度/成本/范围/质量（可多选） | multi-enum | 进度, 成本, 范围 |
| **影响程度** | 🔴高 / 🟡中 / 🟢低 | enum | 🔴高 |
| **责任人 (Owner)** | 格式：`角色/姓名`，如 PMO/张三 | string | PMO/张三 |
| **时效性** | 如：仅限过渡期内/全生命周期/2024-12-31前 | string | 2024-12-31前（资管新规过渡期截止日） |
| **当前状态** | 监控中/已缓解/已突破 | enum | 监控中 |
| **触发条件** | 约束被突破或即将被突破时的判断标准 | string | 若监管过渡期不再延长，则倒排计划无法调整 |
| **备注** | 应对策略、突破时的补救方案 | string | 已准备向监管申请过渡期延长的预案；建立与银保监的定期沟通机制 |

**Constraint Risk Matrix** (impact dimension + severity):

| 影响维度 \ 程度 | 🟢低 | 🟡中 | 🔴高 |
|----------------|-----|-----|-----|
| **进度** | 进度略有调整（1-2周） | 关键路径受影响（里程碑推迟1个月） | 里程碑推迟超过3个月 |
| **成本** | 成本<5%偏差 | 成本5-15%偏差 | 成本>15%偏差或预算突破 |
| **范围** | 范围轻微缩小（非核心功能） | 若干功能延迟交付 | 核心功能被迫移除或合规风险 |
| **质量** | 质量标准降级（内部验收通过） | 需额外验收轮次 | 监管验收不通过/等保测评失败 |

### Step 4 — 填充假设登记台账（Assumption Register）

| 字段名 | 填写规范 | 数据类型 | 示例 |
|--------|---------|---------|------|
| **ID** | 格式：`A{nnn}`，如 A001 | string | A001 |
| **假设内容** | 被假定为真的前提条件，不超过2行 | string | 假设人行二代支付系统接口规范在本项目周期内不发生V3重大版本变更 |
| **假设类型** | 技术/资源/外部/范围/环境/合规 | enum | 合规 |
| **验证方式** | 具体验证手段（技术评审/厂商确认函/监管函询/实测） | string | 提前联系人行科技司确认接口版本路线图，获取书面确认函 |
| **验证时间** | 格式：`YYYY-MM-DD`，计划何时验证 | date | 2024-03-31 |
| **验证人** | 负责核实该假设的成员/角色 | string | SA/李四（科技部架构组） |
| **验证状态** | 待验证 / 验证中 / 已确认 / 已证伪 | enum | 待验证 |
| **风险等级** | 🔴高 / 🟡中 / 🟢低（若不成立） | enum | 🟡中 |
| **关联约束ID** | 若假设不成立会触发某约束失效，填关联ID | string | C001 |
| **不成立后果** | 若假设为假，对项目造成的直接影响的简要描述 | string | 若接口规范发生V3变更，核心交易模块需重构，预计增加3个月工期及200万人天成本 |
| **备注** | 验证失败时的补救措施（contingency plan） | string | 已准备V2.5适配方案作为 contingency；与厂商签订变更控制协议 |

### Step 5 — Link assumptions to risks（假设→风险联动）

对每条假设回答：
> "若此假设最终为假，对项目的直接后果是什么？"

若后果为进度延误、成本超支或质量不合规 → 传递给 **risk-register-builder**，附以下信息：
- Assumption ID 及内容
- 假设失败场景描述
- 直接影响维度及严重程度
- 建议的应对策略

此步骤在假设登记台账与风险登记台账之间建立关联，避免信息重复记录。

### Step 6 — 里程碑评审中的滚动更新

在每次里程碑评审会议：
1. 逐一检查所有 `验证状态=待验证` 且 `验证时间` 已到的假设
2. 更新状态：`已确认`（假设成立）或 `已证伪`（假设失败）
3. 若 `已证伪`：立即触发 Step 5；通知 risk-register-builder
4. 对约束：检查 `当前状态` 是否有 `已突破` 项；记录 workaround（如适用）
5. 检查 `触发条件` 是否被满足，提前预警
6. 更新台账版本号（如 V1.0 → V1.1），记录 `更新日期` 和 `更新人`

> **银行业特有滚动更新触发条件**：监管政策发布日、数据安全检查通知日、行内IT规划方案修订审批完成日、两行合并正式公告日——均应触发临时约束/假设审查。

---

## Industry-Specific Reference（银行 IT 项目典型场景）

### 典型约束清单

| 约束类型 | 示例描述 | 来源 | 影响维度 | 紧急程度 |
|---------|---------|------|---------|---------|
| **时间** | 理财销售系统必须于2024年12月31日前完成资管新规改造并通过监管验收 | 银保监会/行领导 | 进度, 范围, 成本 | 🔴极高 |
| **时间** | 投产切换必须避开年终决算(12月25-31日)及春节期间 | 财务部/监管 | 进度 | 🟡中 |
| **预算** | 信创改造专项预算上限 X 万元 | 科技部/财务部 | 成本, 范围 | 🔴高 |
| **资源** | 两行合并IT团队仅可投入 X 人月，整合期间不得大规模增补人员 | 人力资源部/行领导 | 资源, 进度 | 🔴高 |
| **技术** | 全面分布式改造、容器化部署、国产全栈信创（麒麟OS+达梦DB+东方通中间件） | IT规划/监管（信创要求） | 技术, 成本 | 🔴高 |
| **技术** | 客户数据不得出省，需严格遵循数据安全法分类分级要求 | 数据安全法/科技部 | 技术, 合规 | 🔴高 |
| **法规** | 等保三级测评必须于SIT测试前完成并通过 | 监管机构/信息安全部 | 质量, 进度 | 🔴高 |
| **法规** | 反洗钱系统改造必须与信贷平台同步上线（同一监管验收节点） | 银保监会/合规部 | 范围, 进度 | 🔴高 |
| **外部** | 人行支付系统联调窗口每月10-15日（需提前5工作日预约） | 人行 | 进度 | 🟡中 |
| **外部** | 银联接口规范版本在本项目周期内锁定为V3.1 | 银联 | 技术 | 🟡中 |
| **外部** | 征信系统接口联调需在获得银保监正式批复后方可开展 | 征信中心/监管 | 进度 | 🟢低 |

### 典型假设清单

| 假设类型 | 示例描述 | 验证方式 | 风险等级 | 关联约束 |
|---------|---------|---------|---------|---------|
| **合规** | 假设《资管新规》过渡期不再延长（不再发布新补丁或解释文件） | 持续跟踪银保监官网政策动态，获取监管部门口沟通纪要 | 🔴高 | C001（时间约束） |
| **外部** | 假设人行二代支付系统接口规范在项目周期内不发生V3重大版本变更 | 提前联系人行确认接口版本路线图，获取书面确认函 | 🟡中 | C009（外部依赖约束） |
| **资源** | 假设项目实施期间，核心系统厂商核心开发人员流失率低于 10% | 月度人员流失率跟踪，合同中约定关键人员锁定条款 | 🟡中 | C004（资源约束） |
| **环境** | 假设开发测试环境、模拟演练环境能够按照《环境规划方案》按时就绪 | 环境就绪检查清单，环境负责人签字确认 | 🔴高 | 无直接关联约束 |
| **技术** | 假设达梦数据库在核心交易场景下的TPS性能能满足行内基线要求（≥5000 TPS） | 在测试环境中进行压力测试，获取性能测试报告 | 🟡中 | C006（技术约束） |
| **技术** | 假设分布式架构改造后，核心系统与外围系统可通过服务网格实现"无感"对接 | 技术方案评审，架构组确认，POC验证 | 🟡中 | C006（技术约束） |
| **数据** | 假设历史客户画像数据完整率≥95%，可支撑新系统上线 | 数据质量分析报告，数据治理委员会确认 | 🟡中 | 无直接关联约束 |
| **范围** | 假设需求范围基线在SIT开始前不再发生重大变更（监管类变更除外） | 变更管理日志检查，项目管理委员会审批记录 | 🟢低 | 无直接关联约束 |
| **合规** | 假设等保三级测评可在计划时间内通过（不存在重大整改项） | 与等保测评机构提前对接，了解测评标准和过往通过率 | 🟡中 | C008（法规约束） |

---

## Quality Gates


- [ ] 约束条件已完整识别（时间/成本/资源/质量/法规）
- [ ] 假设条件已记录并标注置信度
- [ ] 约束假设已与干系人确认
## Quality gates
- [ ] Every constraint has at least one `影响维度` (进度 / 成本 / 范围 / 质量)
- [ ] Every constraint has a defined `触发条件` — no constraints without a breach threshold
- [ ] Every assumption has a `验证时间` — no open-ended assumptions without a validation date
- [ ] Every assumption has a named `验证人` who is accountable for checking it
- [ ] The `验证状态` field is updated at every milestone review — stale `待验证` items are flagged
- [ ] Any assumption past its `验证时间` with status `待验证` is escalated to risk-register-builder within 48 hours
- [ ] The register includes `当前版本` (current version) and `更新日期` — no uncontrolled floating versions
- [ ] 监管政策相关假设配置了 `不成立后果` 字段，包含对成本、进度、范围的量化影响描述
- [ ] 约束和假设存储在行内项目管理系统（PPMS）或等价数字化工具中，保留审计日志

## Failure modes to avoid
- **Do not treat a constraint as an assumption** — if it's already a firm limit（如"资管新规过渡期截止日为2024-12-31"），it belongs in the Constraint Register, not Assumption
- **Do not leave `验证时间` blank on an assumption** — unverifiable assumptions are the primary source of planning surprises
- **Do not classify `人员流失率<10%` as a constraint** — it is an assumption that must be validated
- **Do not skip the rolling update** — an assumption that was valid at project start may become invalid mid-project; the register is a living document
- **Do not surface an assumption to risk-register-builder without first describing the direct consequence** — "the assumption failed" is not a risk statement; must include `不成立后果` 描述
- **Do not ignore regulatory change signals** — even a征求意见稿 may invalidate existing assumptions; monitor银保监/人大/央行政策动态 regularly
- **Do not use generic constraint descriptions** — 约束描述必须具体到量化的指标和可验证的标准，如"信创改造预算不超X万元"而非笼统的"成本受限"

## Handoff targets
- **risk-register-builder** — receives failed or at-risk assumptions as input; constraint breaches also become risk entries
- **cost-estimation-helper** — budget constraints feed directly into the cost model's boundary conditions; 信创专项预算约束需传入成本模型上限参数
- **schedule-sequencer** — time constraints define the critical path boundary; external dependency constraints（人行联调窗口/银联接口版本）define sequencing gates

## Output skeleton
```md
## Constraint & Assumption Register — [项目名称] — [日期] — 版本：[V{n}]

> **银行业务定制版**：本台账面向银行 IT 项目群管理，已内置监管合规、数据治理、信创改造等典型约束与假设。

### 1. Constraint Register 统计
| 类型 | 总数 | 🟢低 | 🟡中 | 🔴高 |
|------|------|------|------|------|
| 时间 | N | n | n | n |
| 预算 | N | ... | ... | ... |
| 资源 | N | ... | ... | ... |
| 技术 | N | ... | ... | ... |
| 法规/合规 | N | ... | ... | ... |
| 外部依赖 | N | ... | ... | ... |

### 2. Assumption Register 统计
| 类型 | 总数 | 🔴高 | 🟡中 | 🟢低 |
|------|------|------|------|------|
| 技术 | N | n | n | n |
| 资源 | N | ... | ... | ... |
| 外部 | N | ... | ... | ... |
| 范围 | N | ... | ... | ... |
| 环境 | N | ... | ... | ... |
| 合规 | N | ... | ... | ... |

### 3. Constraint Register 明细
| ID | 约束描述 | 来源 | 类型 | 影响维度 | 程度 | Owner | 时效性 | 状态 | 触发条件 | 备注 |
|----|---------|------|------|---------|------|-------|--------|------|---------|------|
| C001 | [约束描述] | [来源] | [类型] | [维度] | [程度] | [Owner] | [时效性] | [状态] | [触发条件] | [备注] |

### 4. Assumption Register 明细
| ID | 假设内容 | 类型 | 验证方式 | 验证时间 | 验证人 | 状态 | 风险等级 | 关联约束ID | 不成立后果 | 备注 |
|----|---------|------|---------|---------|-------|------|---------|-----------|-----------|------|
| A001 | [假设内容] | [类型] | [验证方式] | [验证时间] | [验证人] | [状态] | [风险等级] | [关联约束ID] | [不成立后果] | [备注] |

### 5. 需近期验证的假设（未来30天内到期）
| ID | 内容 | 验证时间 | 验证人 | 提醒方式 |
|----|-----|---------|-------|---------|
| A001 | [内容] | [验证时间] | [验证人] | [邮件/短信/会议提醒] |

### 6. 已证伪假设 & 风险转化记录
| ID | 原内容 | 证伪日期 | 转化风险ID | 转交日期 | 已通知风险登记人 |
|----|-----|---------|-----------|---------|-----------------|
| A003 | [原内容] | [证伪日期] | [风险ID] | [转交日期] | [是/否] |

### 7. 本周期新增约束（含来源与影响分析）
| ID | 约束描述 | 来源 | 影响分析 | 责任人 |
|----|---------|------|---------|-------|

### 8. Recommended Next Skill
- 🔴假设或已证伪假设 → **risk-register-builder**
- 🟡成本约束（信创专项预算） → **cost-estimation-helper**
- 🟡时间/外部依赖约束（人行联调窗口） → **schedule-sequencer**
- 等保测评/合规验收 → **risk-register-builder**（以合规风险形式输入）
```
