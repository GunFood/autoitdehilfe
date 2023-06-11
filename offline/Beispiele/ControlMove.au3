Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Verschiebt das Edit-Control des Editors durch die Verwendung des von WinWait zurückgegebenen Handles.
	ControlMove($hWnd, "", "Edit1", 0, 0, 150, 150)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
