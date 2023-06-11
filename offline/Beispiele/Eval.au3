#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist der Variable sString Daten zu.
	Assign("sString", "Dies ist ein String der durch die Funktion Assign deklariert wurde")

	; Ermittelt den Wert der Variable sString und weisst diesen der Variable $sEvalString zu.
	Local $sEvalString = Eval("sString")

	; Zeigt den Wert von $sEvalString. Dieser sollte der gleiche sein wie $sString.
	MsgBox($MB_SYSTEMMODAL, "", $sEvalString)
EndFunc   ;==>Example
