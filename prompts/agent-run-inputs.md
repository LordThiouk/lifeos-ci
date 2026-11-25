# One task only: 3 inputs in `.github/workflows/_agent-run.yml`. Commit RIGHT AWAY.

Forbidden: push, `gh`, reading other files. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. In `.github/workflows/_agent-run.yml`, under `on.workflow_call.inputs` (and `on.workflow_dispatch.inputs` if it exists), add:
```yaml
      stop_after_step: {type: string, required: false, default: ""}
      target_agent: {type: string, required: false, default: ""}
      chain_phase: {type: string, required: false, default: ""}
```
2. In the job's top-level `env:` block, add:
```yaml
  STOP_AFTER_STEP: ${{ inputs.stop_after_step }}
  TARGET_AGENT: ${{ inputs.target_agent }}
  CHAIN_PHASE: ${{ inputs.chain_phase }}
```
3. Check the YAML with `python3 -c "import yaml;yaml.safe_load(open('.github/workflows/_agent-run.yml'))"`, then commit everything with the message "feat(agent-run): stop_after_step, target_agent, chain_phase". Stop.
