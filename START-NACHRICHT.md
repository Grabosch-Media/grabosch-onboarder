# Start-Nachricht für den Kunden

Das schickt Grabosch dem Kunden (z. B. per WhatsApp). `<website-link>` durch sein GitHub-Repo ersetzen.

---

Kurze Einrichtung, ca. 10 Minuten. Du brauchst nur die Claude-App auf deinem Mac.

1. Leg dir einen leeren Ordner an, z. B. `Website` im Dokumente-Ordner
2. Öffne die Claude-App, wähle **Claude Code** und öffne diesen Ordner
3. Stell oben das Modell auf **Opus** und schalte **Bypass Permissions** ein
4. Kopier den Text unten, schick ihn ab und folge einfach den Schritten

```
Bitte mach das Grabosch-Onboarding.

Anleitung: https://github.com/Grabosch-Media/grabosch-onboarder
Meine Website: <website-link>

Lade dir die Anleitung still nach ~/.grabosch/onboarder (das Repo ist öffentlich, als ZIP per curl, dafür brauchst du keine Tools) und folge dann exakt der Datei CLAUDE.md darin. Sprich mit mir extrem einfach und kurz, ohne Technik-Begriffe, und führe alle Befehle selbst aus.
```

---

## Warum die drei Zeilen davor wichtig sind

- **Leerer Ordner**, weil die Website genau dorthin geholt wird. Liegt schon etwas drin, klemmt es.
- **Bypass Permissions**, sonst muss der Kunde bei jedem Installationsschritt bestätigen.
- **Anleitung nach `~/.grabosch/onboarder`**, damit sie nicht im Website-Ordner liegt und diesen blockiert.
