#!/usr/bin/env bash
# Vérifie que FullRunPreflight est branché dans _agent-run.yml AVANT ffmpeg/livelog/opencode.
#   opencode/tests/agent-run-preflight-test.sh
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

pre = next(s for s in steps if s.get("id") == "preflight")
i_pre = steps.index(pre)
i_socle = idx("Préparer le socle ISA")
i_ffmpeg = idx("Installer ffmpeg")
i_live = idx("Journal en direct")
i_oc = idx("Exécuter opencode")

assert i_socle < i_pre < i_ffmpeg < i_live < i_oc, \
    "préflight doit être après socle ISA et avant ffmpeg/livelog/opencode"

run = pre.get("run", "")
for needle in (
    "FullRunPreflight.ts",
    "--isa",
    "--start-step",
    "préflight code",
    "PRÉFLIGHT NON ÉVALUÉ",
):
    assert needle in run, "préflight incomplet : %r absent" % needle

assert "secrets." not in str(pre).lower(), "préflight ne doit pas recevoir de secret"
assert "GITHUB_ENV" not in run, "préflight ne doit pas écrire GITHUB_ENV"

cond = str(pre.get("if", ""))
assert "IN_ISA" in cond, "condition préflight sans IN_ISA"

print("OK   préflight branché avant ffmpeg/livelog/opencode, lecture seule")
PY

echo "PASS agent-run-preflight : FullRunPreflight branché dans _agent-run.yml"
