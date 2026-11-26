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
    'oc-wrap.sh',
    'OPENCODE_HTTPS_PROXY',
    'proxy_env',
    'Quota atteint sur $m : bascule vers le modèle suivant',
):
    assert needle in run, "garde-fou silence/proxy/chaîne incomplet : %r absent" % needle
assert 'bash -c' not in run or 'oc-wrap.sh' in run

# Plus de limite à une seule bascule quota/erreur.
assert "bascule unique vers le modèle suivant" not in run, \
    "bascule encore limitée à un seul modèle suivant"

# La bascule silence doit précéder le traitement quota (sinon on brûle le plafond).
i_silence = run.index("silence.flag")
i_quota = run.index('quota.sh" next')
assert i_silence < i_quota, "contrôle silence doit précéder quota.sh next"

print("OK   silence-watch + proxy + chaîne models branchés dans Exécuter opencode")
PY

# models.txt : catalogue free complet (probe 2026-11-26)
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
need = {
    "opencode/deepseek-v4.1-flash-free",
    "opencode/mimo-v2.6-flash-free",
    "opencode/iceman-free",
    "opencode/flint-40b-free",
    "opencode/beam-free",
    "opencode/hy4-flash-free",
    "opencode/nemotron-3.5-lightning-free",
    "opencode/nemotron-3.5-super-vl-free",
    "opencode/seaglass-alpha-free",
    "opencode/big-pickle",
}
missing = sorted(need - set(lines))
assert not missing, "models.txt incomplet : %s" % missing
assert len(lines) >= 10, "models.txt trop court (%d)" % len(lines)
print("OK   models.txt catalogue free (%d modèles)" % len(lines))
PY

echo "PASS agent-run-silence : garde-fou silence + catalogue free + proxy"
