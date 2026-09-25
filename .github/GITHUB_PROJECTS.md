# GitHub Projects 使用指南

## 一、项目面板访问

访问地址：https://github.com/cl13918279087-code/pmoskills/projects

## 二、看板结构（5列）

| 列名 | 用途 | 自动化规则 |
|------|------|-----------|
| **📋 Backlog** | 已接收但未开始处理的 Issue/PR | 新建 Issue/PR 自动入列 |
| **✅ Ready** | 确认要做的，准备开始 | 手动拖入 |
| **🔨 In Progress** | 正在开发/Review 中 | PR Open 时自动移入 |
| **🧪 Testing** | 等待测试验证 | 手动拖入 |
| **🚀 Done** | 已完成并发布 | PR Merge 时自动移入 |

## 三、手动创建项目面板

由于 GitHub Projects 配置无法通过文件管理，需手动创建：

1. 进入仓库 → **Projects** → **New project**
2. 选择 **Board** 模板
3. 命名为 `PMO Skills 看板`
4. 添加以下列：
   - 📋 Backlog
   - ✅ Ready
   - 🔨 In Progress
   - 🧪 Testing
   - 🚀 Done

## 四、Issue/PR 自动操作配置

创建项目后，可设置自动化规则：

### Issue 自动化
| 触发条件 | 执行动作 |
|---------|---------|
| 新建 Issue | 添加到 **📋 Backlog** |
| Issue 标签 `bug` | 添加 P1 优先级 |
| Issue 标签 `enhancement` | 添加 P2 优先级 |

### PR 自动化
| 触发条件 | 执行动作 |
|---------|---------|
| 新建 PR | 添加到 **🔨 In Progress** |
| PR Merged | 移动到 **🚀 Done** |
| PR Closed（未合并） | 移动到 **📋 Backlog** |

## 五、Milestone 设置

建议设置以下 Milestone 用于版本管理：

| Milestone | 目标版本 | 描述 |
|-----------|---------|------|
| v1.0 | v1.0.0 | MVP 版本：核心 Skill 上线 |
| v1.1 | v1.1.0 | 首批改进：Bugfix + 体验优化 |
| v2.0 | v2.0.0 | 完整版：37个 Skill 全部就绪 |

## 六、Labels 参考

| Label | 颜色 | 用途 |
|-------|------|------|
| `bug` | 🔴 红色 | Bug 报告 |
| `enhancement` | 🟢 绿色 | 功能增强 |
| `question` | 🔵 蓝色 | 使用咨询 |
| `documentation` | 🟡 黄色 | 文档改进 |
| `P0` | 🔴 红色 | 紧急优先级 |
| `P1` | 🟠 橙色 | 重要优先级 |
| `P2` | 🟡 黄色 | 一般优先级 |
| `good first issue` | 🟣 紫色 | 适合新手的任务 |
| `orchestrator` | 🔵 蓝色 | 编排类 Skill |
| `atomic` | 🟢 绿色 | 交互类 Skill |

---

*最后更新：2026-08-30*
