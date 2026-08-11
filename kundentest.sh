#!/usr/bin/env bash
# Baut eine Wegwerf-Umgebung, in der das Onboarding sich anfuehlt wie beim Kunden.
# Aendert nichts an der eigenen Einrichtung. Loeschen reicht zum Aufraeumen.
set -euo pipefail

BOX="${1:-$HOME/Grabosch-Kundentest}"

if [ -e "$BOX" ]; then
  printf 'Ordner existiert schon: %s\nLoeschen und neu anlegen? [j/N] ' "$BOX"
  read -r a
  [ "$a" = "j" ] || { echo "Abgebrochen."; exit 1; }
  rm -rf "$BOX"
fi

mkdir -p "$BOX/home" "$BOX/website"

cat <<EOF

Testumgebung steht.

  Fake-Zuhause:   $BOX/home
  Website-Ordner: $BOX/website   (leer, wie beim Kunden)

So startest du den Test. Ein neues Terminal-Fenster, dann diese eine Zeile
(sie wechselt in den leeren Website-Ordner und startet Claude Code darin):

  cd "$BOX/website" && HOME="$BOX/home" claude

Danach schickst du genau die Kundennachricht:

  Bitte mach das Grabosch-Onboarding fuer mich.

  Anleitung: https://github.com/Grabosch-Media/grabosch-onboarder
  Meine Website: <website-link>

Was dabei echt frisch ist
  - keine Skills, keine Regeln, keine CLAUDE.md
  - GitHub und Vercel sind nicht angemeldet, du machst die Anmeldung wie ein Kunde

Was NICHT frisch ist
  - node, pnpm und brew liegen systemweit und bleiben sichtbar, Schritt 1 faellt
    deshalb kuerzer aus als beim Kunden
  - Claude Code selbst kann nach dem Login fragen, das ist normal

Aufraeumen
  rm -rf "$BOX"

EOF
