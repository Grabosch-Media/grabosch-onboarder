# Grabosch Onboarder

Richtet einen Kunden-Mac für die eigene KI-Website ein. Claude führt den Kunden in simplen Schritten durch (GitHub und Vercel CLI verbinden, Grabosch-Setup installieren). Der Kunde braucht null Technik-Wissen.

## Ablauf pro Kunde

1. Dem Kunden die Nachricht aus `START-NACHRICHT.md` schicken
2. Fertig. Claude auf dem Kunden-Mac übernimmt den Rest

## Was drin ist

- `CLAUDE.md` steuert das komplette Onboarding (Schritte, Ton, Technik)
- `setup/rules/grabosch-prinzipien.md` globale Grabosch-Prinzipien, landen in `~/.claude/rules/`
- `setup/skills/bild-ersetzen/` Skill zum Bilder-Austauschen, landet in `~/.claude/skills/`
- `START-NACHRICHT.md` Copy-Paste-Nachricht für den Kunden

## Was das Onboarding NICHT macht

Nichts klonen, keine Website holen, keine Projekte verlinken. Nur verbinden und Setup installieren.

## Pflege

- Neue Regeln oder Skills einfach unter `setup/` ergänzen, das Onboarding installiert alles aus `setup/` automatisch
- Ändert sich der Repo-Name, auch in `START-NACHRICHT.md` anpassen
