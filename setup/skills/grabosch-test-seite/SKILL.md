---
name: grabosch-test-seite
description: Stellt den aktuellen Stand auf die Testseite (interne Vorschau-Adresse zum Teilen) — noch NICHT auf die echte Website. Use IMMER wenn der User seinen Stand intern zeigen oder testen will, z. B. "/grabosch-test-seite", "auf die Testseite", "Testseite", "Testlink", "Vorschau-Link", "Zwischenlink", "Zwischenstand", "intern veröffentlichen", "für die Kollegen veröffentlichen", "meinem Team zeigen", "meinem Chef zeigen", "erstmal testen", "noch nicht live", "Entwurf online stellen", "zum Abstimmen hochladen", "Link zum Zeigen", "staging".
---

# Auf die Testseite stellen

Bringt den Stand auf die **Testseite**. Das ist eine eigene Adresse zum Herumzeigen und
Abstimmen. Die echte Website bleibt unberührt.

Technisch: Branch `staging`. **Niemals `main` anfassen.**

## Ablauf

1. **Ansagen.** Ein Satz: „Ich stelle das jetzt auf die Testseite …"
   Die Website ist der aktuelle Ordner (`git rev-parse --show-toplevel`).

2. **Richtige Fassung.** `git rev-parse --abbrev-ref HEAD`
   - `staging` → weiter.
   - anderer Branch → wechseln, offene Änderungen kommen mit:
     ```bash
     git fetch origin
     git checkout staging 2>/dev/null || git checkout -b staging origin/staging
     ```
     Schlägt der Wechsel wegen offener Änderungen fehl → **stoppen**, nichts erzwingen, kurz
     melden und an Grabosch verweisen.

3. **Änderungen sichern.** Zeigt `git status --porcelain` etwas:
   ```bash
   git add -A
   ```
   Dann committen mit einer kurzen, **deutschen** Message, die aus dem Diff kommt (kein
   generisches „update", keine Gedankenstriche). Nichts geändert → kein Commit, trotzdem
   weiter (vielleicht liegt noch etwas Ungepushtes da).

4. **Stand der anderen holen.**
   ```bash
   git fetch origin staging
   git rev-list --left-right --count origin/staging...HEAD
   ```
   Ausgabe ist „\<behind\> \<ahead\>".
   - `behind == 0` → direkt zu Schritt 6.
   - `behind > 0` → `git pull --no-rebase origin staging`.

5. **Konflikte.** Bei Konflikten (`git diff --name-only --diff-filter=U`) jede Datei lesen und so
   zusammenführen, dass **beide Seiten erhalten** bleiben (eigener Stand und der des Kollegen),
   Marker sauber entfernen → `git add <dateien>` → `git commit --no-edit`.
   **Nicht eindeutig lösbar → stoppen, nichts hochladen**, Konflikt kurz zeigen und fragen.

6. **Hochladen.**
   ```bash
   git push origin staging
   ```
   Nie `--force`.

7. **Adresse melden**, in dieser Reihenfolge:
   - Datei `.claude/staging-url` im Projekt → deren Inhalt.
   - sonst `.vercel/project.json` vorhanden und `vercel whoami` klappt → jüngste `staging`-Adresse via `vercel ls`.
   - sonst nur bestätigen, dass es unterwegs ist, und sagen, dass Grabosch die Testadresse kennt.

## Antwort

> ✅ Ist auf der Testseite: https://…
> In 1 bis 2 Minuten ist sie dort aktuell. Die echte Website hat sich nicht geändert.

Keine langen Berichte. Nur bei Konflikt oder Fehler kurz erklären, was los ist.

## Danach

Fragt der Kunde danach „und jetzt live" oder „für alle sichtbar" → `grabosch-veroeffentlichen`.
