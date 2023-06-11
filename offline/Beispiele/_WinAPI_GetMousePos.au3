#include <MsgBoxConstants.au3>
#include <WinAPIMisc.au3>

Example()

Func Example()
	Local $hWnd = GUICreate("Test")
	Local $tPoint = _WinAPI_GetMousePos()
	Local $tPoint2 = _WinAPI_GetMousePos(True, $hWnd)

	MsgBox($MB_SYSTEMMODAL, "Mausposition: ", _
			"Bildschirmbezug: X = " & DllStructGetData($tPoint, "X") & "  Y = " & DllStructGetData($tPoint, "Y") & @CRLF & @CRLF & _
			"Anwendungsbezug: X = " & DllStructGetData($tPoint2, "X") & "  Y = " & DllStructGetData($tPoint2, "Y"))
EndFunc   ;==>Example
