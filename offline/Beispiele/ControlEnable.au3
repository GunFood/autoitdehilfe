Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Deaktiviert das Edit-Control des Editors durch die Verwendung des von WinWait zurückgegebenen Handles.
	ControlDisable($hWnd, "", "Edit1")

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Aktiviert das Edit-Control des Editors durch die Verwendung des von WinWait zurückgegebenen Handles.
	ControlEnable($hWnd, "", "Edit1")

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
