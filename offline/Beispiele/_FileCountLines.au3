#include <File.au3>
#include <MsgBoxConstants.au3>

Local $iCountLines = _FileCountLines(@ScriptFullPath) ; Ermittelt die Anzahl der Zeilen in dem aktuellen Skript
MsgBox($MB_SYSTEMMODAL, "", "Es befinden sich " & $iCountLines & " Zeilen in der Datei.")
