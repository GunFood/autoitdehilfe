#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich der Nachricht die in FileOpenDialog dargestellt werden soll.
	Local Const $sMessage = "Strg oder Shift drücken um mehrere Dateien auszuwählen."

	; Zeigt einen Öffnen-Dialog an um eine Liste von Dateien auszuwählen.
	Local $sFileOpenDialog = FileOpenDialog($sMessage, @WindowsDir & "\", "Bilder (*.jpg;*.bmp)|Videos (*.avi;*.mpg)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
	If @error Then
		; Zeigt die Fehlermeldung.
		MsgBox($MB_SYSTEMMODAL, "", "Keine Dateien ausgewählt.")

		; Ändert das Arbeitsverzeichnis (@WorkingDir) zurück in den Skriptordner so wie FileOpenDialog es auf das zuletzt ausgewählte Verzeichnis ändert.
		FileChangeDir(@ScriptDir)
	Else
		; Ändert das Arbeitsverzeichnis (@WorkingDir) zurück in den Skriptordner so wie FileOpenDialog es auf das zuletzt ausgewählte Verzeichnis ändert.
		FileChangeDir(@ScriptDir)

		; Ersetzt im von FileOpenDialog zurückgegebenen String "|" mit @CRLF.
		$sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)

		; Zeigt die Liste der ausgewählten Dateien.
		MsgBox($MB_SYSTEMMODAL, "", "Es wurden folgende Dateien ausgewählt:" & @CRLF & $sFileOpenDialog)
	EndIf
EndFunc   ;==>Example
