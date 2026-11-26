#!/usr/bin/env bash
# Vérifie le garde-fou silence → bascule dans _agent-run.yml (mini FullRun).
#   opencode/tests/agent-run-silence-test.sh
set -euo pipefail
here=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=opencode/tests/lib.sh
. "$here/tests/lib.sh"

wf="$here/../.github/workflows/_agent-run.yml"
[ -f "$wf" ] || ko "workflow introuvable : $wf"
[ -x "$here/silence-watch.sh" ] || ko "silence-watch.sh manquant"

python3 - "$wf" <<'PY' || exit 1
import sys
import yaml

y = yaml.safe_load(open(sys.argv[1]))
steps = y["jobs"]["run"]["steps"]
oc = next(s for s in steps if "Exécuter opencode" in s.get("name", ""))
run = oc.get("run", "")

for needle in (
    'silence-watch.sh',
    'OC_SILENCE_SEC:-180',
    'silence.flag',
    'Silence ${SILENCE_SEC}s sans sortie',
    'bascule vers le modèle suivant',
    'echo $$ > "$1"',
):
    assert needle in run, "garde-fou silence incomplet : %r absent" % needle

# La bascule silence doit précéder le traitement quota (sinon on brûle le plafond).
i_silence = run.index("silence.flag")
i_quota = run.index('quota.sh" next')
assert i_silence < i_quota, "contrôle silence doit précéder quota.sh next"

print("OK   silence-watch branché avant quota dans Exécuter opencode")
PY

# models.txt : au moins un secours après deepseek + mimo
models="$here/../models.txt"
[ -f "$models" ] || ko "models.txt manquant"
python3 - "$models" <<'PY' || exit 1
import sys
lines = []
for raw in open(sys.argv[1]):
    s = raw.strip()
    if not s or s.startswith("#"):
        continue
    lines.append(s)
assert len(lines) >= 3, "models.txt doit lister au moins 3 modèles (secours)"
assert lines[0].startswith("opencode/") and lines[0].endswith("-free")
assert "iceman" in " ".join(lines) or "nemotron" in " ".join(lines) or "beam" in " ".join(lines), \
    "aucun secours (iceman/nemotron/beam) dans models.txt"
print("OK   models.txt a des secours après les free saturables")
PY

echo "PASS agent-run-silence : garde-fou silence + secours models.txt"
