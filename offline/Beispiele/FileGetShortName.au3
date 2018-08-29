#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich des Dateipfads um den Dateinamen im Format 8.3 zu ermitteln.
	Local Const $sFilePath = @ProgramFilesDir

	; Zeigt den Pfad und Dateiname im Format 8.3 des Programm-Ordners.
	MsgBox($MB_SYSTEMMODAL, "", FileGetShortName($sFilePath))
EndFunc   ;==>Example
