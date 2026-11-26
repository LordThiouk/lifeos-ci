# Antenly FR-04 — verify Vague 2 (L2+L3) (2026-11-26)

Dépôt antenly, ta branche verify/fr04-v2-<toi> (copie isa/fr-04-vera-2026-11-26 @ 73bfbda : L1 + L2 T2.1/T2.2 + L3 T3.1). ISA : MEMORY/WORK/2026-11-02-fr-04-segmentation/ISA.md.
Périmètre Vague 2 uniquement : split/métriques (test_eval_split, test_per_class) + baseline inaSpeechSegmenter (test_segmenter_baseline). Lance vraiment :
`uv run --project api pytest api/tests/segmentation/test_eval_split.py api/tests/segmentation/test_per_class.py api/tests/segmentation/test_segmenter_baseline.py -q`
(ou chemins équivalents livrés) et colle la sortie.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien. Ne commence pas L4+.
Écris VERIFY-FR04-V2.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun. Ne lis pas evidence/, kuna_*.c, match_*.md.
