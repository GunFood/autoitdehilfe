Example()

Func Example()
	; Simuliert die Tastenkombination Win + R um das Run-Fenster zu öffnen.
	Send("#r")

	; Wartet maximal 10 Sekunden bis das Run-Fenster erscheint.
	WinWait("Run", "", 10)

	; Simuliert die Eingabe 'notepad.exe' und drückt die 'ENTER' Taste.
	Send("notepad.exe{Enter}")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Simuliert die Eingabe des folgenden Strings und drückt die 'F5' Taste für Eingabe des Datums und der Uhrzeit in das Edit-Control des Editors.
	Send("Today's time/date is {F5}")

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)

	; Nun erscheint eine Meldung mit der Frage, ob die Änderungen gespeichert werden sollen.
	; Der Klassenname (classname) des Fenster lautet "#32770".
	; Anschließend wird die "TAB"-Taste gedrückt um zum zweiten Button zu wechseln. Dieser wird automatisch durch drücken der "ENTER"-Taste betätigt, so dass die Datei nicht gespeichert wird.
	WinWaitActive("[CLASS:#32770]")
	Sleep(500)
	Send("{TAB}{ENTER}")
EndFunc   ;==>Example
