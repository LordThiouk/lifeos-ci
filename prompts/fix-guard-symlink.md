# Fix lifeos-guard readonly (symlinks), very short run

Forbidden: `git push`, `gh`. Author: `Papa Diop <76528706+LordThiouk@users.noreply.github.com>`.
Bug: `opencode/lifeos-guard.sh`, `lg_check_readonly`, line ~125: `find "$dir" -xdev -perm /222` also matches **symlinks** (always shown as lrwxrwxrwx, and `chmod -R a-w` does not change them), so the guard fails every time.

1. Replace it with `find "$dir" -xdev ! -type l -perm /222 -print -quit`.
2. Add a case to the guard's test (`rg -l 'lifeos-guard' opencode/tests`): a read-only folder containing a symlink must pass, and a writable file must fail.
3. Run that test, then **commit** (`fix(guard): readonly ignore les liens symboliques`).

Nothing else.
