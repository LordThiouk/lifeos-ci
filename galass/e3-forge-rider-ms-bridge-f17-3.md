# Forge Rider MS — Bridge-F17-3 SEUL (séquence Papa 19:05)

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Carry tip attendu : `chore(fullrun): carry signé` (wip OFF). **Un seul scope** : **Bridge-F17-3**.

## Scope

Resync Rider quand `stops` est vide : un `stop_completed` / `STOP_COMPLETED` reçu avec liste vide déclenche le resync autorité (getRideDetails one-shot), marqueur client `stop_completed` visible dans les logs. **Aucune émission backend** `STOP_COMPLETED` (contrat Backend E3).

## Preuve

- Flutter **3.44.8**
- `flutter test` unit ciblé (progression / spy repo)
- ISATool Decisions + tick si ISC Bridge-F17-3 / F4-18 lié est le critère coché

## Anti-claims

- Ne pas toucher F4-24, F4-32/33, F4-23, arrêt UI bandeaux.
- **Aucun** `--update-goldens`. Pas merge `main`. Pas Artemis.

## STOP

Commit code (+ ISA si coche). **STOP**. Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
