# Forge Rider MS — ISC-F4-29 SEUL (Papa 11:45)

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Split A2 `46137897145` **annulé** (livelog stagnant 336 KB, agent bloqué post-commits locaux).  
Ce job = **un seul ISC** : **ISC-F4-29** (contrat écran 8/8).

## Anti-claims (sans case)

- Ne pas toucher F4-23, F4-24, Bridge-F17-3, stop_completed, F4-32/33.
- **Aucun** `--update-goldens` / regen PNG.
- Pas de merge `main`. Pas Artemis.

## Travail

1. Contrat F4-29 a–h : présence widget (avatar, nom+note, plaque, tuile notes, Key `rider-call-button`, distance/temps/tarif, frise, SOS) — Flutter **3.44.8**.
2. Preuve : `flutter test test/widget/course_en_cours_contract_test.dart --name 'ISC-F4-29'`.
3. ISATool tick F4-29 seulement + Decisions.
4. **Un commit** code (+ un commit ISA si besoin). **STOP** (le workflow pousse).

Reprise tip : `a5ed36f` (commits locaux e30dc06/b88e862 du run annulé **jamais poussés** — à refaire ici pour F4-29 seul).
