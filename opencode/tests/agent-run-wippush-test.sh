#!/usr/bin/env bash
# Vérifie wippush + OOM + progress branchés dans _agent-run.yml (mini FullRun).
#   opencode/tests/agent-run-wippush-test.sh
set -euo pipefail
here=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=opencode/tests/lib.sh
. "$here/tests/lib.sh"

wf="$here/../.github/workflows/_agent-run.yml"
[ -f "$wf" ] || ko "workflow introuvable : $wf"

python3 - "$wf" <<'PY' || exit 1
import sys
import yaml

y = yaml.safe_load(open(sys.argv[1]))
steps = y["jobs"]["run"]["steps"]
names = [s.get("name", "") for s in steps]

def idx(needle):
    for i, n in enumerate(names):
        if needle in n:
            return i
    raise AssertionError("step introuvable : %s" % needle)

i_live = idx("Journal en direct")
i_wip = idx("Push périodique des wip")
i_oom = idx("Protection mémoire")
i_oc = idx("Exécuter opencode")
assert i_live < i_wip < i_oom < i_oc, "wippush/OOM doivent être entre livelog et opencode"

wip = steps[i_wip]
assert wip.get("id") == "wip", "l'étape wippush doit exposer id=wip"
assert wip.get("continue-on-error") is True, "l'échec wippush ne doit jamais arrêter le run"
env = wip.get("env", {})
assert "CI_TOKEN" in str(env.get("PUSH_TOKEN")), "wippush doit utiliser CI_TOKEN"

run = wip.get("run", "")
for needle in (
    'setsid -f nice -n 0 "$T/wippush.sh" daemon',
    "WIP_TOKEN_STDIN=1",
    'WIP_REPO="$GITHUB_WORKSPACE/target"',
    'TARGET_REPO="$TARGET_REPO"',
    "WIP_AUTOSAVE_DENY=",
    "IN_WIP_PUSH_MIN=15",
    "STATE_DIR/bases",
    "sudo -n env -i",
):
    assert needle in run, "démon wippush incomplet : %r absent" % needle

oom = steps[i_oom].get("run", "")
assert "oom_score_adj" in oom, "protection OOM absente"
assert "/opt/fullrun-wip/pid" in oom, "OOM ne protège pas wippush"
assert "/opt/fullrun-live/pid" in oom, "OOM ne protège pas livelog"

oc = steps[i_oc].get("run", "")
for needle in (
    "/opt/fullrun-tools/progress.sh start",
    "/opt/fullrun-tools/progress.sh loop",
    "progress.sh once fin",
    "OC_PROGRESS_INTERVAL=120",
):
    assert needle in oc, "progress.sh non branché pendant opencode : %r" % needle

print("OK   wippush + OOM + progress branchés avant/pendant opencode")
PY

echo "PASS agent-run-wippush : démons wip/OOM/progress branchés dans _agent-run.yml"
