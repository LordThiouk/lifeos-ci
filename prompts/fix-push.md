# Fix the push and notification of _agent-run.yml (lifeos-ci). Short run. Commit right away.

Forbidden: push, `gh`, running tests, editing anything other than `.github/workflows/_agent-run.yml` and `notify.sh` (wherever it lives). Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. In `_agent-run.yml`, in the "push fast-forward et PR brouillon" step: just before the push, run `git fetch origin <branch>` then `git rebase origin/<branch>` (if the rebase fails: `git rebase --abort` and exit 1 with a clear message). Also, set the concurrency group to `agent-${{ inputs.target_repo }}-${{ inputs.branch }}` (cancel-in-progress: false).
2. Send the notification (notify.sh) at the very end of the job with `if: always()` and the job's final status (`job.status`), not opencode's status alone. Keep the opencode status as a separate field.
3. Check the YAML with python3 yaml.safe_load, commit with the message "fix: push rebase + statut final notify", then stop.
