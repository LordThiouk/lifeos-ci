# Lot-client W3 Driver — suite bugs (vague 2026-11-27)

Dépôt `Galass_Driver`, branche `feat/lot-w2-driver` (déjà W2 : ISC-60/66/67/68/69/70). ISA parent lot-client sur backend (extra).

Forge W3 Driver — **pas** caméra/OTP/auth profond (ISC-20.1/21.x/22.x/23.x/52 → vague W4) :
- ISC-61 CFG-4 : `-Xmx` Driver tient dans mémoire runner CI (gradle props / doc preuve)
- ISC-80 / 80.1 D-1 : hors-ligne après redémarrage / maj app — REPRO puis fix ou BUGS.md
- ISC-81 / 81.1 D-9 run7 : compte à rebours offre = durée serveur
- ISC-82 / 82.1 D-12 run7 : une seule surface d'acceptation par dispatch

Un ISC = un commit + `flutter test` nommé. Pas `flutter build`. Auteur Papa Diop `<76528706+LordThiouk@users.noreply.github.com>`. Pas de push. Pas `.fullrun`.
