#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich des Dateipfads welcher umbenannt wird.
	; Create a constant variable in Local scope of the filepaths that will be renamed.
	Local Const $sSource = _WinAPI_GetTempFileName(@TempDir), _
			$sDestination = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei die umbenannt wird.
	If Not FileWrite($sSource, "Dies ist ein Beispiel für die Verwendung von FileMove.") Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Benennt eine Datei um. Dabei wird FileMove verwendet. Falls die neue Datei bereits existiert, wird diese überschrieben.
	FileMove($sSource, $sDestination, $FC_OVERWRITE)

	; Zeigt das Ergebnis mit der umbenannten Zieldatei..
	MsgBox($MB_SYSTEMMODAL, "", "Existiert die Quelldatei?: " & FileExists($sSource) & @CRLF & _ ; FileExists sollte 0 zurückgeben.
			"Existiert die Zieldatei?: " & FileExists($sDestination) & @CRLF) ; FileExists sollte 1 zurückgeben.

	; Löscht die temporären Dateien. FileDelete prüft, ob die Datei existiert.
	FileDelete($sSource)
	FileDelete($sDestination)
EndFunc   ;==>Example
