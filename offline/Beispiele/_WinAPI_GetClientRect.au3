#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd, $tRECT
	$hWnd = GUICreate("test")
	$tRECT = _WinAPI_GetClientRect($hWnd)
	MsgBox($MB_SYSTEMMODAL, "Rechteck", _
			"Links.: " & DllStructGetData($tRECT, "Left") & @CRLF & _
			"Rechts: " & DllStructGetData($tRECT, "Right") & @CRLF & _
			"Oben..: " & DllStructGetData($tRECT, "Top") & @CRLF & _
			"Unten.: " & DllStructGetData($tRECT, "Bottom"))
EndFunc   ;==>Example
