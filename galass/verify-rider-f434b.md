# Rider F4-34 — Verify×3 après rebuild (2026-11-26)

Dépôt Galass_Rider, ta branche verify/rider-f434b-<toi> (copie feat/multistop-e2e-2026-11-15 @ tip avec rebuild C+B). ISA : MEMORY/WORK/20261006-galass-rider-multistop/.

Périmètre F4-34 : porte one-shot liée au ride_id, dédup Pusher↔FCM partagée, chemin iOS foreground. Preuves unit dans les commits `dcb4bf0` / `2ec49c8`. Lance vraiment `flutter test` (hors goldens si flaky SDK) + analyze sur fichiers touchés ; colle la sortie.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien. Ne régénère aucun golden.
Écris VERIFY-F434B.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun.
