# E3 Serena — Backend MS carry build (anti-PF2)

Dépôt `Galass_backend`, branche **`feat/multistop-e2e-2026-11-15`**.
ISA : `MEMORY/WORK/20261006-galass-regression-multistop/ISA.md`.

**But :** carry signé étapes 1–3 (`start_step=build`) — modèle `galass/lot-w4-serena-driver.md`. Carry actuel stale (`1ffa31b`, steps skipped).

## Périmètre plan uniquement

- ISC-39 / 39.1 / 39.2 / ISC-40 — **contrat** `STOP_COMPLETED` (canal `rider-user-{id}` / `private-rider-user-{id}`, nom d’événement, enveloppe payload).
- Forge E3 = **test de contrat seulement** ; **ne pas** planifier de changer l’émission.

## Anti-claims (sans case)

- Correction produit côté Rider (Bridge-F17-3 + marqueur client) — hors ce dépôt.
- Pas secrets PSP, pas merge PR CI #18, pas deploy, pas Flutter.

## Règles

Ne pas coder. Ne pas cocher. ISATool append Decisions + **exportCarry** frais au tip. Commit `chore(fullrun): carry signé — étapes 1-3 pass, start_step=build (ISC-39/40 contrat)` auteur Papa Diop. Push. **STOP**.

## Vérification obligatoire avant STOP

Après `exportCarry`, vérifier localement que la signature est valable avec la clé CI déjà dans `~/.claude/LIFEOS/MEMORY/STATE/.isa-stamp-key` (ne jamais créer une autre clé) :

`bun ~/.claude/LIFEOS/TOOLS/FullRunPreflight.ts --isa <ISA.md> --start-step build --chain-phase build --details`

Doit donner `exit: 0` et `got: build`. Si `signature invalide` : la clé agent ≠ clé CI — ne pas committer, STOP avec le motif.
