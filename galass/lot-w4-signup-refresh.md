# Lot-client W4 — ISC-22 / 22.1 : KYC « en attente » figé après validation admin (Driver)

Dépôt : `Galass_Driver` @ `feat/lot-w2-driver`
ISA : `MEMORY/WORK/2026-11-22-galass-driver-lot-client/ISA.md`

## Bug réel (Papa 2026-11-27)

Le chauffeur envoie ses documents (écran unique KYC ISC-10 `DriverKycScreen`). L'admin les valide dans le backend. **L'app reste sur l'écran « en attente »** tant qu'on ne la quitte pas / ne la relance pas.

## Scope strict

1. **ISC-22** — Repro device Artemis, compte test **id > 900000** :
   - envoyer documents (permis + véhicule) ;
   - valider côté admin staging ;
   - capturer l'écran figé « en attente » + log ;
   - verdict REPRODUIT en Decisions avec chemins de captures.
2. **ISC-22.1** — Correctif tip déjà sur `feat/lot-w2-driver` @ `64bdffd` (resume refresh). Vérifier `flutter test test/presentation/kyc/driver_kyc_pending_refresh_test.dart` VERT. Captures avant/après. Si tip OK : tick ISATool ; sinon compléter.
3. **Rider** — **non concerné** (pas d'écran KYC documents) — consign Decisions + capture planche si besoin.

## Ordre
1. Preuves tests
2. Device / captures si possible
3. ISATool tick 22/22.1
4. git push
5. STOP

Hors scope : caméra/OTP/location, `flutter build`, regen goldens. Pas `.fullrun`. **Ne pas attendre un « OK Papa » pour démarrer.**
