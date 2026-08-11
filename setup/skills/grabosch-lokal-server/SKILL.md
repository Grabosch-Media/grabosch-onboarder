---
name: grabosch-lokal-server
description: Startet die Vorschau der eigenen Website auf dem Mac (lokaler Server) und nennt die Adresse zum Anschauen. Use IMMER wenn der User seine Website ansehen oder testen will, z. B. "/grabosch-lokal-server", "Vorschau starten", "Vorschau", "Server starten", "lokaler Server", "localhost", "local host", "Seite anzeigen", "zeig mir die Website", "wie sieht das aus", "kann ich das sehen", "Website starten", "lokal ansehen", "Vorschau öffnen", "Seite öffnen", "ich will das sehen bevor ich es veröffentliche", "Änderung anschauen".
---

# Vorschau starten

Startet die Website auf dem Mac des Kunden, damit er Änderungen sofort sieht.
Diese Vorschau sieht **nur er** — nichts davon ist online.

## Ablauf

1. **Website ist der aktuelle Ordner.** `git rev-parse --show-toplevel` plus `package.json`.
   Kommt nichts zurück → Skill `grabosch-website-holen`. Ein Satz vorweg, an welcher Website du
   die Vorschau startest.

2. **Läuft schon eine Vorschau?** Erst prüfen, nie doppelt starten.
   ```bash
   lsof -nP -iTCP:3000 -sTCP:LISTEN | head -3
   ```
   Läuft etwas → nur die Adresse nennen, fertig.

3. **Bausteine da?** Fehlt `node_modules`, einmal installieren (dauert 1 bis 2 Minuten, dem
   Kunden in einem Satz sagen):
   ```bash
   command -v pnpm >/dev/null || corepack enable pnpm 2>/dev/null || npm install -g pnpm
   pnpm install || pnpm install --no-frozen-lockfile
   ```

4. **Vorschau starten.** Zuerst über die Projekt-Konfiguration, das ist der saubere Weg:
   - `.claude/launch.json` ist vorhanden → `preview_start` mit dem Namen `dev`.
   - Kein `preview_start` verfügbar oder kein `launch.json` → im Hintergrund starten:
     ```bash
     pnpm dev
     ```
     (als Hintergrund-Prozess, nicht blockierend) und die Startausgabe nach der Adresse lesen.

5. **Adresse melden.** Die echte Adresse aus der Startausgabe nehmen, nicht raten. Der Port ist
   meist 3000, kann aber abweichen.

6. **Fehler beim Start** → nicht dem Kunden erklären, selbst beheben (häufigster Fall, fehlende
   Bausteine aus Schritt 3). Geht es nicht, Fehlermeldung in einem Block zeigen und an Grabosch
   verweisen.

## Antwort

Kurz, zwei Zeilen:

> ✅ Deine Vorschau läuft: http://localhost:3000
> Änderungen erscheinen dort sofort, du musst nichts neu laden.

## Danach

- Vorschau läuft weiter, während gearbeitet wird. Nicht ungefragt beenden.
- Die Vorschau ist nicht online. Will der Kunde den Stand jemandem zeigen → `grabosch-test-seite`.
- Will er ihn für alle sichtbar machen → `grabosch-veroeffentlichen`.
