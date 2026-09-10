# Scrapling Data Engineer — installer (agent + skill)
# Copies the agent persona and the Claude Code skill into supported tools.
# Usage: .\install.ps1 [-Global]    (default: current project)

param([switch]$Global)

$ErrorActionPreference = "Stop"

$agentSrc = Join-Path $PSScriptRoot "..\agents\scrapling-data-engineer.md"
$skillSrc = Join-Path $PSScriptRoot "..\skills\scrapling-data-engineer\SKILL.md"

if (-not (Test-Path $agentSrc)) { throw "Agent file not found: $agentSrc" }
if (-not (Test-Path $skillSrc)) { throw "Skill file not found: $skillSrc" }

if ($Global) { $root = $HOME } else { $root = (Get-Location).Path }

$agentTargets = @(
    @{ Dir = Join-Path $root ".claude\agents"; Name = "scrapling-data-engineer.md" },
    @{ Dir = Join-Path $root ".cursor\rules";  Name = "scrapling-data-engineer.mdc" },
    @{ Dir = Join-Path $root ".qwen\agents";   Name = "scrapling-data-engineer.md" },
    @{ Dir = Join-Path $root ".codex\agents";  Name = "scrapling-data-engineer.md" }
)
$skillTarget = @{ Dir = Join-Path $root ".claude\skills\scrapling-data-engineer"; Name = "SKILL.md" }

foreach ($t in $agentTargets) {
    New-Item -ItemType Directory -Force -Path $t.Dir | Out-Null
    Copy-Item -Force $agentSrc (Join-Path $t.Dir $t.Name)
}

New-Item -ItemType Directory -Force -Path $skillTarget.Dir | Out-Null
Copy-Item -Force $skillSrc (Join-Path $skillTarget.Dir $skillTarget.Name)

Write-Host "Installed Scrapling Data Engineer:"
foreach ($t in $agentTargets) {
    Write-Host "  Agent: $(Join-Path $t.Dir $t.Name)"
}
Write-Host "  Skill: $(Join-Path $skillTarget.Dir $skillTarget.Name)"
