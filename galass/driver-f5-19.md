# Driver — ISC-F5-19 voiture temps réel en course (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md.

Fais UNIQUEMENT ISC-F5-19 : pendant RIDE_ACTIVE et RIDE_RUNNING, (1) le marqueur voiture `driver_location` / `marker_car.png` se met à jour sur un flux GPS (pas figé au loadMap), (2) la caméra suit raisonnablement, (3) `POST driver/location-update` est émis depuis le contexte course (pas seulement home online). Preuve : flutter test widget/unit + coche ISATool.

**GOLDEN** : ne régénère aucun golden sans OK Papa. Pas de flutter build. Pas de git push. Ne touche pas .fullrun.
