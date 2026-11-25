# One task only: make the run read TARGET_AGENT, STOP_AFTER_STEP, CHAIN_PHASE. Commit RIGHT AWAY.

Forbidden: push, `gh`. Edit at most 2 files. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

1. `rg -n "OC_AGENT|stop-after-step|--agent|unit " .github opencode scripts` to find where `_agent-run.yml` launches opencode/the FullRun.
2. At that place: if `TARGET_AGENT` is not empty, pass `--agent "$TARGET_AGENT"`; if `STOP_AFTER_STEP` is not empty, pass `--stop-after-step "$STOP_AFTER_STEP"`; export `CHAIN_PHASE` to the run. Empty = behaviour unchanged.
3. Run the existing shell tests (`rg --files | rg -i 'test.*\.sh$'`, then run them with bash). Commit with the message "feat(agent-run): câble target_agent, stop_after_step, chain_phase". Stop.
