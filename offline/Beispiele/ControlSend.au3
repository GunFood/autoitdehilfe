#include "Extras\HelpFileInternals.au3"

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Sendet einen Textstring an das Edit-Control des Editors. Dabei wird für den "title" Parameter von ControlSend das von WinWait zurückgegebenen Handle verwendet.
	ControlSend($hWnd, "", ControlGetFocus($hWnd), "Dies ist ein Text")

	_NotepadForceClose($hWnd)
EndFunc   ;==>Example
