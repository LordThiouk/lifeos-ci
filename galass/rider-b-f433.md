# Rider build F4-33 (Papa 2026-11-26 00:42 Dakar) — mini build 1/3

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : dossier MEMORY/WORK/20261006-galass-rider-multistop/ (plan Serena du 2026-11-26, F13).
Décisions Papa : F4-33 = option ii (le chauffeur = voiture marker_car, le client = pin personne qui suit sa position live, comme la carte Driver) ; F4-34 = option C (pick_up seul, une notification client unique) ; F4-28 = B.
Rôles : interface = Aditi Sharma ; logique et tests = Forge ou Engineer.
Fais UNIQUEMENT F4-33 : myLocationEnabled false (poly_line_map.dart:26), marker `user_marker_id` dédié à la position live (AppLocationController.currentPosition), icône pin personne (assets/icon/map_marker_pickup.png, même octets que Driver), voiture inchangée. Test widget/unit + flutter analyze. Coche l'ISC via ISATool.ts avec preuve. Éléments multistop uniquement. Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
