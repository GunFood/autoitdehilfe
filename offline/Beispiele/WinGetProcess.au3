#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die PID dvom Editor durch die Verwendung des von WinWait zurückgegebenen Handles.
	Local $iPID = WinGetProcess($hWnd)

	; Zeigt die PID des Fensters.
	MsgBox($MB_SYSTEMMODAL, "", "Die PID lautet: " & $iPID)

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
