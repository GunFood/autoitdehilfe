#include <MsgBoxConstants.au3>

; Wirft einen Würfel.

Example()

Func Example()
	MsgBox($MB_SYSTEMMODAL, "", "Der Würfel zeigt die Zahl " & Random(1, 6, 1) & ".") ; Gibt einen Integer zwischen 1 und 6 zurück.
EndFunc   ;==>Example
