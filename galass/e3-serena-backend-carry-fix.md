# E3 Serena — Backend MS : exporter carry build (fix PF2)

Dépôt `Galass_backend`, branche **`feat/multistop-e2e-2026-11-15`**.
ISA : `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md`.

## Problème

`fullrun-carry.json` est **stale** (head `1ffa31b`, 2026-11-19). Forge PF2 : `start_step=build` → porte `completeness_pre`. Tip ISA `b34293a` sans carry rafraîchi.

## Scope (plan only)

1. Relire ISA + PHPUnit déjà verts (301/2134) pour Pusher ISC-39/40.
2. **Exporter un carry signé** étapes 1–3 (`exportCarry` / outil FullRunCarry) avec `start_step=build`, `scope_fp`/`progress_fp`/`criteriaIds` à jour au tip courant — comme Driver lot `6466180`.
3. Commit `chore(fullrun): carry signé — étapes 1-3 pass, start_step=build (ISC-39/40)` auteur `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. Push. **STOP**.

Ne pas coder PHP. Ne pas cocher ISC. Pas `.fullrun` hors carry JSON ISA. Pas merge main.
