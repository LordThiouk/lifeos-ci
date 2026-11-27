# Rider multistop — Verify×3 (F4-27 Arrêt N + tip close, 2026-11-27 20:20 Africa/Dakar)

Dépôt Galass_Rider, ta branche `verify/rider-ms-<toi>` (copie `feat/multistop-rider-close-2026-11-20` @ tip `ea4156b`). ISA : `MEMORY/WORK/20261006-galass-rider-multistop/`.

Périmètre Papa 27/11 :
- **F4-27** : liste empilée « Arrêt N » (design ligne Arrêt 1 de main) ; pas de bandeau `stopsProgressText` / `currentLegBanner` ; pas de bouton message (F4-26 retiré).
- Single-stop = main ; golden `course_en_cours_simple` **0 %** (Flutter **3.44.8** uniquement).
- Goldens gelés `stop1_*` / `tous_arrets_faits` **jamais régénérés** ; nouveaux `course_en_cours_f427_{2,3}_arrets.png` OK.
- Lance vraiment : `flutter test test/goldens/rider/rider_ride_sheet_golden_test.dart test/widget/course_en_cours_contract_test.dart` + unit multistop touchés + `flutter analyze` sur fichiers ride sheet / itinerary. Colle la sortie.

Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien. Ne régénère aucun golden PNG.
Écris `VERIFY-RIDER-MS.md` à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sortie tests. Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni `.fullrun`.
