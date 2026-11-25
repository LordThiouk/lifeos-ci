# Assemble the FullRun bricks into one branch (lifeos-ci). Commit after each step.

Forbidden: push, `gh`, running tests, deleting files. `git merge` is allowed. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. `git fetch origin '+refs/heads/fr/*:refs/remotes/origin/fr/*'`. On the current branch, merge in order with `git merge --no-edit`: origin/fr/agent-run-inputs, then the 9 bricks origin/fr/brick-{plan-serena,build-aditi-ui,build-engineer,build-anvil,build-forge-code,verify-code-review,verify-forge-audit,verify-silas,close-max}, then origin/fr/brick-fullrun. On a conflict in `prompts/`, keep both versions. On a conflict in `_agent-run.yml`, keep the version from fr/agent-run-inputs plus whatever main has added.
2. In `.github/workflows/fr-plan-vera.yml`: add `workflow_call` with the same inputs as `workflow_dispatch` plus `chain` (boolean, default true), and make `next` run only `if: inputs.chain && needs.run.outputs.status == 'ok'`. In `fr-close-max.yml`, fix the comment that says « Premier agent FullRun ». In `fr-build-forge-code.yml`, `fr-verify-silas.yml` and `fr-close-max.yml`, add a `description` to `chain`.
2b. In `_agent-run.yml`, where opencode is launched: pass `--agent "$TARGET_AGENT"` if it is not empty, pass `--stop-after-step "$STOP_AFTER_STEP"` if it is not empty, and export `CHAIN_PHASE`. Change nothing else.
3. Check every workflow with python3 yaml.safe_load. Commit with the message "feat: assemblage briques fullrun". Stop.
