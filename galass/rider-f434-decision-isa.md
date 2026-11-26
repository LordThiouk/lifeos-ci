# Rider F4-34 — journaliser décision Papa dans l’ISA (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-rider-multistop/ISA.md.
Fais UNIQUEMENT ceci, via **ISATool.ts** (aucun code produit) : dans **Decisions**, consigne la décision Papa du 2026-11-26 (Africa/Dakar) pour F4-34 / F13 :
- **C + B** (pas A) ;
- **C** = alerte unique au Pusher `pick_up` (bouton Driver prise en charge), one-shot par `ride_id`+type ;
- **B** = alerte distincte « **arrive bientôt** » (geofence sur `live_location` / position F4-32), one-shot par `ride_id`+type `arriving_soon` ;
- les deux coexistent ; dédup FCM par `ride_id`+type ; pas d’event backend `driver_arrived`.
Retire / marque fermée la ligne « Décision Papa requise » A/B/C du plan Serena pour F4-34. Mets à jour le claim ISC-F4-34 / F13 si le libellé « une seule alerte au premier de… » doit refléter deux types d’alerte (B puis C). Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun ni le code lib/.
