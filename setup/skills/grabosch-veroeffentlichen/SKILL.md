---
name: grabosch-veroeffentlichen
description: Stellt die Änderungen auf die echte, öffentliche Website (live für alle) und hält die Testseite gleich. Use IMMER wenn der User seine Änderungen veröffentlichen will, z. B. "/grabosch-veroeffentlichen", "veröffentlichen", "publish", "live stellen", "live schalten", "online stellen", "hochladen", "für alle sichtbar machen", "auf die echte Website", "auf die richtige Seite", "auf die Hauptseite", "Seite aktualisieren", "Änderungen übernehmen", "fertig, kann raus", "das kann jetzt raus", "wo ist der Veröffentlichen-Button".
---

# Live stellen

Bringt den Stand auf die **echte Website** (öffentlich, für alle sichtbar) und hält die Testseite
auf demselben Stand.

Technisch: erst `staging` hochladen, dann `main` per Fast-Forward nachziehen.
**`main` ist live. Nie force, im Zweifel stoppen und fragen.**

## Ablauf

1. **Ansagen.** Ein Satz: „Ich stelle das jetzt live …"
   Hat der Kunde die Änderung noch nirgends gesehen, davor **eine** kurze Rückfrage anbieten
   („Willst du es vorher kurz in der Vorschau ansehen?"). Sagt er nein oder hat er es schon
   gesehen → durchziehen, nicht weiter nachfragen.

2. **Testseite aktualisieren.** Schritte 2 bis 6 aus dem Skill `grabosch-staging` genau so
   ausführen (richtige Fassung, sichern, Stand der anderen holen, Konflikte, `git push origin staging`).
   Stoppt es dort → hier auch stoppen, nichts live stellen.

3. **Kurzer Sicherheits-Check.** Nur wenn `node_modules` schon da ist (sonst überspringen):
   ```bash
   pnpm build
   ```
   Schlägt der Build fehl → **stoppen, nicht live stellen.** Kurz melden, dass etwas nicht passt,
   Fehlermeldung in einem Block, an Grabosch verweisen. Die Live-Website bleibt dabei unverändert.

4. **Live stellen.**
   ```bash
   git fetch origin main
   git merge-base --is-ancestor origin/main staging
   ```
   - Erfolgreich (Fast-Forward möglich):
     ```bash
     git push origin staging:main
     git fetch origin main:main
     ```
     Nie `--force`.
   - Nicht erfolgreich (die Live-Fassung hat eigene Änderungen) → **stoppen.** Nichts
     überschreiben. Kurz sagen, dass auf der echten Website etwas liegt, das noch fehlt, und an
     Grabosch verweisen.

5. **Adressen melden**, in dieser Reihenfolge:
   - Dateien `.claude/prod-url` und `.claude/staging-url` im Projekt → deren Inhalt.
   - sonst `.vercel/project.json` vorhanden und `vercel whoami` klappt → Adressen via `vercel ls`.
   - sonst nur bestätigen, dass es unterwegs ist.

## Antwort

> ✅ Ist live: https://…
> In 1 bis 2 Minuten ist die Änderung öffentlich sichtbar. Die Testseite ist auf demselben Stand.

Keine langen Berichte.

## Harte Regeln

- Niemals `git push --force`, egal was passiert.
- Niemals direkt auf der Live-Fassung committen.
- Bei Konflikt, fehlgeschlagenem Build oder abweichender Live-Fassung: **stoppen und fragen**,
  nicht raten. Lieber nicht veröffentlicht als kaputt veröffentlicht.
