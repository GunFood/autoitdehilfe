#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt den Fenstertext des aktiven Fensters
	Local $sText = WinGetText("[ACTIVE]")

	; Zeigt den Fenstertext.
	MsgBox($MB_SYSTEMMODAL, "", $sText)
EndFunc   ;==>Example
