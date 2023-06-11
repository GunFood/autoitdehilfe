#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die X-Position, Y-Position und Größe (Breite und Höhe) des Edit-Controls im Editor. Dabei wird für den "title" Parameter von ControlGetPos das von WinWait zurückgegebenen Handle verwendet.
	Local $aPos = ControlGetPos($hWnd, "", "Edit1")

	; Zeigt die Position und Größe des Edit-Controls.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & $aPos[0] & ", " & $aPos[1] & @CRLF & "Size: " & $aPos[2] & ", " & $aPos[3])

	; Schließt das Editorfenster durch die Verwendung des von WinWait zurückgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
