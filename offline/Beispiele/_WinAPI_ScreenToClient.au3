#include <MsgBoxConstants.au3>
#include <WinAPIConv.au3>

Example()

Func Example()
	Local $hWnd = GUICreate("Beispiel", 200, 200)
	Local $tPoint = DllStructCreate("int X;int Y")
	DllStructSetData($tPoint, "X", 641)
	DllStructSetData($tPoint, "Y", 459)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ScreenToClient($hWnd, $tPoint)
	MsgBox($MB_SYSTEMMODAL, "_WINAPI_ClientToScreen-Beispiel", "Die Bildschirmkoordinaten [x = 641, y = 459]" & @CRLF & _
			"entsprechen folgender Position im Client-Bereich:" & @CRLF & @CRLF & _
			@TAB & @TAB & "X: " & DllStructGetData($tPoint, "X") & @CRLF & _
			@TAB & @TAB & "Y: " & DllStructGetData($tPoint, "Y") & @CRLF)
EndFunc   ;==>Example
