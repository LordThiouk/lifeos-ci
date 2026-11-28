# Préflight / Carry — lecture seule — 2026-11-28 07:05 Africa/Dakar

| Chantier | tip carry head | steps 1/2/3 | Verdict build |
|---|---|---|---|
| Driver lot | `50fc7c9` | skipped / **pass** / **pass** | **OK** (start_step=build) |
| Parent lot | `c7a0be0` | **pass** / **pass** / **pass** | **OK** |
| Rider lot | `67700c4` | **pass** / **pass** / **pass** | **OK** (au tip actuel) |
| Rider MS | `b2e4cc8` (2026-11-21) | skipped / skipped / skipped | **BLOQUÉ** — carry stale |
| Backend MS | `1ffa31b` (2026-11-19) | skipped / skipped / skipped | **BLOQUÉ** — carry stale |

Cause PF2 observée (forge backend `46119209558`) : `code=2` porte `completeness_pre` ; tip ISA mis à jour par sot-serena sans `exportCarry` frais.

Action suivante (Papa) : Serena carry-build Rider MS + Backend MS ; E3 immédiat Driver + Parent ; Rider lot forge si PF OK ; backend E3 = contrat STOP_COMPLETED only.
