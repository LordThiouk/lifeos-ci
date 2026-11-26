# shellcheck shell=bash
# Isolateur multi-runner (jusqu'à 3 sur la même VM us-box).
# Chaque Runner.Listener a un RUNNER_NAME distinct → chemins /opt disjoints.
# Usage : . chemin/runner-slot.sh   (idempotent ; surexporte STATE_DIR/TOOLS_DIR/…)
# Ne dépend d'aucun fichier agent-writable : uniquement RUNNER_NAME (env Actions).
# Charset : alnum + _- uniquement (pas de '.' → pas de '..' path traversal).
# Sourcé (pas exécuté) : pas de shebang volontaire.
_slot=$(printf '%s' "${RUNNER_NAME:-runner}" | tr -c 'A-Za-z0-9_-' '_' | cut -c1-64)
[ -n "$_slot" ] || _slot=runner
export RUNNER_SLOT="$_slot"
export STATE_DIR="/opt/lifeos-ci-state/${RUNNER_SLOT}"
export TOOLS_DIR="/opt/lifeos-ci-tools/${RUNNER_SLOT}"
export FULLRUN_TOOLS="/opt/fullrun-tools/${RUNNER_SLOT}"
export FULLRUN_LIVE="/opt/fullrun-live/${RUNNER_SLOT}"
export FULLRUN_WIP="/opt/fullrun-wip/${RUNNER_SLOT}"
unset _slot
