#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt die Position als auch die Höhe und Breite des aktiven Fensters.
	Local $aPos = WinGetPos("[ACTIVE]")

	; Zeigt die Arraywerte die durch WinGetPos zurückgegeben wurden.
	MsgBox($MB_SYSTEMMODAL, "", "X-Pos: " & $aPos[0] & @CRLF & _
			"Y-Pos: " & $aPos[1] & @CRLF & _
			"Breite: " & $aPos[2] & @CRLF & _
			"Höhe: " & $aPos[3])
EndFunc   ;==>Example
