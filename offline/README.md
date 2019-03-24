Standard Speicherorte
-----------------------------
Datei: au3.api
Pfad: C:\Program Files (x86)\AutoIt3\SciTE\api\

Datei: AutoIt.chm
Pfad: C:\Program Files (x86)\AutoIt3\

Dateien im Ordner: Beispiele
Pfad: C:\Program Files (x86)\AutoIt3\Examples\Helpfile\



Probleme
-----------------------------
Problem:
Im rechten Fenster der Hilfedatei, wo die Hilfetexte stehen sollten, wird nichts angezeigt

Lösung: NTFS-Streams entfernen
- Möglichkeit 1: Datei auf Laufwerk mit anderem Dateisystem kopieren:
Die Datei "AutoIt.chm" auf ein z.B. FAT-formatiertes Laufwerk kopieren (etwa einen USB-Stick), damit werden die Datastreams gelöscht, da das FAT-Dateisystem diese Streams nicht unterstützt.
Danach kann die Datei wieder vom Stick geholt werden.

- Möglichkeit 2: Über die Kommandozeile:
type datei.exe > datei.bak
del datei.exe
ren datei.bak datei.exe

- Möglichkeit 3: Mit dem Tool "Streams" von Sysinternals:
streams -d -s datei.exe

- Möglichkeit 4: Dateieigenschaften
Falls bei den Dateieigenschaften der Datei "AutoIt.chm" beim Register "allgemein" ganz unten bei "Sicherheit" die Checkbox "Zulassen" existiert, ist diese anzuhaken