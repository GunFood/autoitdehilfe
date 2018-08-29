#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt den Fenstertitel des aktiven Fensters
	Local $sText = WinGetTitle("[ACTIVE]")

	; Zeigt den Fenstertext.
	MsgBox($MB_SYSTEMMODAL, "", $sText)
EndFunc   ;==>Example
