#!/usr/bin/env bash
# Vérifie le branchement du journal en direct (livelog.sh) dans _agent-run.yml :
# démon root avant opencode, cible = TARGET_REPO du run (jamais antenly en dur),
# jeton sur stdin, outils figés dans /opt/fullrun-tools, et journal stable que
# le démon peut lire pendant qu'opencode écrit.
#   opencode/tests/agent-run-livelog-test.sh
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

i_gitleaks = idx("Installer opencode et gitleaks")
i_live = idx("Journal en direct")
i_oc = idx("Exécuter opencode")
assert i_gitleaks < i_live < i_oc, "le démon livelog doit être après gitleaks et avant opencode"

live = steps[i_live]
assert live.get("id") == "live", "l'étape livelog doit exposer id=live"
assert live.get("continue-on-error") is True, "l'échec du livelog ne doit jamais arrêter le run"
env = live.get("env", {})
assert str(env.get("OC_LOG")) == "${{ runner.temp }}/oc/opencode.log", \
    "OC_LOG doit être le journal stable partagé avec opencode"
assert "CI_TOKEN" in str(env.get("PUSH_TOKEN")), "le jeton doit venir d'un secret, pas d'un input"

run = live.get("run", "")
for needle in (
    'setsid -f nice -n 0 "$T/livelog.sh" daemon',
    "LIVE_TOKEN_STDIN=1",
    'TARGET_REPO="$TARGET_REPO"',
    'LIVE_LOG="$OC_LOG"',
    'LIVE_READ_UID="$(id -u)"',
    "sudo -n env -i",
    "LIVE_FIRST=30",
    "LIVE_INTERVAL=120",
):
    assert needle in run, "démon livelog incomplet : %r absent" % needle
assert "antenly" not in run.lower(), "livelog ne doit pas cibler antenly en dur"
assert "TARGET_REPO" in run, "livelog ne cible pas le dépôt cible du run"

freeze = steps[idx("Outils de confiance figés")].get("run", "")
for tool in (
    "livelog.sh", "leaklog.sh", "redact-log.sh", "allowed-repos.sh", "log-recipient.txt",
    "wippush.sh", "autosave.sh", "progress.sh", "checkpoint.sh", "done_check.sh",
    "emu-e2e.sh", "bench-capped", "autosave-deny.txt",
):
    assert tool in freeze, "outil livelog non figé dans FULLRUN_TOOLS : %r" % tool
assert 'FULLRUN_TOOLS="/opt/fullrun-tools/$RUNNER_SLOT"' in freeze, \
    "FULLRUN_TOOLS non isolé par RUNNER_SLOT"
assert 'FT="$FULLRUN_TOOLS"' in freeze, "gel n'utilise pas FULLRUN_TOOLS"

oc = steps[i_oc].get("run", "")
assert 'live_log="$RUNNER_TEMP/oc/opencode.log"' in oc, \
    "opencode n'écrit pas le journal stable lu par livelog"
assert 'tee -a "$live_log"' in oc, \
    "opencode ne duplique pas sa sortie vers le journal du livelog"

print("OK   livelog branché avant opencode, cible TARGET_REPO, outils figés et journal stable")
PY

echo "PASS agent-run-livelog : démon root branché dans _agent-run.yml"
