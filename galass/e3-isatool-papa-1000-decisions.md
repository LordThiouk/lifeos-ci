# ISATool — décisions Papa 10:00 (noter, ne pas coder)

Un job = **un chantier**. Branche canonique. Compteurs = frontmatter de cette branche.  
ISATool seul. Commit `docs(isa)`. Push. **STOP**. Pas de coche device sans capture tierce.

## Décisions communes

1. **Driver 4 goldens — option B** : OK Papa pour refaire baseline des 4 PNG `driver_ride_running_{single_stop,multistop_stop_1_active,multistop_stop_2_active,multistop_all_stops_done}` en Flutter **3.44.8** (absents de main ; baseline 3.50.1 invalide). Job dédié, commit séparé, **rien d’autre** régénéré.
2. **Artemis GPU** : lane A = **G1** (`-gpu angle_indirect`). Lane B : **pas de relance** tant que le scénario lot n’existe pas.
3. **Lane B ≠ lot** : run `46126465934` = scénario **multi-arrêts** (mêmes P0 `run.sh` que lane A ; seule différence = comptes 900206/900123). **Aucune** capture pour ISC-21…21.4 / 22 / 22.1 / 50 / 80–84 / Bridge-1/2/4. HOLD Parent inchangés.

## Texte Decisions (adapter)

### Driver lot

> **2026-11-28 10:00 Africa/Dakar — Papa :** option **B** OK — baseline 4 goldens `ride_details` / `driver_ride_running_*` en Flutter **3.44.8** (job dédié). Device NON VALIDÉ. Pas de coche.

### Parent lot

> **2026-11-28 10:00 — Papa :** lane B Artemis **ne couvre pas** le lot (scénario multistop uniquement). ISC-21…22.1 / 50 / 80–84 / Bridges **HOLD**. GPU G1 réservé lane A. Pas de coche.

### Rider MS / Backend MS

Noter GPU G1 pour Artemis A post-tip ; Bridge-F17-3 / stop_completed = Forge MS en cours — diag-rider-pusher mesure encore `driver_assigned` (pas STOP_COMPLETED).
