# Galass Rider — close the multistop ISA (UI fixes + proofs). Work ONLY on branch feat/multistop-e2e-2026-11-15. Commit after each ISC.

Forbidden: push, merge into main, `gh` write commands, deploy, store submit, touching any branch other than this one, editing other repos. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`. ISA edits only through ISATool.ts if present; keep human tick rules.
Context: galass-ci branch state/galass-2026-11-25 file GALASS-STATE.md sections (a)(b)(c)(d) item 2 is the source of truth for what remains (read it via the extra repo galass-ci). The Galass client has not paid the balance: fix ONLY multistop items, nothing else.
0. If `flutter` is missing, install the version pinned by the repo (fvm/.flutter-version/pubspec) and run `flutter pub get`. Run `flutter test` once to get the baseline; record it.
1. Flip/fix widget tests F4-17/F4-20/F4-25 (`multistop_itinerary_test.dart:116-185`, `multistop_running_sheet_test.dart:133-233`) so they assert the intended multistop behaviour.
2. F4-21: numbered stop markers for all stops with the active index (carrier `RideStopProgress`), without changing `loadMap`; unit test.
3. Complete contract test F4-29 elements c-h; prove F4-22/25/26/27 with widget tests.
4. F4-30: regenerate goldens so `course_en_cours_simple` and `tous_arrets_faits` differ (distinct sha); F4-31: add an ACTIVE golden.
5. F4-28 (SOS / pickup CTA during ACTIVE): DO NOT implement — needs Papa's decision; write the options in the ISA notes.
6. After each item: `flutter test` green, commit "fix(multistop): <ISC>", tick the ISC with proof (test name + commit). End with a short report RIDER-MULTISTOP.md: ISCs closed, still open, test counts before/after. Stop.
