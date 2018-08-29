#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich der Nachricht die in FileOpenDialog dargestellt werden soll.
	Local Const $sMessage = "Bitte eine einzelne Datei eines Types auswählen."

	; Zeigt einen Öffnen-Dialog an um eine Datei auszuwählen.
	Local $sFileOpenDialog = FileOpenDialog($sMessage, @WindowsDir & "\", "Alle (*.*)", $FD_FILEMUSTEXIST)
	If @error Then
		; Zeigt die Fehlermeldung.
		MsgBox($MB_SYSTEMMODAL, "", "No file was selected.")

		; Ändert das Arbeitsverzeichnis (@WorkingDir) zurück in den Skriptordner so wie FileOpenDialog es auf das zuletzt ausgewählte Verzeichnis ändert.
		FileChangeDir(@ScriptDir)
	Else
		; Ändert das Arbeitsverzeichnis (@WorkingDir) zurück in den Skriptordner so wie FileOpenDialog es auf das zuletzt ausgewählte Verzeichnis ändert.
		FileChangeDir(@ScriptDir)

		; Ersetzt im von FileOpenDialog zurückgegebenen String "|" mit @CRLF.
		$sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)

		; Zeigt die Liste der ausgewählten Dateien.
		MsgBox($MB_SYSTEMMODAL, "", "Es wurden folgende Datei ausgewählt:" & @CRLF & $sFileOpenDialog)
	EndIf
EndFunc   ;==>Example
