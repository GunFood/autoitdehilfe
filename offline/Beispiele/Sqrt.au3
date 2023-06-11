#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist eine lokalen Variable die Quadratwurzel von 2 zu.
	Local $fSqrt1 = Sqrt(2)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fSqrt1)

	; Weist eine lokalen Variable die Quadratwurzel von 9 zu.
	Local $fSqrt2 = Sqrt(9)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fSqrt2)
EndFunc   ;==>Example
