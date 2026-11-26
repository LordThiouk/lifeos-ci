# fr-fullrun: survive the timeout, block next step on failure, choose the model

Run 45628583677 (rider-multistop): the vera opencode step hit timeout_minutes (90) and was cancelled; the partial-work commit/push step was skipped (it uses !cancelled()), so all work was lost. Then serena started anyway although vera failed. The loop relaunch hit HTTP 500 on dispatch and gave up.
Forbidden: push, `gh` write commands, printing secrets, touching main. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. In the opencode step(s) of fr-fullrun.yml / _agent-run.yml: wrap opencode in `timeout <timeout_minutes - 5>m` (inner timeout shorter than the step's timeout-minutes) so the job is not cancelled and the partial-work commit + push step still runs.
2. A step (serena, forge, ...) must not start when the previous one failed or produced no commit; mark the run failed instead.
3. Loop relaunch dispatch: retry the dispatch up to 3 times with a 30 s wait on HTTP 5xx.
4. Add an optional `model` input to fr-fullrun.yml (default = current behaviour) passed to opencode, so a run can start directly on e.g. mimo-v2.6-flash-free.
5. actionlint must pass. Commit "fix(ci): survive timeout, gate next step, model input". Add 4 lines to FIX-CI.md. Stop.
