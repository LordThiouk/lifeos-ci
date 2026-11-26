# Fix: extra_repos must be readable on ALL branches (private Galass repos). Short task, commit right away.

Forbidden: push, `gh` write commands, touching anything outside `.github/workflows/`. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

Problem: in jobs launched by pipeline.yml / task.yml, the repos passed in `extra_repos` (e.g. Galass_Rider, Galass_Driver, Galass_backend) are cloned with only `main`, shallow. Inside the agent, `git fetch` of other branches fails (auth), `gh` is refused and the API returns 404. The agent cannot read the real work on non-main branches.
1. In `.github/workflows/_agent-run.yml` (and any workflow it calls that clones extra_repos), find where extra_repos are cloned and with which token.
2. Make every extra repo a full clone with all remote branches (`fetch-depth: 0` or `git fetch --unshallow` + `+refs/heads/*:refs/remotes/origin/*`), using the same token that already clones them, and keep read credentials available in that clone so a later `git fetch` inside the agent works. Do not print the token. Don't give it push rights beyond what already exists.
3. Optional input `extra_ref` is NOT needed; the agent will check out branches itself.
4. Check YAML syntax (`python3 -c "import yaml,sys;yaml.safe_load(open(sys.argv[1]))" <file>`). Commit "fix(ci): extra_repos clonés en entier, toutes branches lisibles". Write in the commit body the file:line changed. Stop.
