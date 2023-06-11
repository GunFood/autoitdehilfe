#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hWnd, $hParent
	$hWnd = GUICreate("_WinAPI_GetAncestor")
	$hParent = _WinAPI_GetAncestor($hWnd, $GA_PARENT)
	MsgBox($MB_SYSTEMMODAL, "Parent", "Ermittelt den Vorfahren von " & $hWnd & ": " & $hParent)
	MsgBox($MB_SYSTEMMODAL, "Root", "Ermittelt den Vorfahren von " & $hParent & ": " & _WinAPI_GetAncestor($hWnd, $GA_ROOT))
	MsgBox($MB_SYSTEMMODAL, "Root Owner", "Ermittelt den Vorfahren von " & $hParent & ": " & _WinAPI_GetAncestor($hWnd, $GA_ROOTOWNER))
EndFunc   ;==>Example
