#!/usr/bin/env bash
set -euo pipefail

# Scrapling Data Engineer — installer (agent + skill)
# Copies the agent persona and the Claude Code skill into supported tools.
# Usage: ./install.sh [--global]    (default: current project)

GLOBAL=0
if [ "${1:-}" = "--global" ]; then GLOBAL=1; fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_SRC="$SCRIPT_DIR/../agents/scrapling-data-engineer.md"
SKILL_SRC="$SCRIPT_DIR/../skills/scrapling-data-engineer/SKILL.md"

for f in "$AGENT_SRC" "$SKILL_SRC"; do
  if [ ! -f "$f" ]; then
    echo "error: not found: $f" >&2
    exit 1
  fi
done

if [ "$GLOBAL" -eq 1 ]; then ROOT="$HOME"; else ROOT="."; fi

# --- Agent persona ---
mkdir -p "$ROOT/.claude/agents"
cp "$AGENT_SRC" "$ROOT/.claude/agents/scrapling-data-engineer.md"
mkdir -p "$ROOT/.cursor/rules"
cp "$AGENT_SRC" "$ROOT/.cursor/rules/scrapling-data-engineer.mdc"
mkdir -p "$ROOT/.qwen/agents"
cp "$AGENT_SRC" "$ROOT/.qwen/agents/scrapling-data-engineer.md"
mkdir -p "$ROOT/.codex/agents"
cp "$AGENT_SRC" "$ROOT/.codex/agents/scrapling-data-engineer.md"

# --- Claude Code skill ---
mkdir -p "$ROOT/.claude/skills/scrapling-data-engineer"
cp "$SKILL_SRC" "$ROOT/.claude/skills/scrapling-data-engineer/SKILL.md"

echo "Installed Scrapling Data Engineer:"
echo "  Agent (Claude Code) : $ROOT/.claude/agents/scrapling-data-engineer.md"
echo "  Agent (Cursor)      : $ROOT/.cursor/rules/scrapling-data-engineer.mdc"
echo "  Agent (Qwen Code)   : $ROOT/.qwen/agents/scrapling-data-engineer.md"
echo "  Agent (Codex)       : $ROOT/.codex/agents/scrapling-data-engineer.md"
echo "  Skill (Claude Code) : $ROOT/.claude/skills/scrapling-data-engineer/SKILL.md"
