---
name: bild-ersetzen
description: Ersetzt ein Bild/eine Grafik in einem Projekt zuverlässig per UMBENENNEN statt Überschreiben — so dass der Tausch garantiert sichtbar wird (kein Browser-/next-image-Cache am gleichen Dateinamen). Use IMMER wenn der User ein Bild tauschen will, z. B. "Bild ersetzen", "Grafik ersetzen", "Bild austauschen", "tausch das Bild/die Grafik", "ersetz die Grafik", "neues Bild rein", "replace image", "Bild hier ändern", "Logo/Foto/Illustration ersetzen" — oder einen Bildpfad schickt mit der Bitte, das aktuelle Bild zu ersetzen.
---

# Bild ersetzen — umbenennen, nicht überschreiben

**Kernregel (warum das sonst immer scheitert):** Ein Bild unter dem **gleichen Dateinamen** zu überschreiben sieht erledigt aus (Bytes stimmen, Server liefert neu) — aber der Browser hält das alte Bild unter derselben URL fest. Das überlebt sogar Cmd+Shift+R, und bei `next/image` greift auch `?v=2` nicht (der Optimizer sucht dann eine Datei mit `?v=2` im Namen). **Lösung: neuer Dateiname → kein Cache kann matchen.**

⛔ Niemals die bestehende Datei am Platz überschreiben. ✅ Immer neue Datei + Referenz umbiegen.

## Ablauf

1. **Quelle + Ziel klären.** Quelle = das neue Bild (Pfad, den der User schickt, oft `~/Downloads/…`). Ziel = die zu ersetzende Datei. Ist das Ziel nicht eindeutig, kurz die Referenz suchen statt raten:
   ```bash
   # alle Code-Referenzen auf den alten Dateinamen finden
   grep -rn "<alter-dateiname>" src app content public next.config.* 2>/dev/null | grep -v node_modules
   ```
2. **Neuen Namen wählen.** Sprechend oder versioniert — nur nie der alte Name. Z. B. `ki-beratung-standard.svg` → `ki-beratung-flow.svg`, oder `hero.jpg` → `hero-2.jpg` / `hero-v3.jpg`. Endung = die der Quelldatei.
3. **Neue Datei schreiben** (echte Bytes, ins selbe Verzeichnis wie das alte Bild):
   ```bash
   cp "<quelle>" "<zielordner>/<neuer-name>"
   ```
4. **Alle Referenzen umbiegen** auf den neuen Namen (jede Fundstelle aus Schritt 1 — `Edit`). Danach die alte Datei entfernen:
   ```bash
   git rm "<zielordner>/<alter-name>" 2>/dev/null || rm -f "<zielordner>/<alter-name>"
   ```
5. **Auf Platte verifizieren** (nicht nur behaupten):
   ```bash
   git status --short <zielordner>          # neue Datei taucht auf, alte ist weg
   md5 -q "<quelle>" "<zielordner>/<neuer-name>"   # zwei identische Hashes = Bytes real kopiert
   grep -rn "<alter-dateiname>" src app content public 2>/dev/null | grep -v node_modules  # MUSS leer sein
   ```
   Stimmt eins davon nicht → Tausch ist NICHT passiert, das melden (nicht „erledigt" sagen).

## Pflicht-Check: existiert die Grafik doppelt?

Manche „Bilder" sind zusätzlich als **Code-/React-Komponente** gebaut (z. B. ein Flow/Diagramm). Ein Datei-Tausch ändert die nie. Kurz prüfen, ob sichtbarer Text aus dem alten Bild auch als echter DOM-/Code-Text existiert:
```bash
grep -rln "<markanter text aus dem alten bild>" src app components 2>/dev/null | grep -v node_modules
```
Findet sich was → dem User sagen: „Dieselbe Grafik gibt's auch als Code-Komponente unter `<pfad>` — soll ich die auch angleichen?" Nicht ungefragt mit-ändern.

## Verifizieren & abschließen

- Läuft ein Dev-Server / Preview: kurz prüfen, dass die neue URL geladen wird (z. B. die `<img src>` zeigt auf den neuen Namen). Coverflow/Slider malen oft nicht in Screenshots — dann per DOM verifizieren statt per Screenshot.
- Antwort kurz: was getauscht wurde + dass die alte Referenz weg ist. Danach anbieten zu veröffentlichen (`/staging`), nicht ungefragt pushen.

## Stil

Knapp. Keine Cache-Theorien breittreten — einfach umbenennen, verifizieren, fertig.
