# Rider F4-32 — verify avec preuve émulateur (2026-11-26)

Dépôt Galass_Rider, ta branche verify/rider-f432-<toi> (copie feat/multistop-e2e-2026-11-15 @ 963fa82). ISA : MEMORY/WORK/20261006-galass-rider-multistop/.
extra_repos : **galass-emu-actions-pub** (harnais émulateur — workflows `artemis-staging-e2e.yml` / patrol selon besoin F4-32). Utilise ce dépôt pour la preuve device ; n’invente pas un autre chemin emu.
Périmètre F4-32 : a1–a5, ISC-F4-32 coché. Lance `flutter test test/unit/multistop_map_test.dart` **et** une preuve émulateur via galass-emu-actions-pub (voiture visible / live_location si le harnais le couvre). Colle les sorties. Interdit de régénérer un golden. Pas de `flutter build`/`assemble` hors emu-actions.
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien.
Écris VERIFY-F432.md à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sorties tests + emu. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni .fullrun.
