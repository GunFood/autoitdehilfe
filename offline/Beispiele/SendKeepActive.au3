Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Hält das Editorfenster aktiv während die Send-Funktion verwendet wird.
	SendKeepActive("[CLASS:Notepad]")

	; Simuliert die Eingabe eines Textes. Falls versucht wird ein anderes Fenster als das Editorfenster zu aktivieren, dann erhählt das Editorfenster automatisch wieder den Eingabefokus.
	For $i = 1 To 10
		Sleep(500)
		Send("notepad - ")
	Next

	; Deaktiviert, dass das Editorfenster aktiv sein muss während der Send-Funktion.
	SendKeepActive("")

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)

	; Nun erscheint eine Meldung mit der Frage, ob die Änderungen gespeichert werden sollen.
	; Der Klassenname (classname) des Fenster lautet "#32770".
	; Anschließend wird die "TAB"-Taste gedrückt um zum zweiten Button zu wechseln. Dieser wird automatisch durch drücken der "ENTER"-Taste betätigt, so dass die Datei nicht gespeichert wird.
	WinWaitActive("[CLASS:#32770]")
	Sleep(500)
	Send("{TAB}{ENTER}")
EndFunc   ;==>Example
