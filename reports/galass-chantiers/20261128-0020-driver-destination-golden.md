# Driver Destination comme golden + Artemis relance — 00:20 Africa/Dakar

## Diagnostic 460821
| | |
|---|---|
| Symptom | `driver-stop2-done` FAIL — marqueur `+Destination` absent du dump |
| Goldens | Destination visible (sheet pinned **560px** ≈ 0.66 sur 844) |
| Cause | `_settleSheetAfterLoad` forçait **0.4** → nœud Destination coupé sous CTA sticky |

## Fix Driver
| | |
|---|---|
| branche | `cursor/driver-destination-golden-e410` @ `1e11deb` |
| PR | https://github.com/LordThiouk/Galass_Driver/pull/14 |
| base | `feat/multistop-e2e-2026-11-15` |
| change | multistop sheet extent **0.7** (snap golden) ; legacy 0.4 inchangé |
| tests | unit itinerary 3/3 PASS (Flutter **3.44.8**) ; pas de regen golden |
| Aikido | non scanné (auth MCP invalide) |

## Artemis relance
| | |
|---|---|
| run | [46087396223](https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46087396223) |
| harnais | `cursor/artemis-f427-pusher-e410` @ `6f8dba0` |
| rider_ref | `cursor/rider-active-poll-e410` (#29) |
| driver_ref | `cursor/driver-destination-golden-e410` |

Rien d’irréversible. Device / Verify bloqués tant que ≠ 30/30. Merge #14 / #29 uniquement après OK Papa.
