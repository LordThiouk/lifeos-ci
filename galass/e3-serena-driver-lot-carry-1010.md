# E3 Serena — Driver lot re-carry (tip≠carry après ISATool 10:00)

Dépôt `Galass_Driver`, branche **`feat/lot-w2-driver`**.
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

Carry `a4b9638` PASS, puis ISATool a poussé `c55fd6c` → **tip ≠ carry**.  
Papa 10:00 : Forge 4 goldens 3.44.8 **uniquement** si tip==carry.

## Anti-claims

Ne pas cocher device. Ne pas coder. Ne pas regen PNG. Hors Artemis / main / Rider.

## Travail

exportCarry au tip actuel (étapes 1–3 pass, `start_step=build`).  
`FullRunPreflight --start-step build --chain-phase build --details` → exit 0 / got build.  
Commit carry + push. **STOP** — Forge goldens part au poll suivant si tip==carry.
