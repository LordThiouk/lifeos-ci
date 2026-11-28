# E3 Forge — Rider MS (relance Papa 09:35)

Dépôt `Galass_Rider`, branche **`feat/multistop-rider-close-2026-11-20`**.
ISA : `MEMORY/WORK/20261006-galass-rider-multistop/ISA.md`.

Flutter **3.44.8**. Auteur : `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.

Forge précédent `46126175157` (**deepseek-v4.1-flash-free**) figé ~1 h → **annulé**. Tip attendu : **`a5ed36f`** (carry signé, étapes 1–3 pass, aucun commit après). Pas de re-carry.

## Préflight

Si préflight ≠ `exit: 0` / `got: build` : **STOP** — ne pas coder ; demander re-carry. Aucun commit wip entre carry et ce Forge.

## Scope (un chantier)

1. **F4-29** — fixture `vehicleData` : plaque, distance, temps, tarif.
2. **F4-23**, **F4-24**, **F4-21**, **F4-28**.
3. **Bridge-F17-3** — resync si `stops` vide + marqueur client `stop_completed` (logs) ; **ne pas** changer l'émission backend.
4. Régression **F4-32/33** (PR #30) : absorb logique après fix, pas de merge #25.

## Règles

ISATool seul pour coches. Sans preuve tierce → `NON VALIDÉ` + raison. Push branche canonique. **STOP**. Pas Artemis ici, pas regen goldens, pas main.
Si tu bloques >15 min sans sortie utile : STOP propre (Papa coupera en jobs A/B).
