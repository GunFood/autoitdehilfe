#include <Date.au3>

Local $iMsg = "Testdaten"
; Schreibt eine Datei ins Skriptverzeichnis, die das Erstellungsdatum in der Form YYYY/MM/DD enthält
FileWriteLine(@TempDir & "\NCD.log", _NowCalcDate() & " :" & $iMsg)
