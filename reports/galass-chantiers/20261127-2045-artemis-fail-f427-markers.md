# Artemis 46060617800 FAIL — 2026-11-27 20:44 Africa/Dakar

**Verdict harness : FAIL (15/30 PASS).**

## Cause principale (alignée F4-27 Papa)
Plusieurs points rider cherchent encore les **bandeaux retirés** :
- `+En route vers` (currentLegBanner)
- `+1/2 arrêts terminés` / `+2/2 arrêts` (stopsProgressText)

Ex. `rider-running-start`, `rider-stop1-active`, `rider-stop1-done`, `rider-stop2-done`.

Avec F4-27 = liste « Arrêt N » sans bandeau, ces marqueurs **doivent** être mis à jour dans `galass-emu-actions-pub` avant relance.

## Autres
- `ride-composed` FAIL (api fallback: compose) ; ride_exists PASS (ride 325).
- Driver côtés offre/accept souvent PASS ; cash driver PASS.
- B7/B2 WARN non concluants (ride_source=api).

## Action
- **Ne pas** relancer Artemis à l’identique.
- Maj markers → « Arrêt N » / design main, puis nouveau run.

Preuve : `preuves/artemis/46060617800-summary.md`
