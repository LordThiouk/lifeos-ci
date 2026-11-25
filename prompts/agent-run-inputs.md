# Add 3 inputs to `.github/workflows/_agent-run.yml` (short run, commit after each step)

Forbidden: `git push`, `gh`. Only edit `.github/workflows/_agent-run.yml` and its existing tests, if any. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
Reference: `PLAN-AGENTS.md` on the `plan/agents-2026-11-25` branch (`git show origin/plan/agents-2026-11-25:PLAN-AGENTS.md`).

1. Add these optional `workflow_call` + `workflow_dispatch` inputs, as strings with an empty default:
   - `stop_after_step`: FullRun step after which the link stops (0–8);
   - `target_agent`: a single agent for this job (e.g. Algorithm, Architect, Engineer, Forge, Anvil, Designer, code-reviewer, Silas, Max);
   - `chain_phase`: plan|build|verify|close.
   Pass them through to the run (env or unit arguments such as `--stop-after-step` and `--agent` if they exist; otherwise as env vars `STOP_AFTER_STEP`, `TARGET_AGENT`, `CHAIN_PHASE`). Empty means the current behaviour is unchanged.
   Commit.
2. Check: `actionlint` if available, otherwise `python3 -c "import yaml;yaml.safe_load(open('.github/workflows/_agent-run.yml'))"`. Run the repo's existing tests (`bash` scripts under `tests/` or `opencode/*test*`). Commit any fix.
3. Write the result in `RESULT-agent-run-inputs.md` (what changed, test output). Commit.
