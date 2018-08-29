#include <File.au3>

; Öffnet die Logdatei im Schreibmodus

Local $hFile = FileOpen(@ScriptDir & "\Example.log", 1) ; Öffnet die Logdatei im Schreibmodus

_FileWriteLog($hFile, "Text 1") ; Schreibt in die Logdatei. Das Dateihandle wurde von FileOpen zurückgegeben.
FileClose($hFile) ; Schließt das Dateihandle um die Datei wieder freizugeben.
