Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Lässt das Fenster 4 Mal mit einer Pause von jeweils einer halben Sekunde blinken
	WinFlash($hWnd, "", 4, 1000)

	; Wartet 5 Sekunden, damit das Editor Fenster angezeigt wird. Das Blinken wird beendet.
	Sleep(5000)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
