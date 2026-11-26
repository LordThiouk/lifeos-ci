# Antenly fr-04 — Serena, finir le plan de build (2026-11-26)

Dépôt antenly, branche isa/fr-04-vera-2026-11-26. ISA : dossier MEMORY/WORK/2026-11-02-fr-04-segmentation/.
Le plan de build par vagues L1–L10 est déjà dans l'ISA (commits f48af57..8c7657e), mais le run précédent a été coupé par le quota. Les décisions sont maintenant fermées (bd2ad9d) : ISC-2 exactitude pondérée par la durée ; ISC-5 appariement un-à-un à ±2 s indépendant de la classe, seuil ≤ 2 s sur 95 % des frontières (PRD FR-03, décision Papa).
Fais UNIQUEMENT ceci : relis le plan, aligne-le sur ces décisions, complète ce qui manque (agent par tâche : UI à Aditi, logique et tests à Forge ou Engineer ; ancres fichier:ligne ; commande de preuve par ISC ; dépendances entre vagues). Termine par la ligne « PLAN: COMPLET » dans la section du plan.
Édite l'ISA uniquement via ISATool.ts. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de code. Pas de git push. Ne touche pas .fullrun.
