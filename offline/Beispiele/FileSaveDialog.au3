#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich der Nachricht die in FileSaveDialog dargestellt werden soll.
	Local Const $sMessage = "Choose a filename."

	; Zeigt einen Öffnen-Dialog an um eine Datei auszuwählen.
	Local $sFileSaveDialog = FileSaveDialog($sMessage, "::{450D8FBA-AD25-11D0-98A8-0800361B1103}", "Skripte (*.au3)", $FD_PATHMUSTEXIST)
	If @error Then
		; Zeigt die Fehlermeldung.
		MsgBox($MB_SYSTEMMODAL, "", "No file was saved.")
	Else
		; Ermittelt den Dateinamen von dem Dateiordner e.g. Example.au3.
		Local $sFileName = StringTrimLeft($sFileSaveDialog, StringInStr($sFileSaveDialog, "\", $STR_NOCASESENSEBASIC, -1))

		; Prüft, ob die Erweiterung .au3 an Ende des Dateinamens enthalten ist.
		Local $iExtension = StringInStr($sFileName, ".", $STR_NOCASESENSEBASIC)

		; Falls ein Punkt gefunden wurde, so wird geprüft, ob oder ob nicht die Erweiterung gleich .au3 ist.
		If $iExtension Then
			; Falls die Erweiterung nicht gleich .au3 ist, dann wird dies an das Ende des Dateipfads angehängt.
			If Not (StringTrimLeft($sFileName, $iExtension - 1) = ".au3") Then $sFileSaveDialog &= ".au3"
		Else
			; Falls kein Punkt gefunden wurde, dann wird die Erweiterung .au3 an das Ende des Dateipfads angehängt.
			$sFileSaveDialog &= ".au3"
		EndIf

		; Zeigt die gespeicherte Datei.
		MsgBox($MB_SYSTEMMODAL, "", "Es wurde die folgende Datei gespeichert:" & @CRLF & $sFileSaveDialog)
	EndIf
EndFunc   ;==>Example
