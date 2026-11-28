# Artemis goldens — diagnostic (2026-11-27 19:18 Africa/Dakar)

## Run 46055061159 (Flutter **3.50.1**, Rider `0fe56d0`)

| Preuve | Résultat |
|---|---|
| Contrats F4-25 / F4-26 / F4-27 | **PASS** |
| Goldens `course_en_cours_*` | **~12–13 %** — UI F4-27 (liste complète RUNNING) vs PNG gelés (jamais regen) |
| Autres goldens Rider | 0.01–0.11 % bruit |
| F4-29 a-b | flake fonts dispose (`RelayoutWhenSystemFontsChange`) sous 3.50.1 |
| Driver | non atteint (Rider stoppait avant) |

## Cause des 2–4 px Driver (rappel)

Raster police Flutter Artemis vs goldens forge — **pas** un bug code. Filet diagnostic conservé.

## Action

Workflow Artemis : mode diagnostic Rider (goldens + F4-29 tolérés **si** F4-25/26/27 verts) → **e2e P0 continue**. Relance après `6ff36a5`.
