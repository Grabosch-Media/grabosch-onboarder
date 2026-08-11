#!/usr/bin/env bash
# Installiert das Grabosch-Setup auf dem Kunden-Mac.
# Idempotent: mehrfach ausführbar, überschreibt nichts Fremdes.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude"

mkdir -p "$DEST/rules" "$DEST/skills"

# Regeln und Skills kopieren
cp -R "$SRC/rules/." "$DEST/rules/"
cp -R "$SRC/skills/." "$DEST/skills/"

# Kunden-Persona in ~/.claude/CLAUDE.md einhängen (Block zwischen Markern)
TARGET="$DEST/CLAUDE.md"
START="<!-- GRABOSCH START (automatisch gepflegt, nicht von Hand aendern) -->"
END="<!-- GRABOSCH END -->"

BLOCKFILE="$(mktemp)"
trap 'rm -f "$BLOCKFILE" "${TMP:-}"' EXIT
{ printf '%s\n' "$START"; cat "$SRC/CLAUDE-kunde.md"; printf '%s\n' "$END"; } > "$BLOCKFILE"

if [ -f "$TARGET" ] && grep -qF "$START" "$TARGET"; then
  # Bestehenden Block ersetzen, Rest der Datei unangetastet lassen
  TMP="$(mktemp)"
  awk -v start="$START" -v end="$END" -v blockfile="$BLOCKFILE" '
    index($0, start) { skip=1; while ((getline line < blockfile) > 0) print line; next }
    skip && index($0, end) { skip=0; next }
    !skip { print }
  ' "$TARGET" > "$TMP"
  mv "$TMP" "$TARGET"
else
  { [ -f "$TARGET" ] && [ -s "$TARGET" ] && printf '\n'; cat "$BLOCKFILE"; } >> "$TARGET"
fi

# Verifizieren
for f in "$DEST/rules/grabosch-prinzipien.md" \
         "$DEST/skills/grabosch/SKILL.md" \
         "$DEST/skills/grabosch-server/SKILL.md" \
         "$DEST/skills/grabosch-staging/SKILL.md" \
         "$DEST/skills/grabosch-veroeffentlichen/SKILL.md" \
         "$DEST/skills/grabosch-neueste-version/SKILL.md" \
         "$DEST/skills/grabosch-website-holen/SKILL.md" \
         "$DEST/skills/bild-ersetzen/SKILL.md" \
         "$TARGET"; do
  [ -f "$f" ] || { echo "FEHLT: $f" >&2; exit 1; }
done
grep -qF "$START" "$TARGET" || { echo "FEHLT: Grabosch-Block in $TARGET" >&2; exit 1; }

echo "Grabosch-Setup installiert."
