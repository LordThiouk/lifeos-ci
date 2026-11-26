# Antenly FR-01 — verify Vague V1 (après build V1b 2026-11-26)

Dépôt antenly, ta branche verify/fr01-v1-<toi> (copie de isa/fr-01-vera-2026-11-26 @ 1bbf95b). ISA : MEMORY/WORK/2026-11-02-fr-01-ingestion-live/.
Périmètre : commits V1 (schéma/migrations + S1.2/S1.3, ISC-22/12/13 cochés) depuis le tip isa. Lance vraiment les tests touchés (`uv run --project api pytest` sur les chemins ingest/schéma concernés) et colle la sortie.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien.
Écris VERIFY-FR01-V1.md à la racine : 1re ligne exacte « VERDICT: PASS » ou « VERDICT: BLOCK », puis points bloquants (fichier:ligne) / non bloquants + sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun.
