#RequireAdmin

#include <AutoItConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Deaktiviert die Benutzereingaben durch die Maus und Tastatur.
	BlockInput($BI_DISABLE)

	; Wartet 2 Sekunden
	Sleep(2000)

	; Sendet die 'F5'-Taste an das Edit-Control des Editors um das Datum und die Uhrzeit anzuzeigen. Das Handle welches durch WinWait zurückgegeben wurde, wird für den "title" Parameter von ControlSend verwendet.
	ControlSend($hWnd, "", "Edit1", "{F5}")

	; Aktiviert die Benutzereingaben durch die Maus und Tastatur.
	BlockInput($BI_ENABLE)

	; Wartet 2 Sekunden
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)

	; Nun erscheint eine Meldung mit der Frage, ob die Änderungen gespeichert werden sollen.
	; Der Klassenname (classname) des Fenster lautet "#32770".
	; Anschließend wird die "TAB"-Taste gedrückt um zum zweiten Button zu wechseln. Dieser wird automatisch durch drücken der "ENTER"-Taste betätigt, so dass die Datei nicht gespeichert wird.
	WinWaitActive("[CLASS:#32770]")
	Sleep(500)
	Send("{TAB}{ENTER}")
EndFunc   ;==>Example
