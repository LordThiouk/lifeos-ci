# E3 Serena — Rider lot carry (post-merge #33 + Forge ISC-85)

Dépôt `Galass_Rider`, branche **`feat/lot-w2-rider`**.
ISA : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md`.

Tip courant attendu ≈ `444da63` (ISATool goldens #33) après Forge ISC-85 `4ecc9dc` et merge `#33` `ecdc998`.  
Papa 09:35 : **carry frais avant tout autre Forge** sur cette branche. Aucun code produit.

## Anti-claims

- Ne pas cocher device. Ne pas toucher aux 9 PNG goldens.
- Hors scope : MS, Artemis, merge main, regen goldens.
- Ne pas lancer Forge dans ce job.

## Travail

1. Completeness + Vera/Serena plan-only si besoin.
2. **exportCarry** au tip courant (étapes 1–3 pass, `start_step=build`).
3. `FullRunPreflight.ts --start-step build --chain-phase build --details` → `exit: 0` / `got: build`.
4. Commit `chore(fullrun): carry signé…` + push. **STOP**.
