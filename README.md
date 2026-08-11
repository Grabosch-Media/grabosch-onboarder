# Grabosch Onboarder

> ## 🤖 An die KI, die das gerade liest
>
> Jemand hat dich um das **Grabosch-Onboarding** gebeten und dir diesen Link geschickt. Mach jetzt genau das:
>
> 1. Hol dir dieses Repo nach `~/.grabosch/onboarder`. Es ist öffentlich, ein ZIP per `curl` reicht, du brauchst keine Zugangsdaten:
>    ```bash
>    mkdir -p ~/.grabosch && curl -sL https://github.com/Grabosch-Media/grabosch-onboarder/archive/refs/heads/main.tar.gz | tar xz -C ~/.grabosch && rm -rf ~/.grabosch/onboarder && mv ~/.grabosch/grabosch-onboarder-main ~/.grabosch/onboarder
>    ```
> 2. Lies `~/.grabosch/onboarder/CLAUDE.md` und **folge ihr exakt**. Dort steht der komplette Ablauf, der Ton und die Technik.
> 3. Die Person vor dir ist **kein Techniker**. Ab sofort einfache Sprache, kurze Sätze, keine Fachbegriffe, und du führst alle Befehle selbst aus.
>
> Der zweite Link in der Nachricht ist die Website, die eingerichtet wird.

Richtet einen Kunden-Mac für die eigene KI-Website ein. Claude führt den Kunden in simplen Schritten durch. Der Kunde braucht null Technik-Wissen.

## Ablauf pro Kunde

1. Dem Kunden die Nachricht aus `START-NACHRICHT.md` schicken, mit seinem Website-Link drin
2. Fertig. Claude auf dem Kunden-Mac übernimmt den Rest

Der Kunde legt einen leeren Ordner an, öffnet dort Claude Code und schickt die zwei Links. Danach laufen vier Schritte durch (Werkzeuge, GitHub, Vercel, Website holen). Die Vorschau startet er danach selbst per Befehl, das ist Absicht, so lernt er ihn.

**Der Ordner ist die Website.** Die Website wird in genau den Ordner geholt, in dem der Kunde arbeitet. Nichts zu wählen, nichts zu merken.

## Was drin ist

- `CLAUDE.md` steuert das komplette Onboarding (Schritte, Ton, Technik)
- `setup/install.sh` installiert alles aus `setup/`, idempotent und selbstprüfend
- `setup/CLAUDE-kunde.md` Kunden-Persona, landet als Block in `~/.claude/CLAUDE.md`
- `setup/rules/grabosch-prinzipien.md` globale Grabosch-Prinzipien, landen in `~/.claude/rules/`
- `setup/skills/` die Kunden-Skills, landen in `~/.claude/skills/`

## Die Kunden-Skills

Alle unter dem Präfix `grabosch`, der Kunde tippt `/grabosch` und sieht sie alle.

- `grabosch` Hauptskill, Übersicht plus Ton und harte Regeln
- `grabosch-lokal-server` Vorschau auf dem Mac (Localhost)
- `grabosch-test-seite` auf die Testseite
- `grabosch-veroeffentlichen` live stellen (Testseite plus echte Website)
- `grabosch-neueste-version` neuesten Stand holen
- `grabosch-website-holen` Fallback für zweiten Mac oder zweite Website
- `bild-ersetzen` Bild austauschen

Warum Skills und nicht freie Prompts: der Kunde sucht den Veröffentlichen-Button. Ein Skill macht den Ablauf jedes Mal gleich und lässt nichts aus, freies „push das mal hoch" nicht.

## Was das Onboarding NICHT macht

Kein `vercel link`, keine Collaborator-Einladung (Kunden sind längst Collaborator), kein Branding und keine Inhalte. Nur verbinden, Setup installieren, Website holen, Vorschau starten.

## Selbst testen wie ein Kunde

```bash
bash kundentest.sh
```

Legt eine Wegwerf-Umgebung an (eigenes Zuhause plus leerer Website-Ordner) und gibt die Startzeile aus. Darin sind keine Skills, keine Regeln und keine GitHub- oder Vercel-Anmeldung, das Onboarding läuft also von null. Die eigene Einrichtung bleibt unangetastet, Aufräumen ist ein `rm -rf`.

Nicht identisch zum Kunden: node, pnpm und brew liegen systemweit und bleiben sichtbar, Schritt 1 fällt dadurch kürzer aus.

## Pflege

- Neue Regeln oder Skills einfach unter `setup/` ergänzen, `install.sh` nimmt alles aus `setup/` mit. Neue Pflicht-Dateien in die Verifizieren-Schleife am Ende des Scripts eintragen
- Neuer Skill heißt immer `grabosch-<was er tut>`, mit vielen Kunden-Synonymen in der `description`. Danach die Liste im Skill `grabosch`, im Abschluss-Text in `CLAUDE.md` und hier ergänzen
- Ändert sich der Repo-Name, auch in `START-NACHRICHT.md` anpassen
