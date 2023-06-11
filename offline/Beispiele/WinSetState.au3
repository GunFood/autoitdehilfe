Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Setzt den Status des Editorfenster auf "versteckt".
	WinSetState($hWnd, "", @SW_HIDE)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Setzt den Status des Editorfenster auf "zeigen".
	WinSetState($hWnd, "", @SW_SHOW)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
