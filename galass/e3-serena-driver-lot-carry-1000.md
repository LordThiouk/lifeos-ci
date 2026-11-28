# E3 Serena — Driver lot carry (avant Forge goldens 3.44.8)

Dépôt `Galass_Driver`, branche **`feat/lot-w2-driver`**.
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`.

Tip ≠ carry (ISATool 09:20). Papa 10:00 : **carry frais** avant le Forge dédié « 4 goldens ride_details en 3.44.8 ».

## Anti-claims

Ne pas cocher device. Ne pas coder. Ne pas regen PNG ici. Hors scope Artemis / main / Rider.

## Travail

exportCarry au tip (étapes 1–3 pass, `start_step=build`).  
`FullRunPreflight --start-step build --chain-phase build --details` → exit 0 / got build.  
Commit carry + push. **STOP** — le Forge goldens part ensuite (autre job).
