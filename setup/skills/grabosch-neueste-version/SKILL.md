---
name: grabosch-neueste-version
description: Holt den neuesten Stand der Website auf den Mac, bevor gearbeitet wird (Änderungen von Kollegen oder von Grabosch). Use IMMER wenn der User den aktuellen Stand will oder jemand anders an der Website gearbeitet hat, z. B. "/grabosch-neueste-version", "neueste Version holen", "neuesten Stand holen", "aktuellen Stand holen", "aktualisieren", "hat jemand was geändert", "mein Kollege hat gearbeitet", "Grabosch hat was gemacht", "ist das der neueste Stand", "synchronisieren", "sync", "update holen", "pull" — und IMMER als Erstes, bevor an einer Website gearbeitet wird, an der mehrere Leute arbeiten.
---

# Neuesten Stand holen

Holt, was Kollegen oder Grabosch inzwischen geändert haben. **Immer zuerst machen**, bevor
gearbeitet wird, sonst arbeitet der Kunde auf einem alten Stand.

Zerstört nie etwas Lokales.

## Ablauf

1. **Ansagen.** „Ich hole den neuesten Stand …" Die Website ist der aktuelle Ordner
   (`git rev-parse --show-toplevel`). Kommt nichts zurück → Skill `grabosch-website-holen`.

2. **Fassung prüfen.** `git rev-parse --abbrev-ref HEAD`. Ist es nicht `staging`, still auf
   `staging` wechseln (`git checkout staging 2>/dev/null || git checkout -b staging origin/staging`).
   Schlägt das wegen offener Änderungen fehl → auf der aktuellen Fassung bleiben und weitermachen.

3. **Holen.**
   ```bash
   git fetch origin
   git pull --ff-only --autostash
   ```

4. **Ergebnis lesen.**
   - Neue Änderungen gekommen → wer und wann:
     ```bash
     git log -1 --format='%ad · %an' --date=format:'%d.%m.%Y %H:%M'
     ```
   - Schon aktuell → einfach das sagen.
   - `--ff-only` schlägt fehl (eigene und fremde Änderungen laufen auseinander) → **nichts
     verändern**, kurz melden: es liegen eigene, noch nicht veröffentlichte Änderungen vor.
     Anbieten, sie über `grabosch-test-seite` zu veröffentlichen, das führt beides sauber zusammen.

5. **Läuft eine Vorschau?** Dann kurz sagen, dass sie den neuen Stand automatisch zeigt.

## Antwort

Eine Zeile, mehr nicht:

> ✅ Neuester Stand ist da (zuletzt geändert 11.08.2026 09:14 · Maxim).

oder

> ✅ Du hast schon den neuesten Stand.
