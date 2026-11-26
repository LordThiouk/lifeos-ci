# Rider — APK Artemis FAIL sous Flutter 3.50.1 (Gradle/AGP trop récents)

Dépôt **Galass_Rider**, branche **build/rider-apk-gradle** (depuis feat/multistop-e2e-2026-11-15 @ tip F4-29).

Artemis `45801376130` : étape unitaires VERTES ; **Build APK Rider** ROUGE — validation dépendances Android Flutter 3.50.1 refuse le toolchain Rider actuel :
- `android/gradle/wrapper/gradle-wrapper.properties` → **Gradle 9.1.0**
- `android/settings.gradle.kts` → **AGP 9.0.1**

Driver (vert APK sous le même Artemis/Flutter 3.50.1) utilise **Gradle 8.14** (+ AGP ~8.11).

Fais UNIQUEMENT : aligner le toolchain Android Rider sur ce que **Flutter 3.50.1** accepte (cible : Gradle **8.14** + AGP/Kotlin compatibles, calqués sur Driver si possible, sans casser Firebase/Crashlytics). Pas de changement `lib/`. **Interdit** `flutter build` / `gradlew` sur la box — commits + note dans message. Auteur Papa Diop <76528706+LordThiouk@users.noreply.github.com>. Pas de git push. Ne touche pas `.fullrun`. Ne régénère aucun golden.
