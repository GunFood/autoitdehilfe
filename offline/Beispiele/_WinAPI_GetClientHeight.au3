#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd
	$hWnd = GUICreate("Test")
	MsgBox($MB_SYSTEMMODAL, "Anwendungsbereich", "Höhe des Anwendungsbereichs: " & _WinAPI_GetClientHeight($hWnd))
EndFunc   ;==>Example
