# Mini Rider — ISC-F4-27 (réduit) : liste arrêts RUNNING

Dépôt `Galass_Rider`, branche `feat/multistop-rider-close-2026-11-20`.

**Scope strict — une seule chose.**
En `RIDE_RUNNING`, `rideItineraryUsesActiveLegOnly` ne doit **pas** collapser : afficher la **liste complète** des arrêts (pickup + stops + destination), comme le contrat main / ISC-F4-27 (actif en avant, autres estompés/numérotés).

## Ordre obligatoire (anti-timeout)
1. Rouge → vert : `flutter test test/widget/course_en_cours_contract_test.dart --name 'ISC-F4-27'` (1 test)
2. **ISATool tick ISC-F4-27** (preuve = commande + sortie + SHA tip)
3. **git push** tip
4. **STOP** immédiatement — rien d’autre

## Anti
Pas de regen goldens. Pas F4-25/26. Pas `flutter build`. Pas `.fullrun`. Timeout ≤ 25. Auteur Papa Diop.
