#!/usr/bin/env bash
# Coupe opencode si le journal n'écrit plus pendant N secondes (garde-fou mini FullRun).
# Usage :
#   silence-watch.sh --log FILE --pid-file FILE --flag FILE \
#     [--sec N] [--poll N] [--grace N] [--live-log FILE]
#
# - Attend que --pid-file existe (processus opencode/timeout).
# - Après --grace secondes, surveille la taille de --log.
# - Si aucune croissance pendant --sec secondes : tue le processus (et ses enfants),
#   pose --flag, écrit un message sur --live-log / stdout, exit 0.
# - Si le processus disparaît avant silence : exit 0 sans flag.
set -euo pipefail

log=""
pid_file=""
flag=""
live_log=""
sec=180
poll=15
grace=30

while [ $# -gt 0 ]; do
  case "$1" in
    --log) log="${2-}"; shift 2 ;;
    --pid-file) pid_file="${2-}"; shift 2 ;;
    --flag) flag="${2-}"; shift 2 ;;
    --live-log) live_log="${2-}"; shift 2 ;;
    --sec) sec="${2-}"; shift 2 ;;
    --poll) poll="${2-}"; shift 2 ;;
    --grace) grace="${2-}"; shift 2 ;;
    -h|--help)
      sed -n '2,12p' "$0"
      exit 0
      ;;
    *)
      echo "silence-watch: option inconnue : $1" >&2
      exit 2
      ;;
  esac
done

[[ -n "$log" && -n "$pid_file" && -n "$flag" ]] \
  || { echo "silence-watch: --log, --pid-file et --flag requis" >&2; exit 2; }
[[ "$sec" =~ ^[0-9]+$ && "$sec" -ge 5 ]] \
  || { echo "silence-watch: --sec invalide (min 5)" >&2; exit 2; }
[[ "$poll" =~ ^[0-9]+$ && "$poll" -ge 1 ]] \
  || { echo "silence-watch: --poll invalide" >&2; exit 2; }
[[ "$grace" =~ ^[0-9]+$ ]] \
  || { echo "silence-watch: --grace invalide" >&2; exit 2; }

rm -f "$flag"

# Attendre le PID (démarrage opencode), sans dépasser grace + marge.
wait_deadline=$(( $(date +%s) + grace + 60 ))
pid=""
while [ -z "$pid" ]; do
  if [ -f "$pid_file" ]; then
    raw=$(tr -d ' \t\r\n' < "$pid_file" 2>/dev/null || true)
    if [[ "$raw" =~ ^[0-9]+$ ]] && kill -0 "$raw" 2>/dev/null; then
      pid="$raw"
      break
    fi
  fi
  [ "$(date +%s)" -lt "$wait_deadline" ] || exit 0
  sleep 1
done

# Grâce initiale : laisser le banner / premier token arriver.
sleep "$grace"
kill -0 "$pid" 2>/dev/null || exit 0

size_of() {
  local f="$1" s
  s=$(wc -c < "$f" 2>/dev/null | tr -d ' \t' || echo 0)
  [[ "$s" =~ ^[0-9]+$ ]] || s=0
  printf '%s\n' "$s"
}

last=$(size_of "$log")
stagnant_since=$(date +%s)

while kill -0 "$pid" 2>/dev/null; do
  sleep "$poll"
  kill -0 "$pid" 2>/dev/null || exit 0
  now=$(date +%s)
  cur=$(size_of "$log")
  if [ "$cur" -gt "$last" ]; then
    last="$cur"
    stagnant_since="$now"
    continue
  fi
  idle=$(( now - stagnant_since ))
  if [ "$idle" -lt "$sec" ]; then
    continue
  fi

  msg="Silence ${sec}s sans nouvelle sortie (journal=${cur} o) : coupure opencode pid=$pid"
  printf '%s\n' "$msg"
  if [ -n "$live_log" ]; then
    printf '%s\n' "$msg" >> "$live_log" || true
  fi
  : > "$flag"

  # Couper timeout + enfants, puis filet opencode run.
  pkill -TERM -P "$pid" 2>/dev/null || true
  kill -TERM "$pid" 2>/dev/null || true
  sleep 2
  pkill -KILL -P "$pid" 2>/dev/null || true
  kill -KILL "$pid" 2>/dev/null || true
  pkill -KILL -f '(^|[ /])opencode run ' 2>/dev/null || true
  exit 0
done

exit 0
