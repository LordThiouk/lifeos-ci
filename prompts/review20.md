# Review PR #20 (branch fix/extra-repos-full vs main) before merge. Read-only, one report. Commit right away.

Forbidden: push, editing anything except REVIEW-PR20.md, `gh` write commands, printing secrets. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. `git diff --stat origin/main...HEAD` and read every changed workflow/script. Check: extra_repos full clone with no token left in .git/config; guard compares remote refs; HF_TOKEN only for antenly/antenly-ci; ffmpeg step; acr-senegal extra-only; FullRun loop uses `contains(needs.*.result,'failure')`; actionlint/yaml OK.
2. List risks (secret exposure, push rights, broken inputs) with file:line. Propose fixes only.
3. Write REVIEW-PR20.md (40 lines max) ending with "MERGE OK" or "MERGE NON + raisons". Note the prompts/ files that should not go to main. Commit "review: PR #20". Stop.
