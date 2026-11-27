# Driver — ISC-F5-17 contrat d'écran « Driver en course » (Papa 2026-11-26)

Dépôt Galass_Driver, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-driver-multistop/ISA.md.

Fais UNIQUEMENT ISC-F5-17 : contrat d'écran RIDE_RUNNING — présence testée individuellement des 7 éléments figés (Decision Papa 2026-11-26 21:35 Dakar) : (1) avatar+nom+note UserDetailsWidget, (2) bouton message, (3) bouton appel, (4) un seul CTA principal actionnable (F5-12), (5) Annuler danger (F5-13), (6) bloc itinéraire pickup→arrêts→destination, (7) repères d'arrêts carte (F5-16). Règle ajouter-sans-retirer. Preuve : flutter test test/widget/course_en_cours_driver_contract_test.dart (ou chemin ISA). Coche ISC-F5-17 via ISATool.ts avec preuve.

**GOLDEN** : ne régénère aucun golden sans OK Papa (image+diff d'abord). Pas de flutter build. Pas de git push. Ne touche pas .fullrun. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>.
