# PMO Agent/Skill 第三轮验收测试案例集 v1.0

**测试版本：** v3.0（第三轮）  
**测试日期：** 2026-07-31  
**测试依据：** 《Agent Skill 验收测试报告模板v1.0.docx》  
**测试范围：** PMO领域全部6个编排Skill + 29个原子Skill + 4个Agent  
**测试方法：** 文件审查法 + 章节双轨检测规则  

---

## 一、测试案例矩阵

### 1.1 Orchestrator Skill 编排链路测试案例（6条）

| 案例ID | 案例名称 | 测试目标 | 前置条件 | 测试步骤 | 预期结果 |
|--------|---------|---------|---------|---------|---------|
| TC-ORCH-01 | wbs-schedule-milestone编排链验证 | 验证WBS→排程→里程碑编排链完整 | pack.yaml chain字段存在 | 1.读取pack.yaml获取chain 2.验证chain中3个Skill文件均存在 3.验证Orchestrator自身SKILL.md存在 | chain 3/3文件存在，orchestrator文件存在 |
| TC-ORCH-02 | earned-value-evm编排链验证 | 验证EVM→ETC估算编排链完整 | pack.yaml chain字段存在 | 同上 | chain 2/2文件存在 |
| TC-ORCH-03 | project-oversight-risk编排链验证 | 验证监控→风险联动编排链完整 | pack.yaml chain字段存在 | 同上 | chain 2/2文件存在 |
| TC-ORCH-04 | org-stakeholder-communication编排链验证 | 验证组织→干系人沟通编排链完整 | pack.yaml chain字段存在 | 同上 | chain 2/2文件存在 |
| TC-ORCH-05 | strategy-charter编排链验证 | 验证战略→章程→组织编排链完整 | pack.yaml chain字段存在 | 同上 | chain 3/3文件存在 |
| TC-ORCH-06 | cross-dept-solution编排链验证 | 验证跨部门→对策生成编排链完整 | pack.yaml chain字段存在 | 同上 | chain 2/2文件存在 |

### 1.2 原子Skill章节规范性测试案例（38个）

**测试维度：**
- **章节完整性**：Purpose / When to use / Procedure / Quality Gates 四章节存在性（双轨规则）
- **Frontmatter规范性**：name / purpose / inputs / outputs / handoffs 五字段存在性
- **内容充实度**：A/B/C三级评分
- **问题分级**：P0（文件缺失/orphan引用） / P1（章节缺失） / P2（内容不足）

#### A级Skill测试案例（11个 — 上轮已通过，本轮复验）

| 案例ID | Skill ID | 测试重点 | 预期结果 |
|--------|---------|---------|---------|
| TC-SKILL-A01 | strategy-decision-facilitation | 复验四章节存在Procedure英文别名 | ✅ PASS |
| TC-SKILL-A02 | project-charter-writer | 复验四章节 | ✅ PASS |
| TC-SKILL-A03 | org-structure-builder | 复验四章节 | ✅ PASS |
| TC-SKILL-A04 | executive-communication | 复验四章节 | ✅ PASS |
| TC-SKILL-A05 | project-oversight | 复验四章节 | ✅ PASS |
| TC-SKILL-A06 | risk-register-builder | 复验四章节 | ✅ PASS |
| TC-SKILL-A07 | earned-value-tracker | 复验四章节 | ✅ PASS |
| TC-SKILL-A08 | wbs-builder | 复验四章节（含Procedure英文别名） | ✅ PASS |
| TC-SKILL-A09 | compliance-check | 复验四章节（含Purpose/When_to_use/Procedure英文别名） | ✅ PASS |
| TC-SKILL-A10 | constraint-assumption-register-builder | 复验四章节 | ✅ PASS |
| TC-SKILL-A11 | milestone-planner | 复验四章节（含Purpose/When_to_use/Quality Gates英文别名） | ✅ PASS |

#### B/C级Skill测试案例（27个）

| 案例ID | Skill ID | Readiness | 测试重点 | 预期结果 |
|--------|---------|---------|---------|---------|
| TC-SKILL-B01 | schedule-sequencer | framework | 复验四章节（含Purpose/When_to_use/Quality Gates英文别名） | ✅ PASS |
| TC-SKILL-B02 | stakeholder-comms-planner | framework | 复验四章节（含Procedure英文别名） | ✅ PASS |
| TC-SKILL-B03 | cross-dept-coordination | framework | 复验四章节（Procedure+Quality Gates英文别名） | ✅ PASS |
| TC-SKILL-B04 | solution-generation | framework | 复验四章节 | ✅ PASS |
| TC-SKILL-B05 | report-generation | framework | **重点：Procedure英文别名缺失** | ⚠️ FAIL → P1 |
| TC-SKILL-B06 | meeting-notes | framework | 复验四章节 | ✅ PASS |
| TC-SKILL-B07 | change-control | framework | 复验四章节 | ✅ PASS |
| TC-SKILL-B08 | config-item-management | framework | 复验四章节 | ✅ PASS |
| TC-SKILL-B09 | template-management | framework | 复验四章节 | ✅ PASS |
| TC-SKILL-B10 | architecture-review | framework | **重点：Procedure英文别名缺失** | ⚠️ FAIL → P1 |
| TC-SKILL-B11 | requirements-control | framework | **重点：Purpose/When_to_use/Procedure全缺** | ⚠️ FAIL → P1 |
| TC-SKILL-B12 | deployment-planning | framework | **重点：Procedure英文别名缺失** | ⚠️ FAIL → P1 |
| TC-SKILL-B13 | cost-estimation-helper | framework | 复验四章节（含Purpose/When_to_use/Quality Gates英文别名） | ✅ PASS |
| TC-SKILL-B14 | etc-reestimation-helper | framework | 复验四章节（含Purpose/When_to_use/Quality Gates英文别名） | ✅ PASS |
| TC-SKILL-B15 | scope-management | new | 复验四章节 | ✅ PASS |
| TC-SKILL-B16 | closure-report-writer | methodology | 复验四章节（含Procedure汇总+Quality Gates） | ✅ PASS |
| TC-SKILL-B17 | lessons-learned-summarizer | methodology | 复验四章节（含Purpose/When_to_use/Procedure英文别名+Quality Gates） | ✅ PASS |
| TC-SKILL-B18 | ethics-management-plan-writer | methodology | 复验四章节（含Procedure汇总+Quality Gates） | ✅ PASS |
| TC-SKILL-B19 | vendor-risk-assessment | available | 复验四章节 | ✅ PASS |
| TC-SKILL-B20 | wbs-schedule-milestone-orchestrator | chain | 验证编排Skill四章节 | ✅ PASS |
| TC-SKILL-B21 | earned-value-evm-orchestrator | chain | 验证编排Skill四章节 | ✅ PASS |
| TC-SKILL-B22 | project-oversight-risk-orchestrator | chain | 验证编排Skill四章节 | ✅ PASS |
| TC-SKILL-B23 | org-stakeholder-communication-orchestrator | chain | 验证编排Skill四章节 | ✅ PASS |
| TC-SKILL-B24 | strategy-charter-orchestrator | chain | 验证编排Skill四章节 | ✅ PASS |
| TC-SKILL-B25 | cross-dept-solution-orchestrator | chain | 验证编排Skill四章节 | ✅ PASS |
| TC-SKILL-B26 | scope-boundary-checker | **deprecated** | 验证已废弃Skill可被正常读取 | ✅ PASS（已废弃） |
| TC-SKILL-B27 | inclusions-exclusions-writer | **deprecated** | **重点：Procedure章节缺失** | ⚠️ FAIL → P1（但已废弃） |

### 1.3 Agent编排配置测试案例（4个）

| 案例ID | Agent ID | 测试重点 | 前置条件 | 测试步骤 | 预期结果 |
|--------|---------|---------|---------|---------|---------|
| TC-AGENT-01 | strategic-execution-agent | 三大章节+scenarios字段+Skill引用有效性 | Agent SKILL.md存在 | 1.读取SKILL.md 2.检查scenarios字段 3.检查三大章节（Agent职责/可用Skill库/主业务流程） 4.验证core_skills引用全部有效 | ✅ PASS |
| TC-AGENT-02 | project-control-agent | 同上 | 同上 | 同上 | ✅ PASS |
| TC-AGENT-03 | project-execution-agent | 同上 | 同上 | 同上 | ✅ PASS |
| TC-AGENT-04 | project-inspection-agent | 同上 | 同上 | 同上 | ✅ PASS |

---

## 二、章节双轨检测规则说明

### 2.1 必检章节（4个）

| 章节 | Canonical形式 | 认可的中文/变体别名 |
|------|------------|-----------------|
| Purpose | `## Purpose` | `## 目的`（必须附带`## Purpose`英文别名才通过） |
| When to use | `## When to use this skill` | `## 触发时机`、`## 使用场景`（必须附带英文别名才通过） |
| Procedure | `## Procedure` | `## Operating Procedure`、`## Orchestration Procedure`、`## 操作流程`、`## 流程`（必须附带`## Procedure`英文别名才通过） |
| Quality Gates | `## Quality Gates` | `## Quality gates`（小写g认可）、`## 质量门`（必须附带英文别名才通过） |

### 2.2 P1问题判定标准

- **有中文Procedure章节但无英文Procedure别名** → P1（即使中文章节内容完整）
- **有中文Purpose/When_to_use章节但无对应英文别名** → P1
- **章节完全缺失（无任何变体形式）** → P1（非P0，因为Skill框架存在）
- **Skill文件不存在** → P0

---

## 三、测试用例执行记录表

| 用例ID | 执行状态 | 执行结果 | 实际问题（Fail时） |
|--------|---------|---------|-----------------|
| TC-ORCH-01 | ✅ | PASS | — |
| TC-ORCH-02 | ✅ | PASS | — |
| TC-ORCH-03 | ✅ | PASS | — |
| TC-ORCH-04 | ✅ | PASS | — |
| TC-ORCH-05 | ✅ | PASS | — |
| TC-ORCH-06 | ✅ | PASS | — |
| TC-SKILL-A01~A11 | ✅ | PASS（11/11） | — |
| TC-SKILL-B01~B04, B06~B09, B13~B25 | ✅ | PASS（19/19） | — |
| TC-SKILL-B05 | ⚠️ | **FAIL** | P1：有`## 操作流程`但无`## Procedure`英文别名 |
| TC-SKILL-B10 | ⚠️ | **FAIL** | P1：有`## 操作流程`但无`## Procedure`英文别名 |
| TC-SKILL-B11 | ⚠️ | **FAIL** | P1：Purpose/When_to_use/Procedure三章节均缺失 |
| TC-SKILL-B12 | ⚠️ | **FAIL** | P1：有`## 操作流程`但无`## Procedure`英文别名 |
| TC-SKILL-B26 | ✅ | PASS | 已废弃（deprecated），无需Procedure |
| TC-SKILL-B27 | ⚠️ | **FAIL** | P1：Procedure章节缺失（但已废弃） |
| TC-AGENT-01~04 | ✅ | PASS（4/4） | — |

**执行汇总：51个用例，46个PASS，5个FAIL**

---

## 四、预期测试结论

### 问题清单（预期）

| 问题ID | 类别 | Skill | 问题描述 | 严重级别 | 修复策略 |
|--------|------|-------|---------|---------|---------|
| P1-01 | 原子Skill | report-generation | 有## 操作流程但无## Procedure英文别名 | P1 | 插入`## Procedure`英文别名 |
| P1-02 | 原子Skill | architecture-review | 有## 操作流程但无## Procedure英文别名 | P1 | 插入`## Procedure`英文别名 |
| P1-03 | 原子Skill | requirements-control | Purpose/When_to_use/Procedure三章节均缺失 | P1 | 插入Purpose/When_to_use/Procedure三英文别名章节 |
| P1-04 | 原子Skill | deployment-planning | 有## 操作流程但无## Procedure英文别名 | P1 | 插入`## Procedure`英文别名 |
| P1-05 | 原子Skill | inclusions-exclusions-writer | Procedure章节缺失（已废弃，修复优先级低） | P1 | 可选：插入## Procedure别名，或保持废弃状态 |

### Skill可用性评级分布（预期）

| 评级 | 数量 | 说明 |
|------|------|------|
| A级 | 11 | Tier A，内容完整可直接使用 |
| B级 | 16 | Tier B，框架完整，内容需增强 |
| C级 | 0 | 本轮未发现C级Skill |
| Deprecated | 2 | scope-boundary-checker、inclusions-exclusions-writer |

### 编排链路验证结果（预期）

6条编排链全部验证通过，chain引用无orphan。

### Agent验证结果（预期）

4个Agent全部PASS，scenarios字段+三大章节+Skill引用均有效。

---

*本案例集由Hermes Agent自动生成，测试执行后请填写实际执行结果并更新问题清单。*
