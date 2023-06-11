#include <MsgBoxConstants.au3>
#include <WinAPIMisc.au3>

Example()

Func Example()
	Local $hWnd = GUICreate("Test")
	Local $iX = _WinAPI_GetMousePosX()
	Local $iX2 = _WinAPI_GetMousePosX(True, $hWnd)
	Local $iY = _WinAPI_GetMousePosY()
	Local $iY2 = _WinAPI_GetMousePosY(True, $hWnd)

	MsgBox($MB_SYSTEMMODAL, "Mausposition: ", _
			"Bildschirmbezug: X = " & $iX & "  Y = " & $iY & @CRLF & @CRLF & _
			"Anwendungsbezug: X = " & $iX2 & "  Y = " & $iY2)
EndFunc   ;==>Example
