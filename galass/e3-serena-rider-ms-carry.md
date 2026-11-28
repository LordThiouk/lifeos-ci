# E3 Serena — Rider MS carry build (anti-PF2)

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

**But :** produire le **carry signé** FullRun (étapes 1–3, `start_step=build`) pour débloquer `completeness_pre` avant Forge E3. Modèle : `galass/lot-w4-serena-driver.md`.

## Périmètre plan uniquement

- F4-21 / F4-23 / F4-24 / F4-28 / F4-29
- F4-32 / F4-33 (régression map) + absorb logique #30 après fix
- **Bridge-F17-3** — resync Rider quand `stops` est vide ; marqueur client `stop_completed` visible dans les logs (pas d’émission backend)

## Anti-claims (sans case)

- Hors scope Artemis / Verify×3 / Max / merge main / regen goldens / lot caméra.
- Ne pas modifier l’émission backend `STOP_COMPLETED` (contrat test = Backend E3).

## Règles

Ne pas coder. **Ne pas cocher.** ISATool append Decisions + **exportCarry** signé étapes 1–3 (`scope_fp` / `progress_fp` / `criteriaIds` au tip). Commit `chore(fullrun): carry signé — étapes 1-3 pass, start_step=build (Rider MS E3)` auteur `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. Push. **STOP**. Pas d’autre commit après.
