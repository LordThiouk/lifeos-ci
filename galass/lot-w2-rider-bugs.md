# Lot-client W2 Rider — bugs non-auth (vague accélérée 2026-11-27)

Dépôt Galass_Rider, branche feat/lot-w2-rider (copie feat/multistop-e2e-2026-11-15 ou main si plus propre — reste sur la branche fournie). ISA parent : Galass_backend MEMORY/WORK/2026-11-22-galass-lot-client/ (lecture via extra) ; coche preuves dans l’ISA parent si accessible en write lifeos, sinon commit preuves tests + note dans message.

Fais UNIQUEMENT Forge W2 Rider SANS login/OTP/inscription (pas ISC-51/52/5) :
- ISC-62 filtre pays SN
- ISC-63 pas recalcul route inutile
- ISC-64 garde GoogleMapController disposé
- ISC-71 icône notif monochrome
- ISC-72 canaux rides/chat/promo
- ISC-73 fullScreenIntent critique
Un ISC = un commit + flutter test nommé. Multistop exclus hors ces bugs. Pas flutter build. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de push. Pas .fullrun.
