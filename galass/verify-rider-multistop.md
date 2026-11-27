# Rider multistop — Verify×3 (F4-27 Arrêt N, 2026-11-27 21:15 Africa/Dakar)

Dépôt Galass_Rider. ISA : `MEMORY/WORK/20261006-galass-rider-multistop/`.

## Branche — OBLIGATOIRE (sinon le workflow FAIL)
1. `git fetch origin feat/multistop-rider-close-2026-11-20`
2. `git checkout -B verify/rider-ms-<toi> origin/feat/multistop-rider-close-2026-11-20`  
   (toi = silas | forge | cr)
3. **INTERDIT** de committer ou de rester sur `feat/multistop-rider-close-2026-11-20` — le porte-gitleaks refuse si le tip est modifié.
4. Tip attendu au départ : `ea4156b` ou plus récent sur la canonique.

## Périmètre Papa 27/11
- **F4-27** : liste empilée « Arrêt N » (design ligne Arrêt 1 de main) ; pas de bandeau `stopsProgressText` / `currentLegBanner` ; pas de bouton message (F4-26 retiré).
- Single-stop = main ; golden `course_en_cours_simple` **0 %** (Flutter **3.44.8** uniquement).
- Goldens gelés `stop1_*` / `tous_arrets_faits` **jamais régénérés** ; nouveaux `course_en_cours_f427_{2,3}_arrets.png` OK.
- Lance vraiment : `flutter test test/goldens/rider/rider_ride_sheet_golden_test.dart test/widget/course_en_cours_contract_test.dart` + unit multistop touchés + `flutter analyze` sur fichiers ride sheet / itinerary. Colle la sortie.

## Livrable
Ton rôle : ton seul rôle de vérification (audit Forge, ou Silas, ou revue de code). Ne corrige rien. Ne régénère aucun golden PNG.
Écris `VERIFY-RIDER-MS.md` à la racine : 1re ligne « VERDICT: PASS » ou « VERDICT: BLOCK », points bloquants, sortie tests. Un commit **sur `verify/rider-ms-<toi>` uniquement**, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas l'ISA ni `.fullrun`.
