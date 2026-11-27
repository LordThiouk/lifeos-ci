# Plan de fermeture — multistop + lot client (3 dépôts)

Africa/Dakar · tips : Driver `e23060e` · Rider MS `0fe56d0` · Rider W4 `78aa436` · Backend lot `2a59ba8` · Backend MS `992d308` (137/157)

## En vol maintenant
| Job | run | note |
|---|---|---|
| Signup Driver ISC-22 | relance (isa_path vide) | Papa : jamais demandé d’annuler |
| Artemis multistop 1× | [46053833147](https://github.com/LordThiouk/galass-emu-actions-pub/actions/runs/46053833147) | Rider `feat/multistop-rider-close-2026-11-20` · Driver `feat/lot-w2-driver` · mode **diagnostic** goldens 2–4 px |

## Cause goldens Driver `driver_ride_running_*` (2–4 px / 0.00 %)
Pas un bug UI code. Les PNG de référence ont été validés sous **Flutter 3.50.1** (forge/Aditi). Artemis CI pin **Flutter 3.44.8** → micro-diff de rasterisation police/antialias (compteur px absolu, % ≈ 0). **Jamais regen.** Mode diagnostic : Rider tests stricts ; si seuls ces 4 goldens Driver échouent → journal `e2e-out/golden-diagnostic.txt` + **e2e P0 continue**.

## Ordre mini builds (sans s’arrêter)

### A — Lot Driver (23/30 → 30/30)
1. **ISC-22 / 22.1** signup refresh — forge en cours  
2. **ISC-50** captures avant OTP — Artemis device  
3. **ISC-80** D-1 reboot hors ligne — Artemis  
4. **ISC-81** D-9 countdown offre — Artemis (+ backend)  
5. **ISC-82 / 82.1** D-12 double surface — forge test puis Artemis  

### B — Lot Rider (19/20 → 20/20)
1. **ISC-50** captures avant OTP — Artemis (même run que Driver)

### C — Parent lot (41/64)
Priorité exécutable sans merge :
- Tick parent pour ISC déjà verts côté enfants (10.*, 23.*, 51–53, 83/84) via mini ISATool  
- Bridge-1/2/4, ISC-1/2/4/6 — audits  
- Device : ISC-50, 80–82, FCM 61.x via Artemis  
- ISC-11.* retirés Papa — cocher n/a ou archiver

### D — Multistop backend (137/157 → close)
Ouvertes actionnables (hors DROPPED/SPLIT) :
- **ISC-61.1…61.7** FCM device (Artemis)  
- **ISC-F18-1b / F18-2 / Anti-F18-1** start course diag  
- **Bridge-F4-1/F4-3, Bridge-F5-2, Bridge-F17-3** device  
- **ISC-56.1** log staging (ops)  
- Deploy ISC-21/24.* — **GO Papa** explicite  

## Après ISA complète
Verify×3 parallèle (Forge audit + Silas + code-review) → verdict PASS/BLOCK + preuve non-régression UI → **demande OK merge**.

## Preuves visuelles (chemins relatifs)
Voir `preuves/` et `${DATE}-preuves-visuelles.md`.
