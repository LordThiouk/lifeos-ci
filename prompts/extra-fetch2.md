# Follow-up fix on this branch: do not leave CI_TOKEN in extra clones. Short task, commit right away.

Forbidden: push, `gh` write commands, touching anything outside `.github/workflows/_agent-run.yml`. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

The last commit (904f550) writes an auth extraheader with CI_TOKEN into each extra clone's .git/config, so the agent could read it and push. Change it so:
1. The full fetch of all branches (`+refs/heads/*:refs/remotes/origin/*`, no depth) happens in the workflow step, with the token passed only for that command (e.g. `git -c http.extraheader=... fetch`), never written to .git/config.
2. After the fetch, nothing token-related remains in the extra clones (`git config --get-all http.https://github.com/.extraheader` empty). Add a check line that fails the step if it remains.
3. Validate YAML (`python3 -c "import yaml,sys;yaml.safe_load(open(sys.argv[1]))" .github/workflows/_agent-run.yml`). Commit "fix(ci): pas de jeton laissé dans les clones extra" with the file:line in the body. Stop.
