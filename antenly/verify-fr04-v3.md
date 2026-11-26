# Antenly FR-04 — verify Vague 3 (L4+L5+L8) (2026-11-26)

Dépôt antenly, ta branche verify/fr04-v3-<toi> (copie isa/fr-04-vera-2026-11-26 @ f824102 : Vague 2 + L4 T4.1 + L5 T5.1 + L8 T8.1). ISA : MEMORY/WORK/2026-11-02-fr-04-segmentation/ISA.md.
Périmètre Vague 3 uniquement : min duration/residus (test_min_duration, test_other) + overlap flag (test_overlap_flag) + emission FR-06 (test_emission). Lance vraiment :
`uv run --project api pytest api/tests/segmentation/test_min_duration.py api/tests/segmentation/test_other.py api/tests/segmentation/test_overlap_flag.py api/tests/segmentation/test_emission.py -q`
(ou chemins équivalents livrés) et colle la sortie.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien. Ne commence pas Vague 4+.
Écris VERIFY-FR04-V3.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun. Ne lis pas evidence/, kuna_*.c, match_*.md.
