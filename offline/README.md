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

L�sung: NTFS-Streams entfernen
- M�glichkeit 1: Datei auf Laufwerk mit anderem Dateisystem kopieren:
Die Datei "AutoIt.chm" auf ein z.B. FAT-formatiertes Laufwerk kopieren (etwa einen USB-Stick), damit werden die Datastreams gel�scht, da das FAT-Dateisystem diese Streams nicht unterst�tzt.
Danach kann die Datei wieder vom Stick geholt werden.

- M�glichkeit 2: �ber die Kommandozeile:
type datei.exe > datei.bak
del datei.exe
ren datei.bak datei.exe

- M�glichkeit 3: Mit dem Tool "Streams" von Sysinternals:
streams -d -s datei.exe

- M�glichkeit 4: Dateieigenschaften
Falls bei den Dateieigenschaften der Datei "AutoIt.chm" beim Register "allgemein" ganz unten bei "Sicherheit" die Checkbox "Zulassen" existiert, ist diese anzuhaken