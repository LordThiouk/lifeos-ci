# Mini Rider — ISC-F4-26 bouton message RUNNING

Dépôt `Galass_Rider`, branche `feat/multistop-rider-close-2026-11-20`.

**Scope strict — F4-26 seul.**
Bouton message autonome (`Key('rider-message-button')`) visible à côté de l'appel en `RIDE_RUNNING`, indépendant de la tuile notes.

Preuve TDD : `flutter test test/widget/course_en_cours_contract_test.dart --name 'ISC-F4-26'` rouge→vert.
Anti : pas de regen goldens ; pas F4-25/27. Pas `flutter build`. ISATool tick. Auteur Papa Diop. Pas `.fullrun`. Timeout ≤ 25.
