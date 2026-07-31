# PMO Agent & Skill 体系

> 企业级项目管理办公室（PMO）智能体与技能库，支持银行IT项目全生命周期管理。

## 体系组成

- **4个智能体（Agent）**：项目管控、项目执行、项目检查、战略推动
- **36个技能（Skill）**：覆盖战略决策、项目规划、进度管理、成本管理、质量管理、沟通协调、风险合规、需求范围、项目执行、项目收尾十大管控域
- **6个编排链（Orchestrator）**：一键触发多技能联动，覆盖立项→规划→执行→监控→收尾全流程

## 核心文件

| 文件 | 说明 |
|------|------|
| `pack.yaml` | 技能包索引（36个Skill + 4个Agent元数据） |
| `skills/` | 36个Skill技能文件（Markdown格式） |
| `.agents/` | 4个Agent配置文件 |
| `PMO领域Agent_Skill操作手册.md` | 使用指南（10个典型场景调用说明） |
| `PMO领域全量Agent_Skill清单_v1.0.xlsx` | 全量清单Excel（总览/Agent/Skill/Skill视图4个工作表） |
| `PMO-Agent-Skill体系第四轮全面审查报告.docx` | 第四轮审查报告 |
| `PMO Agent Skill 验收测试报告.docx` | 验收测试报告（112项测试用例） |
| `PMO Agent Skill 验收总结报告.docx` | 验收总结报告 |
| `PMO Agent Skill 解决方案售前材料.pptx` | 售前PPT材料 |

## 快速开始

在 Hermes Agent 中加载技能：

```
load skill:project-charter-writer
load skill:milestone-planner
load skill:earned-value-evm-orchestrator
```

详见 `PMO领域Agent_Skill操作手册.md`。

## Skill 规范

符合 SkillHub 平台规范（author: `li.chen56@gientech.com`，department: `PMO-BUCON`）。

## 许可证

MIT License
