# Fix startup_failure of fr-fullrun.yml (code first, commit right away)

Run 45617005249 (`fr-fullrun.yml` dispatched with --ref fix/extra-repos-full, target Galass_Rider) ended in `startup_failure`: the workflow file itself is invalid at load time (likely from b193f47: job `loop` needs vera/serena, `contains(needs.*.result,'failure')`, or a reusable workflow call/permissions/secrets mismatch).
Forbidden: push, `gh` write commands, printing secrets, touching main. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. Run `actionlint` on .github/workflows/*.yml (install if missing) and check every `needs:` references an existing job, every `uses: ./.github/workflows/x.yml` has matching inputs/secrets/permissions, and `workflow_call` callers do not pass undeclared inputs.
2. Fix the cause with the smallest change. Also apply review point 1: use `!cancelled() && contains(needs.*.result,'failure')` for the loop.
3. Commit "fix(ci): fr-fullrun startup_failure". Add 3 lines to FIX-CI.md: cause, file:line, fix. Stop.
