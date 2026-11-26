# Rider build F4-32 + fermeture ISA (Papa 2026-11-26 00:56 Dakar)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15 (passe après le build F4-33 sur la même branche). ISA : dossier MEMORY/WORK/20261006-galass-rider-multistop/ (plan Serena du 2026-11-26, F13).
Décisions Papa : F4-33 = ii (chauffeur = voiture marker_car, client = pin personne live) ; F4-34 = C (pick_up seul, fait sur la branche feat/rider-f434-2026-11-26, NE PAS refaire ici) ; F4-28 = B.
Rôles : interface = Aditi Sharma ; logique et tests = Forge ou Engineer ; revue finale = Max.

1. F4-32 (Forge) : la position du chauffeur EXISTE déjà dans le backend (Galass_backend, branche feat/multistop-e2e-2026-11-15, en lecture seule). Trouve l'endpoint ou l'événement existant qui la fournit et fais-la simplement RÉCUPÉRER par le Rider : position de départ explicite (driverLatLng dans poly_line_map.dart:38-42) puis mise à jour live. Aucun changement backend. Preuve : test/unit/multistop_map_test.dart + flutter analyze si dispo.
2. Fermeture : relis toute l'ISA Rider multistop. Chaque ISC encore ouvert (sauf F4-34) doit être fait ou prouvé conforme par lecture du code (file:line). On ne laisse rien. Coche via ISATool.ts avec preuve.
3. Max en dernier : revue complète branche vs ISA, corrige ce qu'il trouve, écrit son verdict dans l'ISA (liste de ce qui reste, idéalement vide).
Éléments multistop uniquement. Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
