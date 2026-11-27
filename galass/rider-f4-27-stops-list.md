# Mini Rider — ISC-F4-27 liste complète arrêts RUNNING

Dépôt `Galass_Rider`, branche `feat/multistop-rider-close-2026-11-20`.

**Scope strict — F4-27 seul.**
En `RIDE_RUNNING` avec arrêts intermédiaires, le bloc itinéraire liste **tous** les arrêts (ex. « Pharmacie Mermoz », « Marché Castors ») + destination — pas seulement la jambe active (`rideItineraryUsesActiveLegOnly` / collapse).

Preuve TDD : `flutter test test/widget/course_en_cours_contract_test.dart --name 'ISC-F4-27'` rouge→vert.
Anti : pas de regen goldens ; pas F4-25/26. Pas `flutter build`. ISATool tick. Auteur Papa Diop. Pas `.fullrun`. Timeout ≤ 25.
