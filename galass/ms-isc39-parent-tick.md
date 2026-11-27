# Mini — ISC-39 parent tick (MS backend)

Dépôt `Galass_backend`, branche `feat/multistop-e2e-2026-11-15`.
ISA : `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md`.

## But

Cocher **ISC-39 parent** via `bun ~/.claude/LIFEOS/TOOLS/ISATool.ts tick` uniquement (jamais Edit/Write/sed sur ISA.md).

## Preuves déjà au tip (ne pas régénérer)

1. **ISC-39.1** `[x]` — broadcast `STOP_COMPLETED` sur `rider-user-{id}` ≤1 s (PHPUnit + staging).
2. **ISC-39.2** `[x]` — idem sur `rider-driver-{id}`.
3. **ISC-39.3** `[x]` — key-set exact `{ride_id,stop_id,sequence,next_leg}` (PHPUnit order-pinned).
4. **Rider ISC-F4-12** `[x]` — handler Pusher `STOP_COMPLETED` met à jour timeline (`Galass_Rider` MS tip).

## Actions

1. Relire les 4 preuves au tip (SHA + lignes ISA). Si une est ouverte → **STOP**, ne pas cocher, consignes Decisions.
2. Sinon : `ISATool.ts tick` ISC-39 avec `--evidence` ≥20 car. citant 39.1/39.2/39.3 + F4-12 (runs/SHA/tests).
3. `ISATool.ts append` une ligne Decisions datée (preuve rollup).
4. Un commit auteur Papa Diop. Pas de code PHP. Pas `.fullrun`. Pas secrets. Pas waiver.

## Hors scope

ISC-61.x, ISC-50, deploy, Verify×3, merge.
