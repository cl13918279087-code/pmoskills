# 贡献指南 📖

感谢你参与 PMO Skills 社区贡献！请阅读以下指南，确保你的代码顺利合入。

---

## 一、贡献类型

| 类型 | 说明 |
|------|------|
| 🆕 新增 Skill | 为项目添加全新的原子或编排 Skill |
| 🔧 改进现有 Skill | 优化描述、修复 bug、完善功能 |
| 📝 文档改进 | 修复错别字、完善 README、提升可读性 |
| 🧪 测试用例 | 为现有 Skill 添加或完善测试 |
| ⚡ 性能优化 | 提升 Skill 执行效率 |

---

## 二、贡献流程

### 1. Fork 仓库

访问 [pmoskills](https://github.com/cl13918279087-code/pmoskills)，点击右上角 **Fork** 按钮。

### 2. 克隆到本地

```bash
git clone https://github.com/<your-username>/pmoskills.git
cd pmoskills
```

### 3. 创建分支

```bash
# 新增 Skill
git checkout -b feature/skill-<skill-name>

# 改进 Skill
git checkout -b fix/<skill-name>-<short-description>

# 文档改进
git checkout -b docs/<short-description>
```

### 4. 编写代码

- 遵循 [Skill 创作规范](#四-skill-创作规范)
- 确保 `SKILL.md` 文件完整
- 测试通过后再提交

### 5. 提交 PR

```bash
git add .
git commit -m "feat: 新增 XXX Skill"
git push origin feature/skill-xxx
```

然后在 GitHub 上发起 Pull Request 到 `pmoskills:main`。

### 6. PR 审核

- Maintainer（@cl13918279087-code）会自动收到通知
- 请根据 Review 意见在 **3个工作日内** 修改
- 修改后推送新提交，PR 自动更新

### 7. 合入

通过 Review 后，由 Maintainer 执行 Squash & Merge。

---

## 三、PR 规范

### Commit 消息格式

```
<type>: <简短描述>

可选的详细说明
```

**type 类型：**

| type | 用途 |
|------|------|
| `feat` | 新增功能（新增 Skill） |
| `fix` | 修复 bug |
| `refactor` | 重构（不改变功能） |
| `docs` | 文档修改 |
| `test` | 测试相关 |
| `chore` | 构建/工具/配置 |

**示例：**

```
feat: 新增 lessons-learner Skill

支持从项目文档中自动提取经验教训，分类为监管合规类、技术类、管理类三大类别。
```

### PR 描述模板

```markdown
## 概述
简要说明本次改动。

## 改动范围
- 新增 Skill：xxx
- 修改文件：xxx

## 测试情况
- [ ] 本地测试通过
- [ ] SKILL.md 格式校验通过

## 相关 Issue
Fixes #<issue号>
```

---

## 四、Skill 创作规范

### 4.1 目录结构

```
skills/
└── <skill-name>/
    ├── SKILL.md          # 必需：Skill 定义文件
    ├── references/       # 可选：参考资料
    ├── templates/        # 可选：模板文件
    └── scripts/          # 可选：辅助脚本
```

### 4.2 SKILL.md 结构

```markdown
---
name: <skill-name>
description: Use when <触发场景>。<一句话行为描述>。
---

# <Skill中文名称>

## 介绍
<详细说明>

## 使用场景
<何时使用>

## 使用方法
<如何使用>

## 注意事项
<注意点>
```

### 4.3 命名规范

| 元素 | 规范 | 示例 |
|------|------|------|
| Skill ID | 英文小写+连字符 | `risk-register-builder` |
| 中文名称 | 简洁明了 | `风险登记册构建工具` |
| 描述 | 以"Use when"开头 | `Use when 需要识别和记录项目风险` |

### 4.4 质量标准

- [ ] `SKILL.md` 文件存在且格式正确
- [ ] `description` 字段以"Use when"开头
- [ ] 中文名称和英文 ID 对应
- [ ] 包含完整的使用说明
- [ ] 无明显的错别字或格式错误

---

## 五、Issue 规范

| 类型 | 模板 | 处理优先级 |
|------|------|-----------|
| 🐛 Bug报告 | 见下方模板 | P0 / P1 |
| 💡 功能建议 | 见下方模板 | P1 / P2 |
| ❓ 使用咨询 | 自由格式 | P2 |
| 🔧 改进建议 | 见下方模板 | P2 |

### Bug Report 模板

```markdown
## 环境信息
- Agent 版本：xxx
- Skill 版本：xxx
- 系统环境：xxx

## 问题描述
描述问题

## 复现步骤
1. xxx
2. xxx

## 预期行为
描述预期

## 实际行为
描述实际

## 截图/日志
如有截图或日志，请附上
```

### Feature Request 模板

```markdown
## 需求背景
描述业务场景

## 期望功能
描述期望实现的功能

## 优先级
[ ] P0（紧急） [ ] P1（重要） [ ] P2（一般）

## 其他
补充说明
```

---

## 六、联系方式

- **Issue：** 直接在 GitHub 创建 Issue
- **紧急联系：** 飞书 @cl13918279087-code
- **讨论区：** GitHub Discussions

---

*最后更新：2026-08-30*
