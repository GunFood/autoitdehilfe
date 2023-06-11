Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Sekunden bevor die WinKill-Funktion aufgerufen wird.
	Sleep(2000)

	; Erzwingt die Schließung des Fensters durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinKill($hWnd, "")
EndFunc   ;==>Example
