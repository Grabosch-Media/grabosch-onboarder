---
name: grabosch-website-holen
description: Holt die eigene Website einmalig auf den Mac und legt den Ordner dafür an, danach ist sie bearbeitbar. Use IMMER wenn der User seine Website noch nicht lokal hat oder sie nicht findet, z. B. "/grabosch-website-holen", "Website auf meinen Mac holen", "Website herunterladen", "Projekt holen", "klonen", "clone", "einrichten", "wo ist meine Website", "ich finde meine Website nicht", "ich will anfangen", "erste Einrichtung", "Website öffnen aber da ist nichts", "neuer Rechner".
---

# Website auf den Mac holen

Einmal pro Mac. Danach liegt die Website in einem festen Ordner und alle anderen Befehle
funktionieren.

## Ablauf

1. **Prüfen, ob sie schon da ist.**
   ```bash
   ls ~/Grabosch 2>/dev/null
   ```
   Ist die Website schon da → nicht neu holen, stattdessen `grabosch-neueste-version`.

2. **Welche Website.** Verbundene Projekte auflisten und den Kunden wählen lassen, wenn es
   mehrere sind:
   ```bash
   gh repo list --limit 30 --json name,owner,updatedAt --jq '.[] | "\(.owner.login)/\(.name)"'
   ```
   - Genau ein Treffer → den nehmen, nur kurz bestätigen lassen.
   - Kein Treffer → nach dem Link fragen („Grabosch hat dir einen Link zu deiner Website
     geschickt, meist in eurer WhatsApp-Gruppe. Schick ihn mir kurz.").

3. **Holen.**
   ```bash
   mkdir -p ~/Grabosch
   git clone <link> ~/Grabosch/<name>
   cd ~/Grabosch/<name>
   git checkout staging 2>/dev/null || git checkout -b staging origin/staging
   ```
   Es wird bewusst die Testseite-Fassung genommen, nicht die Live-Fassung.

4. **Bausteine installieren** (dauert 1 bis 2 Minuten, dem Kunden in einem Satz sagen):
   ```bash
   command -v pnpm >/dev/null || corepack enable pnpm 2>/dev/null || npm install -g pnpm
   pnpm install || pnpm install --no-frozen-lockfile
   ```

5. **Prüfen**, dass wirklich alles da ist (`ls package.json`, `git status`), erst dann fertig melden.

## Antwort

> ✅ Deine Website liegt jetzt in `~/Grabosch/<name>`.
> Sag „Vorschau starten", dann zeige ich sie dir.

## Hinweis für die nächsten Male

Ein Mal holen reicht. Ab dann immer mit `grabosch-neueste-version` starten, nicht neu holen.
