#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor und wartet bis der Editorprozess geschlossen wurde.
	Local $iReturn = ShellExecuteWait("notepad.exe")

	; Zeigt den Rückgabecode des Editorprozesses.
	MsgBox($MB_SYSTEMMODAL, "", "Der Rückgabecode des Editorprozesses lautet: " & $iReturn)
EndFunc   ;==>Example
