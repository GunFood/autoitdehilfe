#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich der Nachricht die in FileSelectFolder dargestellt werden soll.
	Local Const $sMessage = "Select a folder"

	; Zeigt einen Öffnen-Dialog an eine Datei auszuwählen.
	Local $sFileSelectFolder = FileSelectFolder($sMessage, "")
	If @error Then
		; Zeigt die Fehlermeldung.
		MsgBox($MB_SYSTEMMODAL, "", "Kein Ordner ausgewählt.")
	Else
		; Zeigt den ausgewählten Ordner
		MsgBox($MB_SYSTEMMODAL, "", "Es wurde der folgende Ordner ausgewählt:" & @CRLF & $sFileSelectFolder)
	EndIf
EndFunc   ;==>Example
