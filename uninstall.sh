#!/usr/bin/env bash
set -euo pipefail
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
for skill in "${SKILLS[@]}"; do
  rm -rf "$HOME/.claude/skills/$skill" "$HOME/.agents/skills/$skill"
done
