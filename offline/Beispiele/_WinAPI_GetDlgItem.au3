#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $hWnd, $idButton
	$hWnd = GUICreate("Test")
	$idButton = GUICtrlCreateButton("Button", 0, 0)
	MsgBox($MB_SYSTEMMODAL, "Handle", "Ermittelt das Handle des angegebenen Controls in einem Dialogfenster: " & _WinAPI_GetDlgItem($hWnd, $idButton))
EndFunc   ;==>Example
