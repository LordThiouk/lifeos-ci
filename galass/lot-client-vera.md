# Galass lot client — étape Vera (plan) (Papa 2026-11-25 22:51 Dakar)

Dépôt Galass_backend, branche fullrun/lot-client-w0 (reprise du run annulé du 2026-11-22). ISA : dossier MEMORY/WORK/2026-11-22-galass-lot-client/ (phase plan, 0/67). Source : docs/BUGS.md (trié le 2026-11-22, commit c40c30de) et la note de demandes client.

Ton rôle : Vera seule, phase plan. Termine l'ISA, via ISATool.ts uniquement :
- chaque demande client et chaque bug OUVERT a un ISC binaire, l'app nommée (backend / Rider / Driver), une preuve outillée et la classe « correctif dû » ou « nouvelle fonctionnalité » ;
- les bugs multistop sont EXCLUS (déjà dans les ISA multistop) : renvoie-les par référence ;
- les 5 re-tests critiques (D-1, D-9, D-12, R-6, R-7) : ISC de reproduction d'abord ;
- les points ambigus 7 et 10 : liste les options dans Decisions, ne tranche pas, marque « décision Papa » ;
- ordre de build par vagues et carte de dispatch.
Lis le code Rider et Driver (extra_repos) pour des fichier:ligne réels. AUCUN changement de code. Commits tôt et petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
