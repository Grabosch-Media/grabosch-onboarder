# Grabosch Onboarder

Richtet einen Kunden-Mac für die eigene KI-Website ein. Claude führt den Kunden in simplen Schritten durch (GitHub und Vercel CLI verbinden, Grabosch-Setup installieren). Der Kunde braucht null Technik-Wissen.

## Ablauf pro Kunde

1. Dem Kunden die Nachricht aus `START-NACHRICHT.md` schicken
2. Fertig. Claude auf dem Kunden-Mac übernimmt den Rest

## Was drin ist

- `CLAUDE.md` steuert das komplette Onboarding (Schritte, Ton, Technik)
- `setup/install.sh` installiert alles aus `setup/`, idempotent und selbstprüfend
- `setup/CLAUDE-kunde.md` Kunden-Persona, landet als Block in `~/.claude/CLAUDE.md`
- `setup/rules/grabosch-prinzipien.md` globale Grabosch-Prinzipien, landen in `~/.claude/rules/`
- `setup/skills/` die Kunden-Skills, landen in `~/.claude/skills/`

## Die Kunden-Skills

Alle unter dem Präfix `grabosch`, der Kunde tippt `/grabosch` und sieht sie alle.

- `grabosch` Hauptskill, Übersicht plus Ton und harte Regeln
- `grabosch-server` Vorschau auf dem Mac (Localhost)
- `grabosch-staging` auf die Testseite
- `grabosch-veroeffentlichen` live stellen (Testseite plus echte Website)
- `grabosch-neueste-version` neuesten Stand holen
- `grabosch-website-holen` Website einmalig auf den Mac holen
- `bild-ersetzen` Bild austauschen

Warum Skills und nicht freie Prompts: der Kunde sucht den Veröffentlichen-Button. Ein Skill macht den Ablauf jedes Mal gleich und lässt nichts aus, freies „push das mal hoch" nicht.

## Was das Onboarding NICHT macht

Nichts klonen, keine Website holen, keine Projekte verlinken. Nur verbinden und Setup installieren. Die Website holt der Kunde danach selbst per `grabosch-website-holen`.

## Pflege

- Neue Regeln oder Skills einfach unter `setup/` ergänzen, `install.sh` nimmt alles aus `setup/` mit. Neue Pflicht-Dateien in die Verifizieren-Schleife am Ende des Scripts eintragen
- Neuer Skill heißt immer `grabosch-<was er tut>`, mit vielen Kunden-Synonymen in der `description`. Danach die Liste im Skill `grabosch`, im Abschluss-Text in `CLAUDE.md` und hier ergänzen
- Ändert sich der Repo-Name, auch in `START-NACHRICHT.md` anpassen
