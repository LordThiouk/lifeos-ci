# Review of the bricks assembly (lifeos-ci). Short run. Commit the report right away.

Forbidden: push, `gh`, running tests, editing anything other than `REVIEW-ASSEMBLE.md`. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. Read `.github/workflows/fr-fullrun.yml`, `fr-plan-vera.yml`, `_agent-run.yml`, and the list of `fr-*.yml` files.
2. Check: valid YAML; every brick that fr-fullrun calls exists and has `workflow_call` + `chain`; the inputs passed exist in `_agent-run.yml`; the order is vera → serena → builds → code-review → forge-audit → silas → max; a verify or max failure loops back to build (attempt < max_attempts); no merge conflict markers (`<<<<<<<`); no secret.
3. Write `REVIEW-ASSEMBLE.md` (25 lines max): verdict `MERGE OK` or `BLOQUANT`, with problems listed as file:line. Commit with the message "review: assemblage". Stop.
