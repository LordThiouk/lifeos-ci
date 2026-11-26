# Rider F4-32 — verify après a1–a5 (2026-11-26)

Dépôt Galass_Rider, ta branche verify/rider-f432-<toi> (copie de feat/multistop-e2e-2026-11-15 au sha 963fa82). ISA : MEMORY/WORK/20261006-galass-rider-multistop/.
Périmètre F4-32 uniquement : commits a1–a5 (GlobalDriverInfo → seed → poly_line_map → tests → fix pump). ISC-F4-32 coché. Lance vraiment `flutter test test/unit/multistop_map_test.dart` (et suite ciblée map/multistop si déjà listée) ; colle la sortie. Interdit de régénérer un golden.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien.
Écris VERIFY-F432.md à la racine : 1re ligne exacte « VERDICT: PASS » ou « VERDICT: BLOCK », puis points bloquants (fichier:ligne) / non bloquants, et la sortie des tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun. Ne lis pas evidence/, kuna_*.c, match_*.md.
