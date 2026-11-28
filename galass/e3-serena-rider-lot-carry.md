# E3 Serena — Rider lot carry build (anti-PF2)

Dépôt `Galass_Rider`, branche **`feat/lot-w2-rider`**.
ISA : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

Forge PF2 code=2 (8 claims ouvertes ; tip `55def63` ≠ carry.head `67700c4`). Modèle `galass/lot-w4-serena-driver.md`.

## Périmètre plan

ISC-85 caméra photo profil (garder FilePicker).

## Anti-claims (sans case)

- Hors scope device ISC-83/84, #33 goldens, MS, Artemis, merge main.
- Ne pas cocher ; ne pas coder.

ISATool Decisions + **exportCarry** frais au tip. Commit unique carry. Push. **STOP** — Forge ISC-85 immédiatement après, sans autre commit.

## Vérification obligatoire avant STOP

Après `exportCarry`, vérifier localement que la signature est valable avec la clé CI déjà dans `~/.claude/LIFEOS/MEMORY/STATE/.isa-stamp-key` (ne jamais créer une autre clé) :

`bun ~/.claude/LIFEOS/TOOLS/FullRunPreflight.ts --isa <ISA.md> --start-step build --chain-phase build --details`

Doit donner `exit: 0` et `got: build`. Si `signature invalide` : la clé agent ≠ clé CI — ne pas committer, STOP avec le motif.
