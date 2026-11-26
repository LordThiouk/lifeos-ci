# Short review of 3 FullRun bricks (lifeos-ci). Commit the report RIGHT AWAY, then stop.

Forbidden: push, `gh`, editing any file other than `REVIEW-BRICKS-c.md`, running tests. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. `git fetch origin '+refs/heads/fr/*:refs/remotes/origin/fr/*'`. Read ONLY these bricks: verify-forge-audit verify-silas close-max, using `git show origin/fr/brick-<n>:.github/workflows/fr-<n>.yml`. Read the inputs block of `_agent-run.yml` (branch origin/fr/agent-run-inputs) once.
2. For each brick, check: valid YAML; `workflow_call` and `workflow_dispatch` with the same inputs plus `chain`; the right agent/target_agent/stop_after_step/chain_phase (Serena→Architect 3 plan; Aditi→Designer 4; Engineer, Anvil, Forge 4 build; code-reviewer, Forge, Silas 5 verify; Max 6 close); `next` only if `inputs.chain && status == 'ok'`; no secret, no push; every input passed to `_agent-run.yml` exists there.
3. Write `REVIEW-BRICKS-c.md` (20 lines max): verdict `MERGE OK` or `BLOQUANT`, one table row per brick, and any problems with file:line. Commit it with the message "review: briques c". Stop.
