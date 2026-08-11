#!/usr/bin/env bash
# Onboarding einmal selbst durchspielen, ohne die eigene Einrichtung zu verlieren.
#
#   bash kundentest.sh              Testordner anlegen, CLAUDE.md sichern
#   bash kundentest.sh aufraeumen   alles zuruecksetzen
#
# Warum kein Fake-HOME: Claude Code haengt seine Anmeldung an einen Hash des
# Config-Ordners. Mit fremdem HOME oder CLAUDE_CONFIG_DIR ist man ausgeloggt und
# kommt ohne neuen Login nicht rein. Deshalb laeuft der Test in der normalen
# Einrichtung, und dieses Script macht ihn rueckgaengig.
set -euo pipefail

BOX="$HOME/Grabosch-Kundentest"
CFG="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
BACKUP="$BOX/CLAUDE.md.backup"
MARKER="<!-- GRABOSCH START (automatisch gepflegt, nicht von Hand aendern) -->"

if [ "${1:-}" = "aufraeumen" ]; then
  # Kunden-Block aus der eigenen CLAUDE.md entfernen
  if [ -f "$CFG/CLAUDE.md" ] && grep -qF "$MARKER" "$CFG/CLAUDE.md"; then
    if [ -f "$BACKUP" ]; then
      cp "$BACKUP" "$CFG/CLAUDE.md"
      echo "CLAUDE.md aus dem Backup wiederhergestellt."
    else
      TMP="$(mktemp)"
      awk -v s="$MARKER" -v e="<!-- GRABOSCH END -->" '
        index($0,s){skip=1} !skip{print} skip && index($0,e){skip=0}
      ' "$CFG/CLAUDE.md" > "$TMP"
      mv "$TMP" "$CFG/CLAUDE.md"
      echo "Grabosch-Block aus CLAUDE.md entfernt."
    fi
  fi
  rm -f "$CFG/rules/grabosch-prinzipien.md"
  rm -rf "$BOX"
  echo "Aufgeraeumt. Die grabosch-Skills in $CFG/skills bleiben liegen, die stoeren nicht."
  exit 0
fi

mkdir -p "$BOX/website"
[ -f "$CFG/CLAUDE.md" ] && cp "$CFG/CLAUDE.md" "$BACKUP"

cat <<EOF

Testumgebung steht.

  Website-Ordner: $BOX/website   (leer, wie beim Kunden)
  Backup:         ${BACKUP}

1. Neues Terminal-Fenster, diese Zeile:

     cd "$BOX/website" && claude --dangerously-skip-permissions

2. Als erste Nachricht genau das schicken, was der Kunde schickt:

     Bitte mach das Grabosch-Onboarding fuer mich.

     Anleitung: https://github.com/Grabosch-Media/grabosch-onboarder
     Meine Website: <website-link>

3. Danach ausprobieren: /grabosch, dann /grabosch-lokal-server, dann eine
   Aenderung sagen. NICHT veroeffentlichen, das waere eine echte Kundenseite.

4. Hinterher zuruecksetzen:

     bash kundentest.sh aufraeumen

Was im Test anders ist als beim Kunden
  - deine eigene CLAUDE.md und deine Skills sind da und reden mit
  - GitHub, Vercel, node und pnpm sind schon eingerichtet, Schritt 1 bis 3
    laufen deshalb fast leer durch

EOF
