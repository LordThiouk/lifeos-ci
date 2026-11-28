# Fix the push step so partial work is never lost (code first, commit right away)

Run 45615409070 (compare-acr on antenly): opencode stopped on quota, then the push step failed with "cannot rebase: You have unstaged changes" and all partial work on the runner was lost.
Forbidden: push, `gh` write commands, printing secrets, touching main. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. Find the push/rebase step in .github/workflows (and scripts it calls). Before the rebase: `git add -A` (respecting .gitignore, never `.fullrun` secrets) and commit "wip(<job_name>): partial work (agent stopped)" if anything is unstaged; run the step with `if: always() && !cancelled()` so it also runs after an agent failure.
2. Keep the guard (no push to main, branch must exist remotely). actionlint must pass.
3. Commit "fix(ci): keep partial work on agent failure". Add 3 lines to FIX-CI.md. Stop.
