#!/usr/bin/env bash
# Isolation multi-runner : RUNNER_NAME → slots /opt disjoints (jusqu'à 3).
#   opencode/tests/runner-slot-test.sh
set -euo pipefail
here=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
# shellcheck source=opencode/tests/lib.sh
. "$here/tests/lib.sh"

slot="$here/runner-slot.sh"
[ -f "$slot" ] || ko "runner-slot.sh introuvable"

# shellcheck disable=SC1090
(
  RUNNER_NAME='us-box-cursor'
  # shellcheck source=opencode/runner-slot.sh
  . "$slot"
  [ "$RUNNER_SLOT" = "us-box-cursor" ] || ko "slot us-box-cursor"
  [ "$STATE_DIR" = "/opt/lifeos-ci-state/us-box-cursor" ] || ko "STATE_DIR"
  [ "$TOOLS_DIR" = "/opt/lifeos-ci-tools/us-box-cursor" ] || ko "TOOLS_DIR"
  [ "$FULLRUN_TOOLS" = "/opt/fullrun-tools/us-box-cursor" ] || ko "FULLRUN_TOOLS"
  [ "$FULLRUN_LIVE" = "/opt/fullrun-live/us-box-cursor" ] || ko "FULLRUN_LIVE"
  [ "$FULLRUN_WIP" = "/opt/fullrun-wip/us-box-cursor" ] || ko "FULLRUN_WIP"
)
ok "slot us-box-cursor"

(
  RUNNER_NAME='us-box-cursor-2'
  # shellcheck source=opencode/runner-slot.sh
  . "$slot"
  [ "$STATE_DIR" = "/opt/lifeos-ci-state/us-box-cursor-2" ] || ko "STATE_DIR-2"
  RUNNER_NAME='us-box-cursor-3'
  . "$slot"
  [ "$STATE_DIR" = "/opt/lifeos-ci-state/us-box-cursor-3" ] || ko "STATE_DIR-3"
  [ "$FULLRUN_WIP" = "/opt/fullrun-wip/us-box-cursor-3" ] || ko "WIP-3"
)
ok "slots -2 et -3 disjoints"

(
  RUNNER_NAME='evil/../name;rm'
  # shellcheck source=opencode/runner-slot.sh
  . "$slot"
  case "$RUNNER_SLOT" in
    *'/'*|*'.'*|*';'*) ko "caractères dangereux dans RUNNER_SLOT=[$RUNNER_SLOT]" ;;
  esac
  [ "$STATE_DIR" = "/opt/lifeos-ci-state/$RUNNER_SLOT" ] || ko "STATE_DIR sanitize"
)
ok "sanitisation RUNNER_NAME"

# Deux runners → chemins distincts (pas de collision).
a=$(RUNNER_NAME=us-box-cursor bash -c '. "'"$slot"'"; printf %s "$STATE_DIR|$TOOLS_DIR|$FULLRUN_LIVE"')
b=$(RUNNER_NAME=us-box-cursor-2 bash -c '. "'"$slot"'"; printf %s "$STATE_DIR|$TOOLS_DIR|$FULLRUN_LIVE"')
[ "$a" != "$b" ] || ko "deux runners partagent encore les mêmes chemins"
ok "pas de collision entre us-box-cursor et us-box-cursor-2"

echo "PASS runner-slot : isolation jusqu'à 3 runners"
