Example()

Func Example()
	; Startet WordPad
	Run("Write.exe")

	; Wartet maximal 10 Sekunden bis das WordPad-Fenster erscheint.
	Local $hWnd = WinWait("[CLASS:WordPadClass]", "", 10)

	; Setzt den Titel des WordPad-Fensters durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinSetTitle($hWnd, "", "Neuer Wordpadtitel - AutoIt")

	; Wartet 2 Sekunden um das WordPad-Fenster mit dem neuen Titel darzustellen.
	Sleep(2000)

	; Schließt das WordPad-Fenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
