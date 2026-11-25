# Give agent jobs HF_TOKEN and ffmpeg. Short, commit right away.

Forbidden: push, `gh` write commands, printing any secret. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
1. In `.github/workflows/_agent-run.yml`: HF_TOKEN is declared as a secret (around line 65) but never exported to the agent step. Export it as env `HF_TOKEN` (and `HUGGING_FACE_HUB_TOKEN`) in the step that runs opencode ONLY when target_repo is `antenly` or `antenly-ci` (e.g. `${{ (inputs.target_repo == 'antenly' || inputs.target_repo == 'antenly-ci') && secrets.HF_TOKEN || '' }}`). Galass and every other target must NOT get it. Check that task.yml, pipeline.yml and fr-fullrun.yml pass HF_TOKEN to _agent-run (secrets: inherit or explicit); fix them if not.
2. Add a step before the agent runs that installs ffmpeg (`sudo apt-get update -qq && sudo apt-get install -y -qq ffmpeg`) and prints `ffmpeg -version | head -1`.
3. Validate YAML of every changed file. Commit "ci: HF_TOKEN et ffmpeg pour les agents" with file:line in the body. Stop.
