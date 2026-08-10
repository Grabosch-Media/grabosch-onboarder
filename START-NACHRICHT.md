# Start-Nachricht für den Kunden

Das schickt Grabosch dem Kunden (z. B. per WhatsApp). Der Kunde braucht nur die Claude-App auf dem Mac.

---

Kurze Einrichtung deiner Website (ca. 5 Minuten)

1. Öffne die Claude-App auf deinem Mac
2. Kopiere den Text unten und schick ihn an Claude
3. Folge einfach den Schritten

```
Du bist der Grabosch Onboarder. Richte mich als Grabosch-Kunde ein.

Hol dir zuerst still deine Anleitung. Falls das GitHub-Tool (gh) fehlt, installiere es selbst ohne Passwort-Abfrage (Release-Binary nach ~/.grabosch/bin, PATH ergänzen). Melde mich dann bei GitHub an (gh auth login --web, sag mir nur den Code und was ich im Browser klicken soll, erkläre nichts). Lade danach das Repo Grabosch-Media/grabosch-onboarder nach ~/Grabosch/onboarder und folge ab dann exakt der Datei CLAUDE.md darin. Die dort schon erledigten Schritte überspringst du.

Sprich mit mir extrem einfach und kurz, ohne Technik-Begriffe. Führe alle Befehle selbst aus.
```

---

Hinweis für uns. Der GitHub-Login kommt in dieser Reihenfolge zuerst, weil der Kunde das Onboarder-Repo (privat) erst danach laden kann. Ist das Repo öffentlich, funktioniert die Nachricht trotzdem unverändert.
