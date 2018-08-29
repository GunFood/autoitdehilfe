#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt das Handle des Edit-Controls im Editor. Dabei wird für den "title" Parameter von ControlGetHandle das von WinWait zurückgegebenen Handle verwendet.
	Local $hControl = ControlGetHandle($hWnd, "", "Edit1")

	; Zeigt das Handle des Edit-Controls.
	MsgBox($MB_SYSTEMMODAL, "", "Das Handle von Edit1 lautet: " & $hControl)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
