# Write the general pipeline workflow (lifeos-ci). Short run. Commit as soon as the file is written.

Forbidden: push, `gh`, running tests, editing anything other than `.github/workflows/pipeline.yml`. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. Read `.github/workflows/task.yml` and see how it calls `_agent-run.yml` (`uses:` + `with:` + `secrets: inherit`).
2. Create `.github/workflows/pipeline.yml`:
   - `name: Pipeline (lifeos-ci)`, `on: workflow_dispatch` with the inputs `target_repo` (same choice list as task.yml), `steps` (a JSON string: an array of objects `{job_name, branch, prompt_path, timeout_minutes}`), and `extra_repos` (string, default "").
   - A `run` job: `strategy: { max-parallel: 1, fail-fast: true, matrix: { step: ${{ fromJSON(inputs.steps) }} } }`, which calls `_agent-run.yml` exactly like task.yml, using `matrix.step.*` for job_name/branch/prompt_path/timeout_minutes.
   - So the steps run one after the other in the given order, and it stops at the first failure.
   - Concurrency: `group: pipeline-${{ github.run_id }}`, `cancel-in-progress: false`.
3. Check the YAML with `python3 -c "import yaml;yaml.safe_load(open('.github/workflows/pipeline.yml'))"`, commit it with the message "feat: pipeline enchaîné", then stop.
