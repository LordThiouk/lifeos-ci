# E3 Forge — Rider MS F4-* + Bridge-F17-3

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

**Prérequis :** carry tip frais 1–3 pass. Aucun commit entre carry et ce build.

Flutter **3.44.8**, aucun golden regen, pas de `flutter build`, pas `.fullrun`.
Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Scope

1. **F4-29** fixture `vehicleData` complète → 8/8 ; test nommé.
2. **F4-23** destination finale ; **F4-24** régression état neuf ; **F4-21** si preuve.
3. **F4-28 SOS** test widget.
4. **F4-32/33** fix carte jambe courante ; porter logique #30 après fix ; frise Papa intacte.
5. **Bridge-F17-3** — resync quand `stops` est vide ; marqueur client **`stop_completed`** visible dans les logs (pas toucher émission backend).
6. RUNNING refresh ; notes UI_END (vrai tap) sans lancer Artemis.
7. ISATool ticks avec `flutter test` nommés. Push. **STOP**.

## Hors scope

Artemis E4, Verify×3, Max, merge main, lot caméra, regen goldens, modification backend STOP_COMPLETED.
