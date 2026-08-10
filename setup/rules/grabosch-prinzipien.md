# Web-Projekt-Prinzipien (global, Grabosch)

Gelten fuer alle Website-Projekte. Jedes Projekt kann einzelne Prinzipien in seiner `CLAUDE.md` oder `DESIGN.md` ueberschreiben. Bei Konflikt gewinnt IMMER das Projekt, nicht diese Datei.

## Branch-Workflow

- `development` -> interner Arbeits- und Publish-Branch (Grabosch arbeitet hier)
- `staging` -> Kundenvorschau. Hierauf pushen, wenn der Kunde den Stand sehen soll
- `main` -> Live-Seite (Production). Nie ungefragt pushen

## Container (horizontal)

- Genau drei Container-Breiten. `large` (Standard), `medium`, `small`.
- Custom-Container sind erlaubt, aber die seltene Ausnahme fuer Spezial-Sektionen.
- Fullscreen-Bilder sind nicht an Container gebunden.

## Buttons, KEINE Outlines

- NIEMALS Outline-Buttons (transparenter Button mit 1px-Rahmen drumherum). Das ist ein typisches KI-Muster und bei uns verboten.
- Sekundaer-Aktionen bekommen stattdessen eine gefuellte Flaeche (z. B. Secondary-/Muted-Ton, auf Bildern transluzentes Weiss) oder sind ghost (transparent, Hover fuellt).
- Es gibt IMMER drei Fuell-Varianten: Primary, Secondary und ALTERNATIVE. Der Alternative-Button steht ANSTELLE des Primary (nie daneben), wenn die Hauptaktion einer Stelle keine Conversion-Aktion ist (z. B. "Mehr ansehen" bei Referenzen). Farbe: im Light Mode einfach Schwarz, im Dark Mode einfach Weiss, mit echten Hover-/Active-Stufen.
- Gilt auch fuer Chips, Cards und Inputs. Abgrenzung ueber Flaechenfarbe oder weichen Schatten, nicht ueber sichtbare Rahmenlinien.
- Genau ZWEI Button-Groessen. Normal und klein. Keine lg-/xl-Varianten.
- Icon-only-Buttons fast nie (Ausnahmen z. B. Hamburger, Carousel-Pfeile). Icons sonst immer mit Text im Button.
- Button-Padding. Links/rechts standardmaessig doppelt so viel Platz wie oben/unten, AUCH mit Icon im Button. Grosszuegig polstern, im Zweifel mehr Padding.
- Gap zwischen Text und Icon: halb so gross wie der Platz an den Seiten (meist gleich dem Platz oben/unten, aber ueber die Seiten definieren).
- Icons im Button IMMER rechts vom Text, nie links (ausser explizit anders verlangt).
- Gleicher Button-Text = gleiches Icon. Ein Button-Wording (z. B. "Termin buchen") hat ueberall auf der Seite dasselbe Icon.
- Konsistentes Button-Wording. Alle Main-CTAs haben denselben Text, und jeder Button mit gleicher Aussage hat ueberall dasselbe Wording. Einmal pro Projekt festlegen, nie pro Sektion neu formulieren.
- Das CTA-PAAR ist ueberall dasselbe (Liam 28.07.2026). Nicht nur der Primary, auch der Button DANEBEN traegt an jeder Stelle dasselbe Wording, denselben Link und dasselbe Icon. Heisst das Paar im Hero "Kostenloses Erstgespraech" plus "Referenzen ansehen", steht in jeder weiteren CTA-Zeile exakt dieses Paar. Nie pro Sektion eine neue Zweitaktion erfinden (kein "Oder direkt anrufen" nur weil die Sektion gerade nach Naehe klingt). Das Paar einmal pro Projekt festlegen, danach nur noch einsetzen.
- Ausnahmen sind selten und begruendet. Ein "Mehr ansehen" direkt an einer Referenzliste oder der kuerzere Nav-Button sind ok, alles andere ist einfach das Standard-Paar. Zweitkanaele wie die Telefonnummer laufen als Textzeile unter den Buttons, nicht als eigener CTA-Button.
- Wording nach Kaufbereitschaft (Schwelle). Die Hauptseite spricht EINE Schwelle an, danach richtet sich das CTA-Wording. Sehr kaufbereite Zielgruppe kann direkt "Termin buchen" bekommen, weniger warme eher niederschwellig "Kostenloses Erstgespraech". Pro Projekt einmal die passende Stufe waehlen.
- Ausnahme Nav. Der Nav-Button darf ein eigenes, kuerzeres Wording tragen (z. B. "Erstgespraech"), auch wenn die CTAs im Content anders heissen. Was Sinn macht, im Einzelfall entscheiden.
- Focus-State: schlichte 1px-Outline in auffaelliger Farbe (z. B. Schwarz) mit Offset. Keine Glow-/Doppelringe, das sieht nach KI aus.
- Klick-State (active) ist Pflicht: echte dunklere Farbstufe, nicht nur Opacity. Bei Buttons kommt IMMER `transform: scale(0.95)` dazu, mit Transition. Achtung Tailwind v4: `scale-*`-Utilities setzen die eigenstaendige CSS-Property `scale` (nicht `transform`), die transition-property muss `scale` also explizit enthalten.
- **Auf Mobile FULL WIDTH (Liam 06.08.2026).** Unter 640px laufen Buttons auf voller Breite ihres Containers, mit ZENTRIERTEM Text und eine Stufe kleiner (Hoehe, Padding und Textgroesse je eine Stufe runter). Sie duerfen den Container dabei nie ueberschreiten, `w-full` liegt also in der Spalte, nicht ueber ihr. Zwei Buttons stehen untereinander, nie nebeneinander. Die Regel gehoert an die Button-Komponente (`max-sm:w-full` an den Groessen-Varianten), nicht an jede Aufrufstelle. Ausgenommen sind Widget-Buttons (fixierte Floating-Elemente wie ein Buchungs-Widget) und Icon-only-Buttons. Wer sie an einer Einzelstelle nicht will, haengt dort `max-sm:w-auto` an.

## Transitions & Hover

- ALLES, was klickbar ist, hat einen Hover-Effekt UND einen Pressed-State (active). Kein klickbares Element ohne sichtbare Reaktion.
- ALLES, was klickbar ist, zeigt den Pointer-Cursor (`cursor: pointer`), damit erkennbar ist, dass man klicken kann. Gilt fuer Buttons, Links, `role="button"`/`role="tab"`, Chips, Cards mit onClick, `summary`, `select` usw. Achtung Tailwind v4: das Preflight setzt `<button>` auf `cursor: default`, der Zeiger fehlt also von Haus aus. Einmal global per Base-Regel loesen (`button:not(:disabled), [role="button"], a[href], summary, select { cursor: pointer }`), nicht pro Element eine `cursor-pointer`-Utility setzen. Disabled-Zustaende behalten den Default-Cursor.
- Hover-Effekte muessen deutlich sichtbar sein. Eine Opacity-Abstufung eines hellen Grau ueber Weiss (z. B. `bg-secondary/80` bei `#F5F5F5`) ist praktisch unsichtbar und zaehlt nicht. Immer eine echte, klar erkennbare Farbstufe (eigener Hover-Token).
- Selector-/Hover-Flaechen (Nav-Dropdown-Eintraege, Ghost-Buttons, Menue-Items) als TRANSLUZENTES Overlay statt festem Grauton. Auf hellem Untergrund Schwarz mit ca. 4 % Deckkraft (Hover-Stufe 8 %, Active 12 %), in Dark-Sektionen stattdessen Weiss mit denselben Stufen. Denkmodell "mehr sichtbar / weniger sichtbar". Immer die Farbe nehmen, die auf dem jeweiligen Untergrund MEHR sichtbar ist, also Weiss auf Dunkel und Schwarz auf Hell. Ein fester Hellgrau-Ton (z. B. `#F5F5F5` oder ein Accent-Token auf derselben Aufhellungsstufe wie die Flaeche darunter) verschwindet in Dark-Sektionen komplett. Am besten direkt am State-Token loesen (Light `black/4%`, Dark `white/4%`), dann flippt jeder Verbraucher automatisch mit.
- Pressed bei Buttons ist IMMER `transform: scale(0.95)`, zusaetzlich zur dunkleren Farbstufe. Natuerlich mit Transition.
- JEDE Hover-/State-Aenderung (Farbe, Hintergrund, Opacity, Transform) laeuft ueber eine CSS-Transition. Abrupte Zustandswechsel ohne Uebergang sind verboten, das wirkt unsmooth.
- Standard-Dauer 300ms (`duration-300`). Das ist der Default fuer alle Transitions. Abweichungen sind bewusste, dokumentierte Entscheidungen (z. B. ein eigenes Button-Hover-Timing in der `DESIGN.md`), keine Ad-hoc-Werte.
- Standard-Easing ist IMMER `ease-out`. Nie lineare oder Default-Kurven stehen lassen, jede Transition bekommt explizit ease-out, ausser das Projekt definiert bewusst etwas anderes. Das gilt fuer JEDE Animation, nicht nur fuer Hover-Transitions (siehe Abschnitt Animationen).
- Fuer einfache Hover-/State-Wechsel reichen reine CSS-Transitions. Kein JS/Animations-Framework fuer Dinge, die CSS alleine kann.
- Definiert ein Projekt eine eigene Timing-Utility (z. B. `transition-hover`), wird IMMER die genutzt statt frei gewaehlter Dauern.
- Importierte Bloecke pruefen: die transition-property muss ALLE Eigenschaften abdecken, die sich im Hover aendern. Der shadcn-Default `transition-[color,box-shadow]` deckt z. B. kein background-color ab, der Hover springt dann sichtbar.

## Animationen & On-Scroll-Reveal

- Sektions-Inhalte bekommen einen dezenten On-Scroll-Reveal ueber EINE geteilte Reveal-Komponente pro Projekt, nie ad hoc pro Sektion animieren. Neue Sektionen erben den Reveal automatisch (z. B. ueber die Section-Komponente).
- STAGGER HEISST NACHEINANDER. Elemente starten sichtbar versetzt und enden versetzt, nie mehrere Dinge gleichzeitig einblenden. Gilt fuer Bloecke, Einheiten und (wenn das Projekt Wort-Reveal nutzt) Woerter.
- Effekt dezent und einheitlich: Opacity plus leichter Y-Versatz, ease-out, genau EINMAL animieren. Kein Scale, kein Rotate, kein Parallax.
- Grids staggern nach VISUELLEN REIHEN, nie Einzel-Trigger pro Karte quer durchs Grid. Vertikal gestapelte Elemente (Steps, FAQ) ohne Index-Delay, die kommen einzeln in den Viewport.
- DIE BOXEN STAGGERN, NICHT IHR INHALT (Liam 23.07.2026). In einer Sektion mit vielen Karten bekommt jede KARTE genau EINE Einblendung. Was in der Karte steht (Titel, Text, Chips, Icon), kommt mit der Karte, nie einzeln nacheinander. Laeuft der Stagger auch noch durch jede Textzeile jeder Box, zieht sich die Sektion sekundenlang und die letzten Karten poppen lange nach dem Lesen nach.
- Wort-Reveal von Headlines greift nach ROLLE, nicht nach Tag. Ein Karten-Titel, der aus SEO-Gruenden `<h3>` ist, aber die Rolle h6 hat, darf den Wort-Reveal NICHT anziehen, sonst zerlegt er das ganze Grid in eine Wort-Kaskade.
- Diese Logik gehoert in die geteilte Reveal-Komponente (eigene Grid-Variante fuer Karten-Grids), nicht pro Sektion per Hand geregelt. Sonst kommt das Problem beim naechsten Grid wieder.
- Einspaltige Ansicht (Mobile): kein Index-Delay, jede Karte kommt bei ihrem eigenen Viewport-Eintritt. Eine Ladder wuerde dort die halbe Sektion unsichtbar durchlaufen.
- Dosierung: pro Sektion maximal Header-Block plus Karten/Spalten. Keine Einzel-Element-Animationen (jede Zeile, jedes Icon).
- **Die ZWEITE Sektion einer Seite hat KEINEN On-Scroll-Reveal (Liam 06.08.2026).** Sie ragt beim Laden schon ins Bild, ihr Inhalt muss dort sofort stehen. Sonst sieht man unter dem Hero eine leere Flaeche und denkt, da kommt nichts mehr. Ab Sektion drei laeuft der Reveal wie gewohnt. Technisch ueber einen Schalter, der den Reveal fuer einen Teilbaum abstellt (im Restovo-Projekt `<RevealOff>` um die Sektion), nicht indem man die Sektion umbaut.
- **In der ERSTEN Sektion startet die TAGLINE bei 10 % Opacity statt bei 0 (Liam 06.08.2026).** Dort laeuft die Animation beim LADEN. Kommt alles aus dem Nichts, sieht man nach jedem Refresh einen Moment lang gar nichts vom Inhalt, und wenn nichts vom Content zu sehen ist, ist das falsch. Die Tagline steht deshalb von der ersten Frame an schwach da und faded von dort hoch. Es ist ausdruecklich die TAGLINE und nicht die Headline (die grosse Headline schwach im Bild wirkt unruhig), Headline, Subtext und Buttons kommen weiter aus dem Nichts. Zwei Folgen fuer den Bau: der umgebende Block darf dann NICHT mehr als Ganzes faden (sonst liegt ueber der schwachen Tagline eine zweite Deckkraft-Stufe und man sieht wieder nichts), und der Startzustand gehoert ins CSS statt ins JS, sonst steht der Hero bis zur Hydration trotzdem leer da. Dieser CSS-Zustand muss die POSITION der Animation mitbringen, nicht nur die Deckkraft: das CSS steht sofort, das JS kommt spaeter, und stuende das sichtbare Element schon auf seiner Endposition, wuerde es beim Uebernehmen sichtbar dorthin zurueckspringen, wo die Animation anfaengt. Hat ein Hero keine Tagline, bleibt es bei 0.
- **On-Load-Intro des Hero-Fotos.** Das Foto der ersten Sektion macht beim Seitenaufruf aus der HELLEN Seitenfarbe auf: es startet weiss ueberdeckt und wird nach und nach weniger weiss, waehrend es sich aus einer leichten Ueberzeichnung (Richtwert scale 1.12) auf seine Endgroesse setzt. Kein Opacity-Fade des Bildes, ein weisser Schleier darueber, der weggeht. Zoom und Schleier laufen auf ZWEI Elementen (Zoom auf dem Wrapper), sonst ueberschreibt eine zweite scale-Quelle die andere. Dauer rund 1.5s fuer den Zoom, rund 1s fuer den Schleier, beides mit starker Ausklingkurve (`cubic-bezier(0.22, 1, 0.36, 1)`), nicht mit dem CSS-Schluesselwort `ease-out`. Liegt Text auf dem Foto, gehoert der Schleier UNTER das Foto-Overlay, damit heller Text nie kurz auf Weiss steht. Der Schleier braucht einen eigenen Token fuer die helle Seitenfarbe (z. B. `--background-light`), sonst loest er in einer Dark-Sektion dunkel auf.
- `prefers-reduced-motion` rendert IMMER ohne Animation.
- Smooth Scroll optional und dezent (z. B. Lenis mit lerp nahe am nativen Scrollen). Nie der schwere Floaty-Agentur-Look. Konkrete Werte pro Projekt in der `DESIGN.md`.

### Easing und Ruckeln (Liam 31.07.2026)

- **Easing gilt fuer JEDE Animation, nicht nur fuer Hover-Transitions.** Keyframe-Intros, On-Load-Animationen, Grafik-Sequenzen und scroll-gekoppelte Effekte bekommen von sich aus ease-out, ohne dass jemand danach fragt. Kein `linear`, kein Browser-Default, keine Kurve aus einem importierten Block.
- **Grossflaechige Bewegungen brauchen eine starke Ausklingkurve UND kurze Dauer.** Das CSS-Keyword `ease-out` (`cubic-bezier(0, 0, 0.58, 1)`) bremst kaum und liest sich ueber einen Foto-Zoom oder ein wachsendes Panel wie gleichmaessiges Kriechen. Dafuer einen eigenen Token setzen, Richtwert `cubic-bezier(0.22, 1, 0.36, 1)`. Lange Dauer plus schwache Kurve ist genau die Kombination, die als "animiert zu lange und hat kein ease out" zurueckkommt.
- **Scroll-gekoppelte Animationen haengen NIE 1:1 am Scroll.** Sonst kommt jede Wheel-Stufe als Ruck durch. Der gezeigte Stand laeuft dem gescrollten hinterher (bei GSAP heisst das `scrub`), als Zeitkonstante ueber einen Token, gerechnet aus der vergangenen Zeit statt pro Frame, damit es bei 30fps genauso gleitet wie bei 60. Startwert um 0.35s, dazu ein Mindesttempo im Auslauf, damit der Schwanz nicht nachhaengt.
- **Nur EIN Glaettungsschritt.** Nachlauf entweder im Effekt selbst oder im Smooth-Scroll, nie beides uebereinander. Doppelte Glaettung fuehlt sich nach Delay an, nicht nach smooth.
- **Nur EINE Animation pro Element.** Ein Element mit eigener Scroll-Animation darf nicht zusaetzlich im Sektions-Reveal liegen. Der Reveal schiebt es zeitbasiert hoch, waehrend der Effekt am Scroll haengt, und der Y-Versatz verschiebt genau das Rechteck, aus dem der Effekt seinen Fortschritt liest. Solche Sektionen laufen mit `reveal="custom"`, Kopf und CTA bekommen ihren Reveal einzeln, das animierte Element keinen.
- **Nach dem Nachbessern den Rest gegenpruefen.** Aendert sich Easing, Dauer oder Timing, danach den Endzustand gegen vorher pruefen. Kein abgeschnittenes Icon durch neue Transform-Werte, kein verschwundener Blur, keine verschobene Reihenfolge. Was vorher stimmte, stimmt hinterher noch.
- **Easing nie behaupten, sondern messen.** Nach dem Bauen im Browser die berechnete `animation-timing-function` bzw. `transition-timing-function` der bewegten Elemente auslesen und melden, welcher Wert dort wirklich steht.

## Farb-Tokens benennen (Liam 27.07.2026)

Gilt fuer JEDES Projekt. Die shadcn-Schreibweise wird beim Aufsetzen uebersetzt, nicht uebernommen. Dort heisst die Textfarbe `--foreground` und jede Flaeche bekommt ein `*-foreground` fuer den Text darauf. Das ist nicht, was ein Foreground ist.

- **`background`** = die Flaeche, auf der alles liegt (Seite/Sektion). Zweiter Sektions-Hintergrund als `background-alt`.
- **`foreground`** = die Flaeche von etwas, das AUF dem Background liegt, also die FUELLFARBE einer Box. Es gibt genau ZWEI, sie sind eins zu eins die beiden Box-Varianten aus der Boxen-Regel (`foreground` und `foreground-alt`). Nie die Textfarbe.
- **`content`** = Text- und Icon-Farbe. Drei Stufen: `content-primary`, `content-secondary`, `content-secondary-light`. Kein `muted-foreground`.
- **`on-*`** = die Content-Farbe AUF einer farbigen Flaeche. `on-primary` ist der Text auf einem Primary-Button.
- **`invert`** = volldeckende Gegenflaeche (Light Mode dunkel, Dark hell), z. B. Tooltip oder Badge. Dazu `on-invert`.
- **`brand-*`** = die Markenfarben. Benannt nach der MARKE, nie nach der Sektion, in der sie zuerst aufgetaucht sind (kein `bento-sage`, wenn es einfach das Gruen der Marke ist). Ist eine davon der Primary, zeigt `--primary` auf den Marken-Token statt denselben Hex zweimal zu fuehren.

Namen aus importierten Bloecken werden beim Branding mit uebersetzt, genauso wie Spacing, Radius und Buttons. Das Namens-System steht sichtbar im Style Guide, nicht nur im CSS. Beim Umbenennen in einem laufenden Projekt gilt: die WERTE bleiben, nur die Namen aendern sich. Vorher einen Snapshot der berechneten Farben aller Elemente ziehen (`getComputedStyle` ueber `document.querySelectorAll('*')`), hinterher gegenpruefen und die Differenz auf null bringen.

## Boxen (Cards)

- Es gibt nur EIN Box-Konzept, maximal zwei Varianten pro Projekt. Standard grau gefuellt, alternativ weiss mit weichem Drop Shadow. Beide sonst identisch aufgebaut.
- KEINE 1px-Border/Ringe auf Boxen, auch nicht als box-shadow-Ring und nicht kombiniert mit Drop Shadow. Sieht nach KI aus. Abgrenzung nur ueber Fuellfarbe oder weichen Drop Shadow.
- Das gilt besonders fuer dunkle Sektionen. Ein 1px-Ring in halbtransparentem Weiss (z. B. `ring-1` mit Weiss 5-10 %) wirkt auf dunklen Karten wie ein Inner Glow und ist der typischste KI-Look ueberhaupt. NIE verwenden, auch nicht wenn ein importierter Block ihn mitbringt. Abgrenzung uebernimmt die hellere Fuellfarbe (Aufhellungs-Leiter) oder der weiche Drop Shadow.
- Ausnahme INNERHALB von Grafiken/Illustrationen: kraeftige, volldeckende Outlines als bewusstes Gestaltungselement (z. B. reines Weiss oder Primary auf Dark) sind erlaubt, wenn die Grafik sonst optisch verloren wirkt. Verboten bleibt nur die halbtransparente Hairline.
- Drop Shadow: genau EINER, 0/0-Versatz, nur Blur (nicht zu wenig), niedrige Opazitaet. Richtwert `0 0 2rem` mit Schwarz 8 % (Liam 16.07.2026, 5 % war zu schwach). Nie mehrere/versetzte Schatten stapeln (KI-Look).
- Details (genaue Farben/Schatten) pro Projekt in der `DESIGN.md`.

## Bento-Sektionen (Karten-Grids mit Grafik + Text)

- Grafiken/Bilder nehmen in ALLEN Karten einer Reihe gleich viel Platz ein. Der Grafik-Bereich bekommt eine feste, gemeinsame Hoehe (z. B. fixe Hoehe oder gleiches Aspect Ratio), nie die natuerliche Hoehe der jeweiligen Grafik.
- Die Headlines aller Karten einer Reihe liegen auf EINER Linie. Der Text-Block startet in jeder Karte an derselben vertikalen Position, unabhaengig davon, wie hoch die Grafik von sich aus waere.
- Layout entsprechend bauen: Grafik-Slot mit fester Hoehe oben, Text-Block darunter. Nie den Textbeginn von der Grafik-Hoehe abhaengig machen. Zu grosse Grafiken werden im Slot beschnitten oder skaliert, zu kleine zentriert.
- Gilt pro Reihe/Kontext. Bewusst unterschiedliche Karten-Typen (z. B. eine grosse Feature-Karte neben kleinen) sind ok, aber Karten mit gleichem Aufbau folgen immer demselben Raster.

- Genau DREI Radius-Stufen. small, medium, large. `rounded-full` (Pills, Avatare) zaehlt nicht dazu.
- Je groesser das Element, desto groesser der Radius. Buttons duerfen custom sein, bekommen aber keine eigene Stufe.

## Dark Mode

- Standardfall: heller Modus mit dunklen Einzel-Sektionen. Ein KOMPLETT dunkles Theme ist eine gueltige Projekt-Entscheidung (steht dann in der Projekt-`DESIGN.md`), dann gelten alle folgenden Regeln fuer die ganze Seite.
- Dunkler Background nie reines `#000` (schwarz-schwarz), immer ein Fast-Schwarz (Richtung `#0A0A0A`) oder ein sehr dunkler Farbton.
- Der Background definiert den FARBTON aller abgeleiteten Toene. Sagt das Projekt "Hintergrund leicht blau", dann sind Flaechen, Textstufen und Borders ebenfalls leicht blau getoent, NIE neutrale 0-Saettigungs-Grautoene neben einem getoenten Background. Technisch am einfachsten: alles per `color-mix` ueber `var(--background)` ableiten statt eigene Hex-Werte setzen. Nur bei bewusst neutralem Schwarz sind neutrale Stufen richtig.
- Text im Dark Mode nie schwarz, auch nicht auf Akzent-Buttons.
- Flaechen VOR dem Dark-Background (Cards, Secondary, Muted, Accent) sind immer eine leicht hellere Variante des Backgrounds. Einfach Weiss mit 3-4 % Deckkraft ueber den Background mischen (z. B. `color-mix(in srgb, var(--background), white 4%)`), das passt meistens. Keine eigenen, unabhaengigen Grautoene fuer Dark-Flaechen.
- Verschachtelte Flaechen gehen pro Ebene EINE Stufe heller. Liegt in einer Dark-Card noch eine Flaeche (Kaertchen, Badge, Grafik-Element), bekommt die die naechste Aufhellungsstufe (z. B. Weiss mit 8 % statt 4 % ueber den Background). Gilt auch fuer importierte Grafiken/Illustrationen, deren Dark-Werte beim Branding auf diese Leiter gezogen werden.
- NIE Schwarz oder dunkler als der Untergrund fuer verschachtelte Flaechen, wenn der Background eine Farbe ist. Auch kein reines Weiss, immer die Weiss-Mischung ueber den Background. Seltene bewusste Ausnahmen ok (im Light Mode darf die Flaeche z. B. dunkler sein), die Richtung heller ist der Standard.
- Gilt auch fuer fixierte/floatende Elemente UEBER Dark-Sektionen, z. B. eine Nav mit Farb-Switch. Deren Flaeche ist IMMER eine hellere Abstufung des jeweiligen Dark-Backgrounds, nie plain Schwarz und kein neutrales Grau. Gerade bei farbigem Dark-Background (z. B. dunkles Petrol) bleibt die Abstufung in der Farbe.

## Icons

- Standard-Icon-Library: IBM Carbon (`@carbon/icons-react`, entspricht icons.relume.io/collection/carbon). Nicht pro Projekt neu entscheiden, ausser das Projekt legt etwas anderes fest.
- EIN Icon-Stil pro Projekt, einmal entscheiden: entweder gefuellte Icons ODER Outline-Icons, nie gemischt. Unser Standardfall (99 %) ist Outline. Dann so gut wie immer die Outline-Variante nehmen, auch bei Icons mit Filled-Gegenstueck. Filled nur, wo Outline die Bedeutung kaputt macht, z. B. eine 5-Sterne-Bewertungsreihe (Outline-Sterne wirken dort wie nicht vergebene Sterne).
- Gefuellte Sterne NUR als echte, abgegebene Bewertungssterne (mehrere nebeneinander, Rezensions-Kontext). Ein einzelner (gefuellter) Stern als Deko-Icon (Tagline, Headline-Schmuck) ist verboten, generell ist ein einzelner Stern fast nie das richtige Icon.
- Feste Icon-Groessen-Skala pro Projekt (analog Spacing und Corner Radius), benannte Stufen wie `xxsmall, xsmall, small, medium, large`. Keine frei gewaehlten Icon-Groessen.
- Icon-Wrapper sind immer Icon plus zweimal Padding. Das Padding ist pro Stufe fest definiert und skaliert mit der Icon-Groesse (kleineres Icon, etwas weniger Padding).

## Logos (fremde Marken-Logos einbinden)

- Logo-Container-Pattern: Container mit Min-/Max-Width und Min-/Max-Height (Max-Height ca. ein Drittel der Max-Width), Width und Height 100 %. Logo darin ebenfalls 100 %/100 % mit `object-fit: contain`, verankert per `object-position` an der Ecke, die zum Layout passt (z. B. unten links).
- Logo-Dateien VOR dem Einbau auf den Inhalt zuschneiden. CMS/CDN-Exporte haben oft 60-90 % transparenten Rand, das macht Logos klein, falsch zentriert und erzeugt scheinbares Extra-Spacing.
- Zuschnitt technisch: Alpha-Bounding-Box ermitteln und exakt darauf croppen (z. B. Python/PIL `im.getchannel("A").getbbox()` + `im.crop(bbox)`). Zugeschnittene Datei unter NEUEM Namen speichern (z. B. `*-trim.png`) und die Referenz im Code umstellen, nie die alte Datei ueberschreiben (Browser-/next-image-Cache haengt am Dateinamen). Die echten Inhalts-Masse (Breite/Hoehe nach Crop) als width/height im Code hinterlegen.
- Logos ohne Alphakanal (z. B. weiss auf schwarzem Quadrat) vorher freistellen, Schwarz zu Transparenz.

## Logo-Reihen optisch ausgleichen (Marquee, Logo-Wall, Referenzleisten)

- NIE Einheitshoehe fuer alle Logos einer Reihe. Bei gleicher Hoehe wirken quadratische Bildmarken massiv und breite Wortmarken duenn, bei gleicher Breite umgekehrt. Das Ziel ist gleiche VISUELLE MASSE, nicht gleiche Abmessung.
- Formel pro Logo: `Hoehe = Basis / ratio^0.4` mit `ratio = Inhaltsbreite / Inhaltshoehe` (Masse NACH dem Zuschnitt auf die Alpha-Bounding-Box, sonst rechnet man mit Luft). Breite ergibt sich automatisch (`w-auto` + `object-contain`).
- Der Exponent steuert den Ausgleich. 0 = gleiche Hoehe (breite Wortmarken dominieren), 0.5 = exakt gleiche Flaeche (breite Wortmarken werden zu flach und unlesbar). 0.4 ist der Standard-Kompromiss. Feintuning nur ueber diesen einen Exponenten (0.35 bis 0.45) oder die Basis, nie per Einzelfall-Pixelwert pro Logo.
- `Basis` = Zielhoehe eines quadratischen Logos (ratio 1:1) in px, EINMAL zentral als Konstante definieren. Die Formel als kleine Helper-Funktion in der geteilten Logo-Komponente, nicht pro Einsatzstelle kopieren.
- Immer visuell im Browser gegenpruefen. Die Formel liefert die Grundordnung, extreme Sonderfaelle (sehr duenne Serifen-Schriftzuege, sehr dichte Badges) beurteilt man mit dem Auge und justiert global ueber Exponent/Basis nach.
- Die Formel gilt auch fuer EINZELNE Logos (eigenes Logo in Nav und Footer): Hoehe nicht frei raten, sondern aus `Basis / ratio^0.4` mit den Massen nach Alpha-Crop rechnen (z. B. Basis 44 -> Wortmarke mit ratio 3 wird ~28px hoch). So wirken Nav-, Footer- und Slider-Logos gleich massiv.

## Copy und Sektionsstruktur

- Vor jeder Struktur die Awareness-Stufe aus Briefing, Onboarding-Transkript und Psychologie-Doc ziehen und in einem Satz festhalten. Ist der Besucher vorqualifiziert (Anruf, Termin, Empfehlung), faellt die Problemsektion weg, ebenso jede Erklaerstrecke zum Problem.
- Jeder Sektionstyp kommt genau EINMAL vor. Keine zweite Ueber-uns-, Team- oder Vertrauenssektion. Keine Sektion, die nur Laenge erzeugt. Laesst sich der Zweck nicht in einem Satz sagen, fliegt sie raus.
- Keine Branchen-Fachbegriffe in der Copy (z. B. "Mandat", "Sourcing", "Pipeline"), wenn die Zielgruppe sie nicht selbst benutzt. Das Wort der Zielgruppe nehmen oder umschreiben.
- Jeder Satz muss beim ersten Lesen sitzen. Keine Schachtelsaetze mit mehreren Einschueben, und keine Aussage, die auf jeden Wettbewerber genauso zutraefe.

## Fakten & Stammdaten als Variablen

- Wiederkehrende Fakten NIE im Markup hardcoden: Firmenname, Telefonnummer, E-Mail, Adresse UND Zahlen-Fakten ("100+ Kunden betreut", "4,9 Bewertung", Jahre Erfahrung).
- EINE zentrale Konstanten-Datei pro Projekt (z. B. `src/lib/company.ts`), alle Stellen (Hero, Stats, Footer, Widgets, Metadata) konsumieren daraus. Einmal aendern -> ueberall geaendert.
- Faellt beim Bauen ein hardcodierter Fakt auf, der an zweiter Stelle vorkommt (oder vorkommen wird), sofort in die Konstanten-Datei heben.

## Style Guide (pro Projekt)

- Jede Website bekommt `/style-guide` (noindex, nicht verlinkt). Kompakt halten.
- Die Style-Guide-Seite enthaelt die normale Site-Navigation (Header), wie jede andere Seite.
- Der Style Guide ist die MASTER-Vorlage. Aendert sich dort ein Style (z. B. Line-Height), wird er ueberall auf der Seite mitgeaendert. Seite und Style Guide bleiben 1:1 synchron.
- Design-Feedback ist IMMER global gemeint. Sagt der Kunde/Liam z. B. "H1 kleiner" oder "Buttons runder", heisst das: Regel im Style Guide (und den Tokens/Element-Styles) aendern und damit ueberall auf der Seite, nie nur an der einen genannten Stelle.
- Wiederkehrende Muster (Tagline-Chip, Icon-Wrapper, Buttons) sind EINE geteilte Komponente und werden ueberall verwendet, nie im Markup nachgebaut.
- Headings ueber Element-Styles (h1 bis h6 global in CSS definieren), nicht ueber Groessen-Klassen pro Vorkommen. Leiter monoton, h6 groesser als die groesste Fliesstext-Stufe.
- Inhalt. Farben, H1 bis H6 plus Textgroessen-Leiter (Large/Regular/Small/Tiny), Buttons inkl. Dark-Sektion, Boxen, Radius, Spacing (rem und px), eine Beispielsektion mit allem kombiniert (Tagline, Headline, Subtext, Box mit Icon-Wrapper, Box-Headline, Box-Subtext).
- Normale CSS-/Design-Begriffe verwenden (Foreground, Hover, Disabled), nichts eindeutschen. Zustaende so benennen wie in CSS.

## Blöcke importieren, nicht nachbauen

- Fertige Bloecke (shadcn/ui, shadcnblocks, andere Registries) werden per CLI wirklich IMPORTIERT (`pnpm dlx shadcn@latest add ...`), nie aus dem Kopf nachgebaut. Der importierte Code ist die Basis, die dann angepasst wird.
- Auth-Keys fuer Pro-Registries kommen aus der Keychain (`secret-get`), Referenz in `components.json` nur als `${ENV_VAR}`, beim Import als Env-Var uebergeben. Nie Klartext in Dateien.
- Vorhandene, bereits gebrandete Komponenten (z. B. `button.tsx`) beim Import NICHT ueberschreiben. Bei der Ueberschreib-Frage `No` waehlen.
- Die Sektion danach 1:1 ins Projekt-Branding ueberfuehren. Konkret: Tokens statt Hex/Pixel, Spacing-Skala statt freier Werte, Container-System, `next/image` statt `<img>`, Outline-Buttons zu gefuellt/ghost, sichtbare Rahmen zu Fuellfarbe oder weichem Drop Shadow. Struktur und Aufbau des Blocks bleiben erhalten.
- Grafiken werden NIEMALS komplett neu gebaut oder durch selbst erstellte/andere Grafiken ersetzt. Die Original-Grafik des Blocks bleibt 1:1 erhalten (Illustration, Icons, Formen, Layout). Angepasst wird ausschliesslich der Text darin.
- Grafiken werden INSTALLIERT, nicht nachgebaut. Nennt der Auftrag einen konkreten Block/Registry-Befehl (z. B. `pnpm dlx shadcn@latest add @tailark-pro/kanban`), wird GENAU dieser Befehl ausgefuehrt und der installierte Code direkt als Basis verwendet. Nie den Block nur anschauen und aus dem Kopf nachbauen.
- An installierten Grafiken duerfen NUR Texte und Farben (auf Projekt-Tokens) geaendert werden. Struktur, Layout, Formen, Icons, Animationen und Aufbau bleiben exakt wie geliefert. Alles andere (z. B. Ausrichtung drehen, Elemente entfernen) nur, wenn der Auftrag es EXPLIZIT sagt.
- Hairline-Ringe/Borders auf Flaechen in installierten Grafiken zaehlen als Farb-Anpassung, nicht als Struktur. Sie werden beim Branding IMMER auf transparent gesetzt (siehe Boxen-Regel, Inner-Glow-Look). Am besten ueber den zentralen Border-Token der Illustrationen, nicht pro Grafik einzeln.
- Standardfall: den Text in der Grafik einfach auf den Projekt-Kontext aendern. Meist ist das echter, direkt editierbarer Text.
- Sonderfall: Steckt der Text als nicht editierbarer Vektor drin (aus Design-Tools als Pfade exportiert), wird nur dieser Text-Pfad entfernt und an gleicher Position durch echten `<text>` im gleichen Stil ersetzt. Der Rest der Grafik bleibt unangetastet. Nie die ganze Grafik deshalb neu zeichnen.

## Typografie (Text-Sizings konsistent)

- **In rem denken.** Alle Groessen (Text, Spacing, Icons, Radius) in rem definieren, px nur als Anzeige-Info daneben.
- **Gleicher Use-Case, gleiche Groesse, ueberall.** Eine Text-Rolle hat EINE feste Groesse und EIN festes HTML-Element im ganzen Projekt. Wird eine Rolle einmal festgelegt (z. B. Card-Titel), gilt sie in jeder Sektion identisch. Nicht pro Block/Sektion neu erfinden.
- **Alles ueber Variablen.** Jede Text-Rolle (h1-h6 plus Textgroessen-Leiter) hat CSS-Variablen fuer font-size, line-height, font-weight, letter-spacing. Element-Style UND gleichnamige Klasse konsumieren dieselben Variablen (`h4, .h4 { font-size: var(--text-h4) }`). Eine Klasse `h4` sieht damit IMMER exakt aus wie das Element `h4`. NIE einem Heading per Utility-Klasse eine fremde Groesse geben (kein `<h4 class="text-base">`), stattdessen das Element/die Klasse nehmen, deren Rolle passt.
- **So wenige Groessen wie moeglich pro Sektion.** Eine neue Textgroesse nur, wenn sie echte Hierarchie zeigt, nie einfach so.
- **Heading-Level nach der Groessen-Leiter.** Hero = genau ein `h1`. Sektions-Headlines = `h2`. Darunter das Level, dessen Element-Style zur Rolle passt (z. B. Box-Titel = `h6`). Kein `<p>` oder `<div>` als Pseudo-Ueberschrift.
- **Genug Kontrast zwischen Groessen.** Text-Groessen innerhalb einer Sektion (und generell) duerfen sich nicht zu aehnlich sein. Benachbarte Rollen mindestens eine Stufe auseinander. Zwei verschiedene Elemente NICHT gleich gross (z. B. Sektions-Headline und Kennzahl). Wo zwei Groessen technisch nah liegen, muss zusaetzlich Gewicht oder Farbe die Hierarchie tragen.
- **Headlines ohne Punkt.** Ueberschriften (h1-h6) enden NIE mit einem Punkt und enthalten keinen Punkt als Satzzeichen. Zwei Saetze in einer Headline umformulieren. Zahlen (z. B. 20.000) sind ok.
- **Feste Skala statt Ad-hoc-Werte.** Responsive-Spruenge (`md:`/`lg:`) gehoeren zur Rollen-Definition, nicht als Einzelfall pro Sektion. Importierte Bloecke beim Branding auf die Projekt-Skala ziehen. Die konkrete Groessen-Tabelle steht pro Projekt in der `DESIGN.md`.
- **Vier Zeilen im Sektions-Header (Liam 22.07.2026).** Headline plus Subtext eines Sektions-Headers ergeben auf Desktop (1920px) zusammen MAXIMAL vier Zeilen. Die Aufteilung ist egal (2+2, 3+1, 1+2 ...), weniger ist immer ok. Gilt fuer den Hero genauso wie fuer jede Sektion. Der Fix ist die Copy, nicht die Schriftgroesse oder die Container-Breite. Weiche Regel, begruendete Ausnahmen sind erlaubt, aber der Standard sind vier Zeilen. Nach Textaenderungen im Browser bei 1920px nachmessen (Element-Hoehe geteilt durch line-height), nicht schaetzen.

## Vertikales Spacing

- Abstand ZWISCHEN Sektionen ueber benannte Stufen (Variablen/Klassen, z. B. `.section-spacing-*`), nie freie Werte pro Sektion. Genau DREI Stufen. `large`, `medium`, `small`. `large` ist der Standard fuer alle Sektionen. Custom nur als seltene, begruendete Ausnahme (z. B. erste Sektion nach dem Hero). Sektionsabstaende grosszuegig, im Zweifel mehr (Liam 17.07.2026).
- Benannte Spacing-Einheiten statt freier Pixelwerte. Skala mit 11 Stufen, klein nach gross. `tiny, xxsmall, xsmall, small, medium, large, xlarge, xxlarge, huge, xhuge, xxhuge`.
- Einheiten in rem definieren, nicht in px. Pixel nur als Anzeige-Info daneben.
- Die Einheiten machen das Ergebnis konsistent. Fuer Grafiken/Illustrationen nicht zwingend.
- Wiederverwendete Komponenten haben identisches inneres Spacing. Beispiel Tagline zu Headline oder Button zu Text, ueberall gleich.
- Gaps (z. B. zwischen zwei Boxen) sind einheitlich, eine Standard-Gap-Groesse pro Kontext.
- Es gibt EINEN Main-Gap als Standard zwischen Karten/Boxen, dazu hoechstens zwei benannte Abweichungen (eine groessere, ggf. eine kleinere). Wert pro Projekt in der `DESIGN.md` festlegen, nie pro Sektion neu entscheiden.

## Bilder & Fotos (Auswahl und Auslieferung)

- NIE eigenmaechtig vorhandene Projekt-Bilder (Referenz-Fotos, Kundenlogos, Uploads) als Fuellmaterial in neue Grafiken oder Sektionen ziehen. Jedes Bild hat seinen Kontext und bleibt dort.
- Bilder kommen vom User (geschickte Datei) oder werden vorher abgestimmt. Fehlt ein Bild, nachfragen.
- Braucht eine Grafik einen neutralen Platzhalter (z. B. fuer Konkurrenz, fremde Inhalte), einen Skeleton bauen. Graue Flaeche statt Bild, graue Balken (rounded-full) statt Text, Farben auf der jeweiligen Aufhellungsleiter.

### Nie ein zweites Mal komprimieren (Liam 31.07.2026)

- Vom User gelieferte Bilder gehen in Originalqualitaet raus. Handoptimierte Fotos bekommen in `next/image` immer `unoptimized`, sonst encodiert der Optimizer die fertige Datei ein zweites Mal nach WebP/AVIF. Das ist Generationsverlust, egal wie hoch `quality` steht.
- `unoptimized` nur bei Dateien, die schon klein genug sind (Richtwert bis rund 300 KB). Ist die Datei groesser, vorher nachfragen statt sie still durch den Optimizer zu schicken.
- Selbst generierte Grafiken, Mockups und Screenshots laufen weiter ueber den Optimizer, dort aber mit `quality={95}`. Die Default-Stufe 75 franst weisse Flaechen und weiche Schatten sichtbar aus. SVG immer `unoptimized`, der Optimizer lehnt es sonst ab.
- Nach dem Einbau die ausgelieferte Bytegroesse gegen die Quelldatei pruefen. Weicht sie ab, steckt noch eine zweite Kompressionsstufe drin.

### Text auf Bild wird auf Mobile IMMER neu gebaut (Liam 06.08.2026)

- **Text ueber einem Gesicht ist immer falsch.** Das gilt ohne Ausnahme, egal wie stark das Overlay ist.
- Das gilt fuer JEDES Element, das auf einem Foto liegt, nicht nur fuer Fliesstext. Notification-Karten, Badges, Chips, Kennzahlen, Logos. Wo genau so ein Element sitzt, haengt am Bild und wird pro Einsatzstelle entschieden (Prop an der Aufrufstelle), nie fest in die Komponente gebaut. Und es wird im Browser nachgesehen, nicht geschaetzt: Kopf frei heisst Kopf im Screenshot sichtbar, auf jedem Breakpoint.
- Ein Text-auf-Bild-Layout darf NIE unveraendert von Desktop nach Mobile durchlaufen. Auf Desktop steht der Text in der freien Bildhaelfte neben der Person, auf Mobile beschneidet derselbe Ausschnitt das Bild seitlich, die Person rutscht in die Mitte und der Text landet auf ihrem Kopf. Das ist kein Zufall, sondern die Regel, und es passiert bei jedem Hero, jeder Overlay-Karte und jedem Foto mit Text darauf.
- Die drei Hebel, in dieser Reihenfolge: **Freiraum schaffen** (deutlich mehr Padding auf der Seite, auf der die Person steht, meistens oben), **Textblock verkleinern** (kuerzere Copy-Fassung fuer Mobile, Tagline weg, kleinere Schrift), **Bildausschnitt setzen** (`object-position` so, dass der Kopf im freien Bereich landet). Ein staerkeres Overlay ist KEIN Hebel, es macht das Bild nur matschig und der Text steht trotzdem im Gesicht.
- Gegenprobe am Ende: Kopf der Person sichtbar UND der komplette Textblock inklusive aller CTA-Buttons ohne Scrollen im Bild. Beides zusammen, nicht eines davon.

## Mobile (Liam 06.08.2026)

Mobile ist nicht "Desktop schmaler". Jede Sektion wird bei 390px einzeln angesehen und bekommt dort ihre eigenen Werte. Wer nur die Spalten stapelt, liefert eine halbe Seite ab.

### Padding und Spacing

- **Innenpolster gehen auf Mobile eine bis zwei Stufen runter.** Was auf 1440px als Ruhe wirkt, ist auf 390px verschenkte Flaeche. Karten, Grafik-Slots, farbige Boxen und Nachrichten-Elemente polstern dort enger. Der Standardfehler ist zu viel Padding, nie zu wenig.
- **Polster sind RUNDUM gleich.** Sitzt in einer Box eine Grafik, ist der Abstand oben, unten, links und rechts derselbe. Boxen, die oben und unten mehr Luft haben als seitlich, sind unnoetig hoch und sehen aus wie ein Fehler.
- **Abstand ZWISCHEN Items ist deutlich groesser als INNERHALB eines Items.** In einer Spalte liegen Grafik, Titel und Subtext eines Items eng zusammen, zum naechsten Item kommt eine ganze Stufe mehr. Sind beide Abstaende gleich, versteht niemand mehr, welcher Subtext zu welcher Grafik gehoert. Der Hebel ist der Abstand UNTER dem Subtext, nicht ueber der Headline.
- **Der Abstand vom Sektions-Header zum Inhalt geht auf Mobile eine Stufe runter.** Zentral am Token, nicht pro Sektion.

### Typografie

- Die Groessen-Leiter hat eine eigene MOBILE-Stufe, zentral in den Tokens, nie per Utility an der Einzelstelle. Beide Stufen (Mobile und Desktop) stehen sichtbar untereinander, wer eine Groesse aendert, aendert beide.
- Auf Mobile duerfen `h1` und `h2` dicht beieinanderliegen. Der grosse Sprung ist ein Desktop-Thema, auf dem schmalen Screen traegt die Position die Hierarchie.
- **Box- und Karten-Headlines passen auf Mobile in ZWEI Zeilen.** Passt eine nicht, ist die Rolle zu gross oder die Copy zu lang, beides ist zu fixen. Drei- und vierzeilige Karten-Titel sind das sicherste Zeichen fuer eine nicht gemachte Mobile-Runde.
- Fliesstext geht mit der Leiter mit. 18px Body ist auf Desktop richtig und auf Mobile eine Spur zu gross.

### Layout, Reihenfolge, Grafiken

- **Nichts ist abgeschnitten.** Nach jeder Sektion `document.documentElement.scrollWidth` gegen die Viewport-Breite pruefen. Angeschnittene Grafiken, aus dem Rahmen laufende Spalten und abgeschnittene Tooltips sind kein Detail, sie machen die Sektion sinnlos.
- **Desktop-Grafiken bekommen eine eigene MOBILE-FASSUNG, sie werden nicht skaliert und nicht beschnitten.** Ein Dashboard-Mockup mit Sidebar und drei Spalten wird auf Mobile als App-Ansicht neu gedacht (eine Spalte, Kopfzeile, ggf. Tabs), mit denselben Inhalten. Dasselbe gilt fuer breite Diagramme und Tabellen.
- **Grafik-Inhalte duerfen auf Mobile nicht formatfuellend werden.** Ein quadratischer Slot ist dort so breit wie der Container, die Elemente darin muessen entsprechend zurueckgezogen werden, sonst wirkt die Grafik wie ein Zoom-Fehler.
- **Die Reihenfolge in der Spalte wird bewusst entschieden.** Was auf Desktop nebeneinander steht, hat auf Mobile eine Lese-Reihenfolge. Ueber `order` loesen, damit Datenreihenfolge und Desktop-Grid unangetastet bleiben.
- **Alternierende Raster brechen beim Stapeln.** Ein 4er-Grid, das auf Desktop Foto und Farbkarte abwechselt, hat in einer Spalte ploetzlich zwei Farbkarten hintereinander. Die Abwechslung fuer Mobile neu rechnen, nicht der Datenreihenfolge ueberlassen.
- Textbloecke, die auf Mobile zu lang werden, bekommen eine eigene KURZE Copy-Fassung. Dieselbe Aussage, weniger Ausfuehrung. Kein Abschneiden ohne Ausklapp-Moeglichkeit.

### Animationen

- **Ketten funktionieren auf Mobile nicht.** Eine Choreografie, die auf Desktop von Karte zu Karte weiterlaeuft (alle vier sind gleichzeitig im Bild), ist auf Mobile langst durchgelaufen, bevor die dritte Karte sichtbar wird. Dort startet JEDE Grafik einzeln, wenn sie selbst weit genug im Viewport steht (Richtwert 60 bis 70 % sichtbar), spielt einmal und bleibt im Endzustand stehen.
- Auf Mobile gibt es keinen Hover. Jeder Zustand, den eine Grafik nur ueber Hover erreicht, braucht dort einen anderen Weg dorthin, und der Endzustand muss stabil stehen bleiben.
