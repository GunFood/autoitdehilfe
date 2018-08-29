#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd
	$hWnd = GUICreate("Test")
	MsgBox($MB_SYSTEMMODAL, "Anwendungsbereich", "Breite des Anwendungsbereichs: " & _WinAPI_GetClientWidth($hWnd))
EndFunc   ;==>Example
