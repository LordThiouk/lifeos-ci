# E3 Forge — Emu harnais RUNNING refresh + UI_END

Dépôt `galass-emu-actions-pub`, branche **`cursor/artemis-f427-pusher-e410`** (intégrer tip #15 si pas déjà).
ISA : `MEMORY/WORK/20261123-galass-emu-golden-anti-regression/ISA.md`.

Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. Pas `.fullrun`.

## Scope

1. Harnais : Rider se rafraîchit en RUNNING ; fin de course par **vrai tap UI** (UI_END) — F18-1b / Anti-F18-1.
2. Marqueurs = textes visibles (pas Semantics test).
3. ISATool Decisions + ticks ISC-EMU si preuve locale nommée. **Ne pas** lancer Artemis workflow (E4). Push. **STOP**.

## Hors scope

Artemis dispatch, merge main, regen goldens apps.
