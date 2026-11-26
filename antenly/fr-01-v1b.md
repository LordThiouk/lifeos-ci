# Antenly FR-01 — reprise build Vague V1 (2026-11-26)

Dépôt antenly, branche isa/fr-01-vera-2026-11-26 @ aaa637f (wip V1 partiel — agent stopped ; V0b 3 PASS sous 664c307). ISA : MEMORY/WORK/2026-11-02-fr-01-ingestion-live/, plan Serena Vague V1.
Reprends et **termine** UNIQUEMENT V1 — Schéma et migrations (Forge) : S1.1 → S1.2 → S1.3. Garde le travail utile déjà commité ; corrige/complète ce qui manque ; retire le marqueur wip par un commit propre (pas de réécriture d'historique). Ancres fichier:ligne du plan ; preuves migrate.sh + pytest ISC-22 / ISC-12 / coverage ISC-13. Commit après chaque tâche, sortie de preuve dans le message. Coche ISC via ISATool.ts seulement si preuve verte.
Ne commence pas V2. Pas de revue. Aucune URL de flux, IP ou clé. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun. Ne lis pas evidence/, kuna_*.c, match_*.md.
