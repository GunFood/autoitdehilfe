Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Sendet einen Mausklick an das Edit-Control des Editor. Dabei wird das von WinWait zurückgegebenen Handle verwendet.
	ControlClick($hWnd, "", "Edit1")

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schließt das Editorfenster durch die Verwendung des Klassennamens (classname) vom Editor.
	WinClose($hWnd)
EndFunc   ;==>Example
