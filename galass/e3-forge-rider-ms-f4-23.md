# Forge Rider MS — ISC-F4-23 SEUL (Papa 15:25)

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Carry tip attendu : `chore(fullrun): carry signé` (wip OFF). **Un seul ISC** : **ISC-F4-23**.

## Scope

Après le dernier arrêt, le Rider affiche la **vraie destination finale** (adresse lisible en entier), jamais un libellé générique type « En route vers Point E » / placeholder.

## Preuve

- Flutter **3.44.8**
- `flutter test` widget/unit ciblé F4-23
- ISATool tick **ISC-F4-23** seulement + Decisions

## Anti-claims

- Ne pas toucher F4-24, Bridge-F17-3, stop_completed, F4-32/33, F4-29.
- **Aucun** `--update-goldens` / regen PNG.
- Pas de merge `main`. Pas Artemis.

## STOP

Un commit code (+ commit ISA si besoin). **STOP** (le workflow pousse). Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
