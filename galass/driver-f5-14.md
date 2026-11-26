# Driver F6 — ISC-F5-14 retrait compteur + Semantics (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15 (tip d514f2f+). ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md (leg F6).

Fais UNIQUEMENT ISC-F5-14 : retirer le compteur visible « x/N arrêt(s) terminé(s) » (`stopsProgressText`) partout en course active ; le remplacer par UN nœud `Semantics` invisible dont le `content-desc` vaut exactement `galass.driver.stops=<done>/<total>`, monté seulement si `ride.stops` non vide (miroir Rider ISC-F4-22).

Preuve obligatoire : `flutter test` sur le test ISA (ex. test/unit/multistop_stops_progress_test.dart) VERT. Coche ISC-F5-14 via ISATool.ts seulement avec preuve.

**GOLDEN / UI** : ne régénère AUCUN golden sans OK Papa (image+diff d'abord). Si un golden casse à cause du retrait texte, laisse le test en échec documenté — ne touche pas `test/goldens/`. Pas de régression UI hors scope.

Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun. Pas de flutter build / gradlew.
