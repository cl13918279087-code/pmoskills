# Sample flow

## Scenario
A team needs to plan a semester-long engineering project with limited time, uncertain scope edges, and several stakeholder touchpoints.

## Suggested flow
1. Run `project-charter-writer` to frame the problem, objective, scope, and success conditions.
2. Run `scope-boundary-checker` and `inclusions-exclusions-writer` to force explicit boundaries.
3. Run `constraint-assumption-register-builder` to capture what the plan depends on.
4. Run `wbs-builder` to break the project into manageable work packages.
5. Run `schedule-sequencer` and `milestone-planner` to establish execution order and control points.
6. Run `risk-register-builder` and `cost-estimation-helper` to make exposure visible.
7. Run `stakeholder-comms-planner` to align reporting and decision cadence.
8. During execution, run `earned-value-tracker` and `etc-reestimation-helper` when the plan starts drifting.
9. At the end, run `closure-report-writer`, `lessons-learned-summarizer`, and `ethics-management-plan-writer` for closure and reusable learning.

## Expected artifacts
- project charter
- scope boundaries and exclusions
- constraint/assumption register
- work breakdown structure
- sequencing notes and milestone plan
- risk register
- cost estimate
- stakeholder communications plan
- closure report and lessons learned
