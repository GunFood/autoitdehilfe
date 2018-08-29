#include <MsgBoxConstants.au3>
#include <WinAPIConv.au3>

Example()

Func Example()
	Local $hWnd = GUICreate("Beispiel", 200, 200)
	Local $tPoint = DllStructCreate("int X;int Y")
	DllStructSetData($tPoint, "X", 100)
	DllStructSetData($tPoint, "Y", 160)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ClientToScreen($hWnd, $tPoint)
	MsgBox($MB_SYSTEMMODAL, "_WINAPI_ClientToScreen Beispiel", "Bildschirmkoordinaten des Punktes [100,160] im Anwendungsfenster: " & @CRLF & _
			"X: " & DllStructGetData($tPoint, "X") & @CRLF & _
			"Y: " & DllStructGetData($tPoint, "Y") & @CRLF)
EndFunc   ;==>Example
