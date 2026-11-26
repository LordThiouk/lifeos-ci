# Driver — regen goldens ride_details (OK Papa 2026-11-26 Dakar)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/.

**Décision Papa explicite : REGEN** des goldens Driver en échec Artemis (4–6 px ; baselines Flutter ≠ runner).

Fais UNIQUEMENT :
1. Consigne dans **Decisions** ISA (ISATool) : Papa OK regen goldens Driver 2026-11-26 (Africa/Dakar) — motif drift pixels / version Flutter CI vs baseline ; pas un redesign produit.
2. Régénère les PNG de `test/goldens/driver/` pour `ride_details_golden_test.dart` (au minimum : `driver_ride_running_single_stop`, `…_multistop_stop_1_active`, `…_multistop_stop_2_active`, `…_multistop_all_stops_done`) via `flutter test --update-goldens` sur ce fichier (même toolchain que possible / Flutter du runner).
3. Vérifie `flutter test test/goldens/driver/ride_details_golden_test.dart` vert après update.
4. Commit PNG + ISA Decisions. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas lib/ hors besoin strict golden harness. Ne touche pas .fullrun.
