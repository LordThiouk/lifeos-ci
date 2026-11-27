# Lot-client W4 — Serena carry parent rollup caméra/OTP

Dépôt `Galass_backend`, branche `fullrun/lot-client-w0`.
ISA parent : `MEMORY/WORK/2026-11-22-galass-lot-client/ISA.md`.

**But :** carry signé (FullRunCarry étapes 1–3) pour rollup parent des ISC enfants déjà `[x]` mais parent encore `[ ]` :

## Rider (`feat/lot-w2-rider` tip `542932e`, progress 18/20)
| ISC | Preuve enfant (Verification) |
|---|---|
| ISC-5 | ISATool append ISC-4.1 phone-auth ; git diff additions seules [@93cf83d] |
| ISC-22 | RegistrationScreen REPRODUIT recherche pays ; widget test [@2a2bd43] |
| ISC-22.1 | `registration_refresh_test` rouge→vert 2/2 [@2a2bd43] |
| ISC-51 | `otp_phone_display_test` 3/3 masqué + Modifier [@efc37c2] |
| ISC-53 | phone_auth_helper 10/10 + grep logs masqués [@c993b07] |

## Driver (`feat/lot-w2-driver` tip `9ce4efe`, progress 15/26)
| ISC | Preuve enfant |
|---|---|
| ISC-20.1 | `registration_photo_test` 3/3 [@0cb1a40] |
| ISC-21 | `profile_camera_test` 2/2 [@0cb1a40] |
| ISC-21.1 | `vehicle_docs_camera_test` 2/2 [@0cb1a40] |
| ISC-21.2 | `license_camera_test` 2/2 [@0cb1a40] |
| ISC-21.3 | `camera_denied_test` 5/5 [@0cb1a40] |
| ISC-21.4 | `capture_size_test` 5/5 + backend limite déjà tip lot [@0cb1a40 / BE] |

**Scope :** documenter preuves SHA + lignes Verification enfants dans carry ; Decisions parent ; préparer forge tick (`lot-w4-forge-parent-camera-otp.md`).  
**Hors scope :** Flutter, code OTP/caméra, ISC-23, Mini-0 ISC-10, Artemis, Verify.  
Auteur Papa Diop. Pas `.fullrun`. Ne pas toucher ISC-10/11 (autre mini).
