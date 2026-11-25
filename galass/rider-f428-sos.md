# Rider — ISC-F4-28 : option B décidée par Papa (2026-11-25)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-rider-multistop/ISA.md (lis F4-28, F4-29, F4-31 et la décision PART B du 2026-11-25).

Décision de Papa (option B) : en RIDE_ACTIVE (course acceptée, chauffeur pas encore arrivé), le client voit le bouton SOS, en plus de « Annuler la course ». AUCUN bouton de prise en charge côté client (il ne sert à rien côté client, c'est le chauffeur qui confirme).

À faire :
1. ride_details_bottom_sheet_widget.dart : rendre le bouton SOS aussi dans le bloc RIDE_ACTIVE, même widget et même action que dans RUNNING. Ne rien retirer ailleurs (SOS RUNNING reste).
2. Contrat d'écran / test F4-31 : retirer l'assertion « CTA prise en charge présent » ; garder « SOS présent » (doit devenir verte) et « aucune UI recherche ».
3. Régénérer le golden course_active_avant_prise_en_charge.png et donner son nouveau sha256.
4. ISA via ISATool.ts uniquement : F4-28 cochée avec la décision « option B, Papa 2026-11-25 » ; F4-31 amendée (sans CTA prise en charge) et cochée si vert ; ajouter une ligne Decisions datée.
5. flutter test complet ; donner le compte passed/skipped/failed.

Règles : multistop uniquement, rien d'autre. Pas de git push (refuse toute commande qui en contient). Commits petits, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Ne pas toucher .fullrun.
