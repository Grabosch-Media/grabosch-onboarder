# Start-Nachricht für den Kunden

Das schickt Grabosch dem Kunden (z. B. per WhatsApp). `<website-link>` durch sein GitHub-Repo ersetzen.

---

Kurze Einrichtung, ca. 10 Minuten. Du brauchst nur die Claude-App auf deinem Mac.

1. Leg dir einen leeren Ordner an, z. B. `Website` in deinen Dokumenten
2. Öffne die Claude-App, wähle **Claude Code** und öffne diesen Ordner
3. Stell oben das Modell auf **Opus** und schalte **Bypass Permissions** ein
4. Kopier den Text unten, schick ihn ab und folge einfach den Schritten

```
Bitte mach das Grabosch-Onboarding für mich.

Anleitung: https://github.com/Grabosch-Media/grabosch-onboarder
Meine Website: <website-link>
```

---

## Warum die Nachricht so kurz ist

Die eigentliche Anweisung steht im Onboarder selbst, ganz oben in der `README.md`. Claude öffnet den ersten Link, liest dort, dass es sich das Repo holen und der `CLAUDE.md` folgen soll, und übernimmt von da an Ablauf und Ton. Der Kunde muss nichts Technisches schreiben und nichts verstehen.

Wenn du an dem Anweisungsblock etwas änderst, ändere ihn in der `README.md`, nicht in dieser Nachricht.

## Warum die drei Zeilen davor trotzdem sein müssen

- **Leerer Ordner**, weil die Website genau dorthin geholt wird
- **Claude Code**, nicht der normale Chat, sonst kann Claude nichts auf dem Mac machen
- **Bypass Permissions**, sonst muss der Kunde bei jedem Installationsschritt bestätigen
