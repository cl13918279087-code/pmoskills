#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
install_skill() {
  local skill="$1"
  mkdir -p "$HOME/.claude/skills/$skill" "$HOME/.agents/skills/$skill"
  cp "$SCRIPT_DIR/.claude/skills/$skill/SKILL.md" "$HOME/.claude/skills/$skill/SKILL.md"
  cp "$SCRIPT_DIR/.agents/skills/$skill/SKILL.md" "$HOME/.agents/skills/$skill/SKILL.md"
}
SKILLS=(
  closure-report-writer
  constraint-assumption-register-builder
  cost-estimation-helper
  earned-value-tracker
  etc-reestimation-helper
  ethics-management-plan-writer
  inclusions-exclusions-writer
  lessons-learned-summarizer
  milestone-planner
  project-charter-writer
  risk-register-builder
  schedule-sequencer
  scope-boundary-checker
  stakeholder-comms-planner
  wbs-builder
)
for skill in "${SKILLS[@]}"; do install_skill "$skill"; done
