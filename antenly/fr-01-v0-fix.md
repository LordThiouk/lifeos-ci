# Antenly fr-01 — correction V0 après BLOCK (Forge audit + code-review), mini workflow (2026-11-26)

Dépôt antenly, branche isa/fr-01-vera-2026-11-26. ISA : dossier MEMORY/WORK/2026-11-02-fr-01-ingestion-live/.
Les rapports de vérif sont sur les branches verify/fr01-v0-forge (VERIFY-FR01-V0.md, commit 355e32f) et verify/fr01-v0-cr (VERIFY-FR01-V0.md, commit 201a71a) : lis-les avec git show origin/<branche>:VERIFY-FR01-V0.md.
Corrige UNIQUEMENT ces points bloquants, avec un test rouge-puis-vert pour chaque faux PASS :
1. scripts/ingest/uptime.py : exiger la couverture de la fenêtre (un seul heartbeat ou 2 heartbeats à 30 j d'écart ne donnent pas 100 %). Corrige aussi le test qui validait ce faux positif.
2. scripts/ingest/soak_report.py : N calculé sur les chaînes de l'inventaire (utiliser vraiment --inventory), une chaîne absente du manifeste compte en échec.
3. scripts/ingest/soak_report.py et scripts/ingest/audit_gaps.py : lire state et simulated ; segments indisponibles ou simulés ne comptent jamais comme OK.
4. scripts/ingest/cost_report.py : donnée illisible ou heures manquantes → exit 2 avec message, jamais de traceback.
Non bloquant à faire aussi : ruff format sur les fichiers signalés ; documenter que pytest se lance avec --project api.
Lance la suite des tests ingest et ruff, colle la sortie dans le message de commit. Commit après chaque point. Ne coche aucun ISC. Ne commence pas V1.
Aucune URL de flux, IP ou clé. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
