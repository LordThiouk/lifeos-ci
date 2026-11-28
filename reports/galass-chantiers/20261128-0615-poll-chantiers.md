# Poll — 2026-11-28 06:15 Africa/Dakar

| Chantier | run | état | live | action |
|---|---|---|---|---|
| sot-driver-ms-isatool | 46115153120 | **PASS** | livelog 180 Ko ; tip `a8264c9` | SoT Driver MS OK |
| sot-serena-rider/backend/emu | 46115436295… | **FAIL PF64** | `start_step=plan` invalide | relance **sans** `isa_path` |
| sot-serena-*-ms2 | (dispatch 06:15) | new | anti-PF64 | attendre poller 300s |
| forge Rider/backend/emu | …825/692/682 | FAIL PF2 | pas de carry | après Serena PASS |
| En vol autres | — | — | file S+E3 | — |

Cause PF64 : `_agent-run` mappe `start_step←chain_phase` ; Serena a `plan` ∉ {build,verify,close}.  
Cause PF2 : forge sans carry sur ISA non-`complete` (Driver OK car phase complete).
