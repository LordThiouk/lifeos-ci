# Preuves visuelles — ISC déjà livrées

Chemins relatifs depuis `reports/galass-chantiers/`.

## F4-25 / 26 / 27 (Rider course — planches main | branche | diff)
| ISC | planche |
|---|---|
| F4-25 notes + contrat | ![simple](preuves/f4/course_en_cours_simple_board.png) |
| F4-26 message | ![stop1 actif](preuves/f4/course_en_cours_stop1_actif_board.png) |
| F4-27 liste arrêts | ![stop1 fait](preuves/f4/course_en_cours_stop1_fait_board.png) |
| progression | ![tous faits](preuves/f4/course_en_cours_tous_arrets_faits_board.png) |
| terminée | ![terminee](preuves/f4/course_terminee_board.png) |

Sources brutes aussi sous `goldens-compare/*_{main,multistop,diff,board}.png`.

## ISC-10 KYC écran unique (Driver)
| Moment | capture |
|---|---|
| AVANT permis | ![before permis](preuves/kyc/isc10-before-permis.png) |
| AVANT véhicule | ![before vehicule](preuves/kyc/isc10-before-vehicule.png) |
| APRÈS unique | ![after kyc](preuves/kyc/isc10-after-kyc.png) |

Tip preuve : `eb7d54f` / `b1f08b7`.

## OTP / localisation / Artemis
- OTP Driver/Rider : captures widget à produire au prochain forge (keys `otp-edit-phone`) + SHA `07b0bbc` / Rider `efc37c2`.
- Localisation ISC-23 : preuve = tests `always_location_*` (pas encore PNG device) — à sortir d’Artemis.
- Artemis P0 : captures du run [46053833147](https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46053833147) dès artefacts disponibles.
