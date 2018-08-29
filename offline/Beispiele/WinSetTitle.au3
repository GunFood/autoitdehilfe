Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Setzt den Titel des Editorfensters durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinSetTitle($hWnd, "", "Neuer Editortitel - AutoIt")

	; Wartet 2 Sekunden um das Editorfenster mit dem neuen Titel darzustellen.
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
