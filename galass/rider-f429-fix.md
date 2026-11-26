# Rider — fix ISC-F4-29 a-b profil chauffeur RUNNING (Artemis BLOCK)

Dépôt Galass_Rider, branche **build/rider-f429** (= feat tip goldens 3.50.1). ISA multistop.

Artemis `45782061889` : goldens VERTS ; **1 fail** — `course_en_cours_contract_test.dart` ISC-F4-29 a-b (avatar, nom, note chauffeur en RUNNING). Les items c-h passent.

Corrige UNIQUEMENT pour que ISC-F4-29 a-b soit vert (`flutter test` sur ce fichier). Ne régénère aucun golden. Coche/preuve ISA si OK. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`.
