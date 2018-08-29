#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd
	$hWnd = GUICreate("test")
	MsgBox($MB_SYSTEMMODAL, "Ermittelt den Namen der Klasse", "Name der Klasse von " & $hWnd & ": " & _WinAPI_GetClassName($hWnd))
EndFunc   ;==>Example
