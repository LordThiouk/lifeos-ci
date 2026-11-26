# Rider/Driver — décision Papa F5-16 carte jambe active (2026-11-26)

Dépôt Galass_Rider, branche feat/multistop-e2e-2026-11-15. ISA : MEMORY/WORK/20261006-galass-rider-multistop/ISA.md.
Fais UNIQUEMENT ceci, via **ISATool.ts** (aucun code produit) : dans **Decisions**, consigne la décision Papa du 2026-11-26 (Africa/Dakar) pour **ISC-F5-16** :
- **F5-16 porte aussi / surtout le Rider** (pas seulement Driver `stopMarkers`) ;
- **Comportement attendu** : sur la **carte Rider** en multistop, mettre en avant **uniquement la jambe / l’arrêt actif** (comme Driver) ;
- **Écart actuel** : Rider met en avant **tous** les arrêts de l’itinéraire (symétrie fausse) ;
- Aligne le claim / le plan F5-16 ‖ F4-21 (porteur `RideStopProgress` / markers) pour que la preuve Rider exige : 1 arrêt actif distinct, les autres estompés ou non mis en avant — miroir du rendu Driver ; ne coche aucun ISC.
Un commit, auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun ni le code lib/.
