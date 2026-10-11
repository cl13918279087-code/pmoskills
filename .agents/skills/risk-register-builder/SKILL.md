---

name: "risk-register-builder"
pack: "project-management-pack"
version: "1.0"
purpose: "Create a project risk register with causes, impacts, likelihood, responses, and owners."
inputs: ["project context", "constraints", "assumptions", "known concerns/incidents"]
outputs: ["risk register", "top risks", "response ideas", "ownership suggestions"]
handoffs: ["stakeholder-comms-planner", "cost-estimation-helper", "etc-reestimation-helper"]

---
# risk-register-builder（银行业务定制版）

## Purpose
Create a project risk register with causes, impacts, likelihood, responses, and owners. This version is customized for banking industry risk management, incorporating regulatory requirements (Basel III/IV,银保监会规制), risk taxonomy, and operational resilience standards.

## Trigger this skill when
- A banking project, delivery effort, or formal planning activity needs clearer control artifacts.
- Scope, risk, cost, schedule, communication, or closure signals need structured review.
- You need planning outputs that can feed engineering, governance, or regulatory assessment work.
- Regulatory submissions, internal audit responses, or compliance attestations require risk documentation.
- New product launches, system migrations, or infrastructure changes need risk sign-off.

## Expected inputs
- project context
- constraints
- assumptions
- known concerns/incidents

---

## 信息采集（Step 0 — 风险识别前的上下文采集）

> ⚠️ **执行前必读**：本Skill需要上述4项输入数据。风险识别的质量直接取决于项目上下文是否充分。信息越充分，风险识别越精准；信息缺失时应主动采集，而非生成通用风险清单。

### Step 0.1 — 数据缺口检查

| 输入项 | 是否已知 | 未提供时的处理 |
|--------|---------|--------------|
| project context（项目上下文） | 请告知 | 标注 `[假设值-请核对]` |
| constraints（约束条件） | 请告知 | 标注 `[假设值-请核对]` |
| assumptions（假设条件） | 请告知 | 标注 `[假设值-请核对]` |
| known concerns/incidents（已知问题/事件） | 请告知 | 标注 `[假设值-请核对]` |

### Step 0.2 — 上下文采集问题

**请逐项回答（已知的跳过，直接告知）：**

1. **项目上下文（project context）**
   - 项目类型？（核心系统/数字渠道/信贷产品/合规系统/数据平台）
   - 项目规模和复杂度？
   - 当前处于什么阶段？
   - 涉及哪些监管框架？（Basel III/IV、银保监会规定、人行规定）

2. **约束条件（constraints）**
   - 主要约束是什么？（预算/时间/监管/技术）
   - 是否有硬性截止日期？
   - 是否存在已知的资源限制？

3. **假设条件（assumptions）**
   - 项目有哪些关键假设？（第三方按时交付、业务人员充分投入）
   - 哪些依赖关系存在较高不确定性？

4. **已知问题/事件（known concerns/incidents）**
   - 项目启动至今遇到过哪些重大问题或事件？
   - 哪些风险已被管理层知悉或接受？

### Step 0.3 — 数据确认

```
📊 风险登记册 信息采集确认单
═══════════════════════════════════════════

| 输入项 | 状态 | 采集摘要 |
|--------|------|---------|
| project context | ✅/⚠️/❓ | [摘要] |
| constraints | ✅/⚠️/❓ | [摘要] |
| assumptions | ✅/⚠️/❓ | [摘要] |
| known concerns | ✅/⚠️/❓ | [摘要] |

⚠️ [假设值-请核对] 的字段将在风险登记册中以醒目标注

请确认后"开始识别风险"，我将基于以上上下文执行风险分析。
═══════════════════════════════════════════
```

---

## Deliverables
- risk register (with banking risk taxonomy)
- top risks (ranked by probability-impact matrix)
- response ideas (aligned with risk appetite)
- ownership suggestions (with first/second line accountability)

---

## Operating Procedure

### Phase 1: Context Establishment

1. **Identify the banking risk domain**
   - 确定风险类别：战略风险、运营风险、合规风险、IT风险
   - 战略风险 (Strategic Risk): 业务战略决策、市场竞争、宏观经济变化
   - 运营风险 (Operational Risk): 流程失效、人员失误、系统故障、欺诈
   - 合规风险 (Compliance Risk): 监管违规、洗钱防控、数据隐私
   - IT风险 (IT Risk): 网络安全、系统可用性、数据完整性、第三方风险

2. **Define the control horizon**
   - 监管报告周期（如季度、半年度）
   - 内部风险委员会会议时间节点
   - 系统上线/变更的关键日期
   - 审计/检查的预计时间窗口

3. **Establish the risk appetite**
   - 参考银行已公布的风险偏好声明
   - 确定各风险类别的容忍度阈值
   - 识别硬限制（如资本充足率红线）

### Phase 2: Risk Identification & Classification

4. **Apply the Banking Risk Taxonomy**

| 风险类别 | 一级分类 | 二级分类示例 | 典型诱因 |
|---------|---------|------------|---------|
| 战略风险 | 市场风险 | 利率风险、汇率风险 | 货币政策变化、竞争格局改变 |
| 战略风险 | 业务风险 | 贷款集中度、资产质量 | 经济下行、行业周期性 |
| 运营风险 | 流程风险 | 交易处理错误、结算风险 | 人员失误、系统缺陷 |
| 运营风险 | 人员风险 | 内部欺诈、误操作 | 员工行为、授权失控 |
| 运营风险 | 系统风险 | 核心银行系统故障 | 硬件老化、软件缺陷 |
| 运营风险 | 外部事件 | 自然灾害、突发事件 | 不可抗力、供应链中断 |
| 合规风险 | 监管风险 | 资本要求违规、流动性违规 | 监管政策变化、合规程序失效 |
| 合规风险 | 法律风险 | 合同纠纷、诉讼 | 法律环境变化、文件瑕疵 |
| 合规风险 | 反洗钱风险 | 可疑交易、制裁合规 | 客户行为、交易模式异常 |
| IT风险 | 网络安全风险 | 数据泄露、网络攻击 | 恶意软件、钓鱼攻击 |
| IT风险 | 系统可用性 | 宕机、RTO超标 | 容量不足、变更失败 |
| IT风险 | 第三方风险 | SDK/API供应商失效 | 供应商破产、安全事件 |

### Phase 3: Risk Assessment with Probability-Impact Matrix

5. **Rate probability (Likelihood)**

| 等级 | 名称 | 描述 | 年度发生频率参考 |
|-----|-----|------|----------------|
| 5 | 几乎确定 (Almost Certain) | 在大多数情况下会发生 | >50% |
| 4 | 很可能 (Likely) | 在多数情况下可能发生 | 25%-50% |
| 3 | 中等 (Possible) | 在某些情况下可能发生 | 10%-25% |
| 2 | 不太可能 (Unlikely) | 在少数情况下可能发生 | 1%-10% |
| 1 | 罕见 (Rare) | 在特殊情况下才可能发生 | <1% |

6. **Rate impact (Severity)**

| 等级 | 名称 | 财务影响 | 监管/声誉影响 | 运营影响 |
|-----|-----|---------|-------------|---------|
| 5 | 灾难性 (Catastrophic) | 损失 > 银行一级资本的 5% | 监管处罚、重大声誉损害 | 业务完全中断 > 24小时 |
| 4 | 重大 (Major) | 损失 1%-5% 一级资本 | 监管调查、媒体报道 | 主要业务中断 4-24小时 |
| 3 | 中等 (Moderate) | 损失 0.1%-1% 一级资本 | 内部警告、监管关注 | 部分业务受影响 < 4小时 |
| 2 | 较小 (Minor) | 损失 < 0.1% 一级资本 | 客户投诉、内部通报 | 轻微不便、可快速恢复 |
| 1 | 可忽略 (Negligible) | 无直接财务损失 | 轻微关注 | 无实际影响 |

7. **Calculate Risk Score** = Probability × Impact

| 风险评分 | 风险等级 | 颜色标识 | 处理策略 |
|---------|---------|---------|---------|
| 19-25 | 极高 (Extreme) | 🔴 红色 | 立即上报风险委员会，制定应急方案，暂停或调整业务活动 |
| 13-18 | 高 (High) | 🟠 橙色 | 部门负责人直接监督，制定详细应对计划，配置专项资本缓冲 |
| 7-12 | 中 (Medium) | 🟡 黄色 | 业务负责人监控，建立预警指标，定期审查应对措施 |
| 4-6 | 低 (Low) | 🔵 蓝色 | 纳入日常监控，建立应急触发机制 |
| 1-3 | 极低 (Minimal) | ⚪ 白色 | 接受风险，持续监测，无需专项应对 |

### Phase 4: Risk Response Strategy

8. **Select appropriate response strategy**

| 策略 | 适用场景 | 银行具体措施 |
|-----|---------|-------------|
| **规避 (Avoid)** | 风险评分 ≥ 13，且无法控制 | 退出相关业务、取消项目、停止高风险产品 |
| **降低 (Mitigate)** | 风险评分 7-18，有可行的控制措施 | 强化内部控制、引入保险、改进流程 |
| **转移 (Transfer)** | 大额损失风险，可通过合约/保险转移 | 购买保险、外包非核心业务、引入担保 |
| **接受 (Accept)** | 风险评分 ≤ 6，且在风险偏好内 | 建立应急储备、配置资本缓冲、监控触发条件 |

9. **Develop response action plan**
   - 明确应对措施的责任部门（第一道防线：业务部门；第二道防线：风险/合规；第三道防线：内部审计）
   - 设定关键控制指标 (KCI) 和风险指标 (KRI)
   - 制定升级路径和触发条件
   - 估算应对成本并纳入资本规划

### Phase 5: Documentation & Reporting

10. **Produce the risk register**

```
## 风险登记册（模板）

| 风险ID | 风险类别 | 风险描述 | 诱因 | 影响 | 概率 | 影响等级 | 风险评分 | 风险等级 | 应对策略 | 应对措施 | 责任人 | 报告线 | KRI | 审查周期 |
|-------|---------|---------|------|------|------|---------|---------|---------|---------|---------|------|------|-----|---------|
```

11. **Produce executive summary**
    - Top 5 risks (按风险评分排序)
    - 需上报的风险（评分 ≥ 13）
    - 应对措施的资源需求
    - 风险偏好合规状态

---

## Quality Gates

- The output is specific to the banking project context and aligns with the bank's risk taxonomy.
- Each risk has a clear causal chain (诱因 → 风险事件 → 影响).
- Uncertainty, assumptions, and decision dependencies are visible.
- The result is usable by a PM, risk officer, or internal audit team.
- Risks should be causal and actionable, not generic statements with no response path.
- All risks rated High (≥13) have explicit escalation paths and escalation triggers documented.
- Risk response strategies align with the bank's defined risk appetite and tolerance thresholds.
- Regulatory notification requirements (e.g., major incidents, significant losses) are identified.

---

## Handoff Targets

- stakeholder-comms-planner
- cost-estimation-helper
- etc-reestimation-helper
- regulatory-reporting-helper (for compliance documentation)

---

## Output Style

- Be explicit about scope, timing, cost, risk, and governance tradeoffs.
- Prefer operational artifacts over broad managerial prose.
- Surface evidence gaps instead of inventing certainty.
- Keep the result usable in real banking project documents and GRC workflows.
- Use standard banking risk terminology aligned with Basel III/IV and local regulatory frameworks.

---

## Failure Modes to Avoid

- Do not confuse aspiration with approved commitment.
- Do not hide uncertainty inside a neat-looking plan.
- Do not treat every stakeholder or deliverable as equally critical.
- Do not sever planning artifacts from execution reality.
- Do not understate regulatory risk — assume all material risks require regulatory notification capability.
- Do not conflate first-line and second-line responsibilities; document who owns the risk vs. who oversees it.

---

## Minimum Output Skeleton

```md
## Summary
## Findings
## Structured outputs
## Risks / blockers
## Open questions
## Recommended next skill
```

## Appendix: Banking Risk Quick Reference

### 监管框架参考
- **Basel III/IV**: 资本充足率、流动性覆盖率、杠杆率
- **银保监会**: 商业银行风险管理指引、信息科技风险管理指引
- **中国人民银行**: 金融机构反洗钱规定、征信管理规定
- **网络安全法/数据安全法/个人信息保护法**: 数据安全与隐私保护要求

### 风险偏好声明要素
- 资本目标（Tier 1 Capital Ratio ≥ X%）
- 流动性目标（LCR ≥ X%, NSFR ≥ X%）
- 盈利目标（ROE, NIM）
- 不容忍风险领域（如涉及洗钱、欺诈的内部犯罪）
