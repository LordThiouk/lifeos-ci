# E3 Forge — Rider MS F4-21/23/24/28/29 + F4-32/33

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Flutter **3.44.8**, **aucun golden régénéré**, pas de `flutter build`, pas `.fullrun`.
Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

## Scope

1. **F4-29** — compléter fixture `vehicleData` (plaque, distance, temps, tarif) → **8/8** éléments ; test nommé.
2. **F4-23** destination finale réelle ; **F4-24** test régression état neuf ; **F4-21** vérifier + tick si preuve.
3. **F4-28 SOS** — test widget (Papa : disparu dans un test, résolu).
4. **F4-32/33** — corriger régression (carte jambe courante / related) ; ensuite porter le fix sur tip close (équivalent absorb #30 **après** fix). Ne pas casser frise Papa.
5. RUNNING : rider se rafraîchit ; préparer UI_END (vrai tap) sans lancer Artemis.
6. ISATool ticks avec `flutter test` nommés seulement. Push. **STOP**.

## Hors scope

Artemis E4, Verify×3, Max, merge main, lot caméra, regen goldens.
