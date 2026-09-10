# 🕷️ Scrapling Data Engineer

[![CI](https://github.com/bigbaibai-luis/scrapling-data-engineer/actions/workflows/ci.yml/badge.svg)](https://github.com/bigbaibai-luis/scrapling-data-engineer/actions/workflows/ci.yml)

An open-source **AI agent persona + Claude Code skill** that turns the [Scrapling](https://github.com/D4Vinci/Scrapling) web-scraping framework into a drop-in "data collection engineer" for your AI coding tools.

> [简体中文](README.zh-CN.md)

## What it is

This is **not** a standalone app. It is a Markdown persona (in the style of [agency-agents](https://github.com/msitarzewski/agency-agents)) plus a [Claude Code Agent Skill](https://docs.anthropic.com/en/docs/claude-code/skills) that give an AI coding agent deep, accurate knowledge of Scrapling — stealth fetching, adaptive selectors, scaled crawling, clean export — along with hard compliance rules (robots.txt, ToS, privacy law).

## Why Scrapling + agency-agents

- **agency-agents** provides the persona format (frontmatter + system prompt) and install conventions.
- **Scrapling** provides the real capability: stealth fetchers, adaptive selectors, spiders, and clean export.

## What's inside

| Path | Description |
|---|---|
| `agents/scrapling-data-engineer.md` | The persona (Claude Code / Qwen Code / Codex / Cursor) |
| `skills/scrapling-data-engineer/SKILL.md` | Claude Code on-demand skill |
| `scripts/install.sh` / `install.ps1` | Installers (project or user level) |
| `examples/` | Runnable Scrapling examples |
| `.github/workflows/ci.yml` | CI validation |

## Install

Requirements: one of the supported tools + Python 3.10+ (only to run the scrapers).

```bash
git clone https://github.com/bigbaibai-luis/scrapling-data-engineer.git
cd scrapling-data-engineer
./scripts/install.sh            # current project
./scripts/install.sh --global   # or user level
```

Windows (PowerShell):

```powershell
.\scripts\install.ps1
.\scripts\install.ps1 -Global
```

Installs to:

| Tool | Target |
|---|---|
| Claude Code (agent) | `.claude/agents/scrapling-data-engineer.md` |
| Claude Code (skill) | `.claude/skills/scrapling-data-engineer/SKILL.md` |
| Cursor | `.cursor/rules/scrapling-data-engineer.mdc` |
| Qwen Code | `.qwen/agents/scrapling-data-engineer.md` |
| Codex | `.codex/agents/scrapling-data-engineer.md` |

## Usage

```
@scrapling-data-engineer scrape product name + price from https://example.com/products to CSV, respecting robots.txt
```

The agent checks robots.txt/ToS → picks the right fetcher → writes a runnable script → validates output → returns data + a short report.

## Compliance

This agent is for **legitimate, authorized** data collection only. It refuses to scrape against robots.txt/ToS and never scrapes personal data at scale. Misuse (credential stuffing, paywall bypass, scraping private data) is on the user — see [Scrapling's disclaimer](https://github.com/D4Vinci/Scrapling#disclaimer).

## Repo structure

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

## License

MIT — see [LICENSE](LICENSE).
