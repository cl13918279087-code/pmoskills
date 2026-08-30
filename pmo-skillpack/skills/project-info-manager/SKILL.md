---
name: "project-info-manager"
display_name: "项目信息库管理器"
description: "管理项目全生命周期信息库，支持Skill运行时查询、写入、更新项目信息，实现信息一次采集、全项目共享。"
author: PMO-BUCON
department: "PMO"
usage_scope: "仅本地使用"
version: "v0.8.0"
tags:
  - 项目信息库
  - PMO
  - 信息管理
  - 持久化
---

# 项目信息库管理器 (Project Information Library Manager)

## Purpose

项目信息库是项目全生命周期信息的持久化存储中心。所有项目信息（背景/范围/组织/阶段/风险/约束等）统一写入信息库，各Skill运行时从信息库读取，缺失信息才触发采集请求。

**核心价值**：
- 信息一次采集，所有Skill共享，避免重复采集
- 信息来源可追溯，版本受控
- Skill执行前自动检查信息完整性

## When to use this skill

**任何Skill执行前必须先调用本Skill**，检查所需信息是否已在库中：

1. **Skill执行前** → 调用本Skill查询信息库，确认所需数据是否完整
2. **新信息获取后** → 调用本Skill写入信息库，供其他Skill使用
3. **项目里程碑完成** → 更新信息库（如实际里程碑日期、风险状态变化）
4. **信息缺失时** → 向用户请求采集缺失信息，避免凭空生成

## Expected Inputs

| Input | Description | Example |
|-------|-------------|---------|
| action | 操作类型 | `query` / `write` / `update` / `list_missing` |
| skill_id | 调用方Skill ID（可选） | `wbs-builder`, `earned-value-tracker` |
| data_category | 信息类别（写入时） | `milestones`, `risks`, `constraints` |
| data | 具体数据（写入时） | YAML/JSON格式的项目信息 |

## Procedure

### Step 1 — 查询信息库

```
输入：action=query, skill_id=<调用方Skill>
输出：信息库匹配结果 + 缺失信息列表
```

**查询逻辑**：
1. 读取`skill_info_needs.yaml`，获取该Skill的必填信息项
2. 逐一检查`information_registry.yaml`，确认哪些信息已就绪
3. 如有缺失，返回缺失信息清单（附带采集建议）

**返回格式**：
```
✅ 信息库检查结果 — <Skill名称>
═══════════════════════════════════════

| 信息项 | 状态 | 来源文件 | 说明 |
|--------|------|---------|------|
| 阶段规划 | ✅ 完整 | phases.yaml | 7阶段，含入口/出口标准 |
| 里程碑清单 | ✅ 完整 | milestones.yaml | 14个里程碑 |
| 组织架构 | ⚠️ 部分 | org_structure.yaml | 关键人员姓名待确认 |
| 约束条件 | ✅ 完整 | constraints.yaml | 4项约束 |
| ... | ... | ... | ... |

缺失信息（需采集）：
  ❌ 干系人详细联系方式 → stakeholder-comms-planner需要，建议向PMO确认
  ❌ EVM基线数据 → earned-value-tracker需要，建议项目启动后由PMO录入

═══════════════════════════════════════
```

### Step 2 — 写入信息库

```
输入：action=write, data_category=<类别>, data=<YAML/JSON>
输出：写入确认 + 影响评估（哪些Skill会受影响）
```

**写入规则**：
- 新增信息：写入对应YAML文件，更新`information_registry.yaml`
- 更新信息：保留历史版本（`<file>.bak`），更新`information_registry.yaml`的`last_updated`
- 批量写入：事务性写入，要么全成功，要么全回滚

### Step 3 — 列出缺失信息

```
输入：action=list_missing
输出：所有缺失信息清单（按优先级排序）
```

**优先级定义**：
- 🔴 高：影响当前执行的Skill
- 🟡 中：影响未来3个月内的Skill
- 🟢 低：项目中后期才需要的Skill

### Step 4 — 信息完整性报告

```
输入：action=status
输出：项目信息库整体状态报告
```

## Deliverables

- **信息库查询结果**（指定Skill所需信息的状态）
- **缺失信息清单**（按优先级排序，含采集建议）
- **信息完整性报告**（项目整体信息就绪度）
- **写入确认单**（写入操作的结果和影响评估）

## 信息库文件清单

| 文件 | 内容 | 维护责任人 |
|------|------|---------|
| `project_config.yaml` | 项目基础配置 | 信息库管理器 |
| `project_background.yaml` | 项目背景与目标 | 信息库管理器 |
| `project_scope.yaml` | 项目范围（In/Out Scope） | 信息库管理器 |
| `org_structure.yaml` | 组织架构 | 信息库管理器 |
| `phases.yaml` | 阶段规划 | 信息库管理器 |
| `milestones.yaml` | 里程碑清单 | 信息库管理器 |
| `deliverables.yaml` | 交付物清单 | 信息库管理器 |
| `constraints.yaml` | 约束条件 | 信息库管理器 |
| `assumptions.yaml` | 关键假设 | 信息库管理器 |
| `success_criteria.yaml` | 成功衡量标准 | 信息库管理器 |
| `top_risks.yaml` | 主要风险 | 信息库管理器 |
| `communication.yaml` | 沟通管理机制 | 信息库管理器 |
| `pending_matters.yaml` | 待明确事项 | 信息库管理器 |
| `information_registry.yaml` | 信息项索引 | **自动维护** |
| `skill_info_needs.yaml` | Skill信息需求矩阵 | **自动维护** |

## Quality Gates

- [ ] 每次Skill执行前必须调用本Skill进行信息检查
- [ ] 新采集信息必须写入信息库，禁止直接传递给下游Skill而不入库
- [ ] 信息更新必须保留历史版本（`.bak`文件）
- [ ] 缺失信息必须在Skill执行前标注`[待采集]`，不得凭空生成
- [ ] 信息库完整性报告须在项目启动会和每月PMO例会上更新

## 信息库目录约定

项目信息库存放于项目根目录下的`.项目信息库/`目录：

```
<项目根目录>/
└── .项目信息库/
    ├── README.md
    ├── <category>.yaml       # 各信息类别文件
    └── ...
```

**标准项目根目录查找顺序**：
1. 当前工作目录的`.项目信息库/`
2. 上级目录的`.项目信息库/`
3. 用户的`~/.hermes/projects/<project_id>/.项目信息库/`

## 与其他Skill的协作

| 协作Skill | 协作方式 |
|----------|---------|
| 所有Skill | 执行前调用`project-info-manager`查询信息完整性 |
| milestone-planner | 写入里程碑更新（实际完成日期） |
| risk-register-builder | 写入风险状态变化（开立/关闭/升级） |
| earned-value-tracker | 写入EVM基线数据（PV/EV/AC） |
| deployment-planning | 写入上线切换实际结果 |
| closure-report-writer | 读取完整信息库，生成关闭报告 |

## Failure Modes to Avoid

- **不查信息库直接采集** → 重复采集浪费资源，且信息不一致
- **采集后不入库** → 信息只存在于单个Skill的输出中，其他Skill无法共享
- **凭空生成信息** → 用假设值代替缺失信息，导致后续Skill输出不准确
- **信息版本冲突** → 多处同时更新同一信息项，未保留变更历史
