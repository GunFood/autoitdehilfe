#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Verzeichnisses.
	Local Const $sFilePath = @TempDir & "\DirCreateFolder"

	; Falls das Verzeichnis bereits existiert, beenden.
	If FileExists($sFilePath) Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist ein Fehler aufgetreten. Das Verzeichnis existiert bereits.")
		Return False
	EndIf

	; Öffnet das temporäre Verzeichnis.
	ShellExecute(@TempDir)

	; Erstellt das Verzeichnis.
	DirCreate($sFilePath)

	; Zeigt eine Nachricht der Erstellung des Verzeichnisses.
	MsgBox($MB_SYSTEMMODAL, "", "Das Verzeichnis wurde erstellt.")

	; Löscht das Verzeichnis. und alle Unterverzeichnis.
	DirRemove($sFilePath, $DIR_REMOVE)

	; Zeigt eine Nachricht mit dem Entfernen des Verzeichnisses.
	MsgBox($MB_SYSTEMMODAL, "", "Das Unterverzeichnis: Folder2 wurde gelöscht.")
EndFunc   ;==>Example
