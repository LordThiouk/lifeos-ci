# E3 Serena — Parent lot carry build (anti-PF2)

Dépôt `Galass_backend`, branche **`fullrun/lot-client-w0`**.
ISA : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`.

Forge PF2 code=2 (20 claims ouvertes ; tip `63b483d` ≠ carry.head `c7a0be0`). Modèle `galass/lot-w4-serena-driver.md`.

## Périmètre plan

Rollup ticks caméra/OTP enfants (ISC-5/22/22.1/51/53 Rider ; ISC-20.1/21…21.4 Driver) — plan only pour carry.

## Anti-claims (sans case)

- Hors scope ISC-10/11/23, Artemis, merge main, code Flutter.
- Ne pas cocher ici ; ne pas coder.

ISATool Decisions + **exportCarry** frais. Commit unique carry. Push. **STOP** — puis Forge `e3-forge-parent-lot` sans autre commit.

## Vérification obligatoire avant STOP

Après `exportCarry`, vérifier localement que la signature est valable avec la clé CI déjà dans `~/.claude/LIFEOS/MEMORY/STATE/.isa-stamp-key` (ne jamais créer une autre clé) :

`bun ~/.claude/LIFEOS/TOOLS/FullRunPreflight.ts --isa <ISA.md> --start-step build --chain-phase build --details`

Doit donner `exit: 0` et `got: build`. Si `signature invalide` : la clé agent ≠ clé CI — ne pas committer, STOP avec le motif.
