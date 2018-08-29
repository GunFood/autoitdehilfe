#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich des Dateipfads um den Dateinamen im Langformat zu ermitteln.
	Local Const $sFilePath = @HomeDrive & "\PROGRA~1" ; Dies ist das gleiche wie @ProgramFilesDir.

	; Zeigt den langen Pfad und Dateiname des Programm-Ordners.
	MsgBox($MB_SYSTEMMODAL, "", FileGetLongName($sFilePath))
EndFunc   ;==>Example
