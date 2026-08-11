---
name: grabosch-website-holen
description: Holt die Website in den aktuellen Ordner, wenn sie dort noch nicht liegt (neuer Mac, neuer Ordner, zweite Website). Use IMMER wenn im aktuellen Ordner keine Website liegt oder der User sie nicht findet, z. B. "/grabosch-website-holen", "Website auf meinen Mac holen", "Website herunterladen", "Projekt holen", "klonen", "clone", "einrichten", "wo ist meine Website", "ich finde meine Website nicht", "ich will anfangen", "hier ist ja nichts", "neuer Rechner", "zweite Website".
---

# Website in diesen Ordner holen

Normalerweise ist das beim Onboarding schon passiert. Dieser Befehl ist für den zweiten Mac,
einen neuen Ordner oder eine zweite Website.

## Ablauf

1. **Erst prüfen, ob sie schon da ist.**
   ```bash
   git rev-parse --show-toplevel 2>/dev/null && ls package.json 2>/dev/null
   ```
   Beides da → nicht neu holen, stattdessen `grabosch-neueste-version`.

2. **Welche Website.** Hat der Kunde einen Link geschickt, den nehmen. Sonst seine Projekte
   auflisten und wählen lassen:
   ```bash
   gh repo list --limit 30 --json name,owner --jq '.[] | "\(.owner.login)/\(.name)"'
   ```
   - Genau ein Treffer → den nehmen, nur kurz bestätigen lassen.
   - Kein Treffer → nach dem Link fragen („Grabosch hat dir einen Link zu deiner Website
     geschickt, meist in eurer WhatsApp-Gruppe. Schick ihn mir kurz.").

3. **In den aktuellen Ordner holen.** Über einen Zwischenordner, weil `git clone .` einen leeren
   Ordner verlangt und der es fast nie ist:
   ```bash
   TMP=$(mktemp -d)
   git clone <link> "$TMP/site"
   rsync -a "$TMP/site/" .
   rm -rf "$TMP"
   ```
   Liegt im Ordner bereits ein anderes Git-Projekt → **stoppen**, nicht drüberbügeln.

4. **Auf die Testseite-Fassung stellen**, bewusst nicht auf die Live-Fassung:
   ```bash
   git checkout staging 2>/dev/null || git checkout -b staging origin/staging
   ```

5. **Bausteine installieren** (dauert 1 bis 2 Minuten, dem Kunden in einem Satz sagen):
   ```bash
   command -v pnpm >/dev/null || corepack enable pnpm 2>/dev/null || npm install -g pnpm
   pnpm install || pnpm install --no-frozen-lockfile
   ```
   Kommt `ERR_PNPM_IGNORED_BUILDS`, steht in `pnpm-workspace.yaml` noch der alte Schlüssel
   `onlyBuiltDependencies`. Auf `allowBuilds` umschreiben (Icon-Pakete `false`, Rest `true`) und
   erneut installieren, sonst bricht später `pnpm dev` ab.

6. **Prüfen** (`ls package.json`, `git status`), erst dann fertig melden.

## Antwort

> ✅ Deine Website liegt jetzt in diesem Ordner.
> Sag „Vorschau starten", dann zeige ich sie dir.

## Hinweis für die nächsten Male

Ein Mal holen reicht. Ab dann immer mit `grabosch-neueste-version` starten, nicht neu holen.
