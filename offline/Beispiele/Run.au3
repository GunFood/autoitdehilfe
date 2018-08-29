Example()

Func Example()
	; Startet den Editor mit einem maximierten Fenster.
	Local $iPID = Run("notepad.exe", "", @SW_SHOWMAXIMIZED)

	; Wartet 10 Sekunden bis das Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schließt den Editor Prozess mit Hilfe der PID die durch Run zurückgegeben wurde.
	ProcessClose($iPID)
EndFunc   ;==>Example
