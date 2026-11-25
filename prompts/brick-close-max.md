# One task only: create `.github/workflows/fr-close-max.yml`. Commit RIGHT AWAY.

Forbidden: push, `gh`, editing any other file. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. Copy `.github/workflows/fr-plan-vera.yml` to `.github/workflows/fr-close-max.yml`, then change only:
   - `name:` to "FullRun close-max (lifeos-ci)", and `run-name:` with "close-max" instead of "Vera";
   - the `timeout_minutes` input default to "10";
   - job `vera` renamed to `run` (and `needs: run`, `needs.run.outputs.*` in `next`);
   - in both jobs: `agent: max`;
   - in the `run` job's `with:`, add `target_agent: Max`, `stop_after_step: "6"`, `chain_phase: close`.
   - add a `workflow_call:` trigger with the same inputs (the `choice` type becomes `string`), plus the input `chain: {type: boolean, required: false, default: true}` in both triggers;
   - in the `next` job: `if: inputs.chain && needs.run.outputs.status == 'ok'`.
2. Check the YAML with `python3 -c "import yaml;yaml.safe_load(open('.github/workflows/fr-close-max.yml'))"`, then commit with the message "feat(fr): brique fr-close-max". Stop.
