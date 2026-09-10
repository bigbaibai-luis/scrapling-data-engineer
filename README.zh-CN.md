# 🕷️ Scrapling Data Engineer

[![CI](https://github.com/bigbaibai-luis/scrapling-data-engineer/actions/workflows/ci.yml/badge.svg)](https://github.com/bigbaibai-luis/scrapling-data-engineer/actions/workflows/ci.yml)

一个开源的 **AI Agent 角色 + Claude Code 技能**：把 [Scrapling](https://github.com/D4Vinci/Scrapling) 爬虫框架封装成一名「数据采集工程师」，可一键装进你的 AI 编程工具。

> [English](README.md)

## 这是什么

这不是一个独立应用，而是一个 Markdown 角色文件（沿用 [agency-agents](https://github.com/msitarzewski/agency-agents) 的格式）+ 一个 [Claude Code Agent Skill](https://docs.anthropic.com/en/docs/claude-code/skills)。它让 AI 编程 agent 获得对 Scrapling 的准确、深入的用法知识——静默抓取、自适应解析、大规模爬取、干净导出——同时内置硬性合规规则（robots.txt、服务条款、隐私法）。

## 为什么是 Scrapling + agency-agents

- **agency-agents** 提供「角色格式」（frontmatter + 系统提示词）和安装惯例；
- **Scrapling** 提供真正的爬虫能力：静默 fetcher、自适应选择器、spider、干净导出。

## 包含内容

| 路径 | 说明 |
|---|---|
| `agents/scrapling-data-engineer.md` | 角色本体（Claude Code / Qwen Code / Codex / Cursor） |
| `skills/scrapling-data-engineer/SKILL.md` | Claude Code 按需加载技能 |
| `scripts/install.sh` / `install.ps1` | 安装脚本（项目级或用户级） |
| `examples/` | 可运行的 Scrapling 示例 |
| `.github/workflows/ci.yml` | CI 校验 |

## 安装

要求：任一支持的 AI 工具 + Python 3.10+（仅在实际运行爬虫时需要）。

```bash
git clone https://github.com/bigbaibai-luis/scrapling-data-engineer.git
cd scrapling-data-engineer
./scripts/install.sh            # 装进当前项目
./scripts/install.sh --global   # 或用户级（所有项目）
```

Windows（PowerShell）：

```powershell
.\scripts\install.ps1
.\scripts\install.ps1 -Global
```

安装到：

| 工具 | 目标路径 |
|---|---|
| Claude Code（agent） | `.claude/agents/scrapling-data-engineer.md` |
| Claude Code（skill） | `.claude/skills/scrapling-data-engineer/SKILL.md` |
| Cursor | `.cursor/rules/scrapling-data-engineer.mdc` |
| Qwen Code | `.qwen/agents/scrapling-data-engineer.md` |
| Codex | `.codex/agents/scrapling-data-engineer.md` |

## 用法

```
@scrapling-data-engineer 抓取 https://example.com/products 的商品名称、价格，导出成 CSV，遵守 robots.txt
```

这个角色会：检查 robots.txt/ToS → 选合适的 fetcher → 写可运行的脚本 → 校验输出 → 返回数据 + 简短报告。

## 合规声明

本角色仅用于**合法、被授权**的数据采集。它会拒绝违反 robots.txt/ToS 的抓取，也不会大规模采集个人数据。滥用（撞库、绕过付费墙、抓取隐私数据）的责任在使用者，与作者无关——见 [Scrapling 免责声明](https://github.com/D4Vinci/Scrapling#disclaimer)。

## 目录结构

```
scrapling-data-engineer/
├── agents/scrapling-data-engineer.md
├── skills/scrapling-data-engineer/SKILL.md
├── scripts/install.sh, install.ps1
├── examples/*.py
├── .github/workflows/ci.yml
├── .gitignore
├── README.md / README.zh-CN.md
└── LICENSE
```

## 许可证

MIT — 见 [LICENSE](LICENSE)。
