# Lot-client W3 Rider — suite bugs (vague 2026-11-27)

Dépôt `Galass_Rider`, branche `feat/lot-w2-rider` (déjà W2 : ISC-62/63/64/71/72/73). ISA **enfant** : `MEMORY/WORK/2026-11-22-galass-rider-lot-client/ISA.md` (`parent: 2026-11-22-galass-lot-client`). Coche les ISC dans l’enfant via ISATool ; parent rollup ensuite. Extra backend = lecture parent seulement.

Forge W3 Rider — **pas** login/OTP/inscription profond (ISC-5/51 hors vague sauf si déjà trivial) :
- ISC-65 R-11 : libellé `pickUpDestination` → FR naturel (MyStrings + usages)
- ISC-75 R8-5 : aperçu tarif après ajout d'arrêt (reprise correctif / test)
- ISC-76 R8-8 : saisie adresse ne perd plus de caractères
- ISC-83 / 83.1 / 83.2 R-6 : pas de crash nav carte + écran « aucun chauffeur » FR
- ISC-84 / 84.1 R-7 : état paiement Rider ≤ 5 s après event

Un ISC = un commit + `flutter test` nommé. Pas `flutter build`. Multistop hors scope sauf overlap. Auteur Papa Diop `<76528706+LordThiouk@users.noreply.github.com>`. Pas de push. Pas `.fullrun`.
