# Fix the failing CI scripts in lifeos-ci. Short, commit after each fix.

Forbidden: push, `gh` write commands except `gh run list`/`gh run view --log-failed` (read), touching main directly. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. List failed runs of the last 2 days in LordThiouk/lifeos-ci (`gh run list -s failure -L 30`), read `--log-failed` for each distinct failure. Ignore failures caused only by model quota.
2. Known bug: in .github/workflows/fr-fullrun.yml around line 303, a failing build brick makes downstream steps "skipped" instead of "failure", so the retry loop never triggers. Fix it.
3. Known bug: the guard fails a job when the agent checks out another branch in an extra repo (read-only). Make the guard compare the extra repos' remote refs (no push happened), not the local HEAD.
4. Fix each other real script failure found. Validate YAML of every changed workflow. Write FIX-CI.md (30 lines max): failure, cause file:line, fix, commit. Commit "fix(ci): scripts en échec". Stop.
