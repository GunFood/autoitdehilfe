#include <MsgBoxConstants.au3>
#include <WinAPIGdiDC.au3>

Example()

Func Example()
	Local $hWnd, $hDC
	$hWnd = GUICreate("Test")
	$hDC = _WinAPI_GetDC($hWnd)
	MsgBox($MB_SYSTEMMODAL, "Handle", "Anzeigegerät: " & $hDC)
	_WinAPI_ReleaseDC($hWnd, $hDC)
EndFunc   ;==>Example
