# Galass lot client — build W0 suite, mini workflow (Papa 2026-11-26 04:35 Dakar)

Dépôt Galass_backend, branche fullrun/lot-client-w0 (tête a5c15f5). ISA : dossier MEMORY/WORK/2026-11-22-galass-lot-client/, plan Serena. Dépôts en lecture : Galass_Rider, Galass_Driver (extra_repos).
S-W0-07 (R-7, e2e appareil) est marqué bloqué faute d'émulateur : ne le refais pas. Fais UNIQUEMENT les autres tâches de la vague W0 encore ouvertes, dans l'ordre, avec ancres fichier:ligne vérifiées dans le dépôt (chemins réels) et test de preuve qui tourne (php artisan test --filter …). Commit après chaque tâche, sortie du test dans le message. Coche un ISC via ISATool.ts seulement si sa preuve passe. Pour R-7, ajoute si possible la preuve côté backend (horodatage d'émission de CASH_PAYMENT_RECEIVED) comme preuve partielle, sans cocher ISC-84.
Ne commence pas W1. Pas de revue. Bugs multistop exclus. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas .fullrun.
