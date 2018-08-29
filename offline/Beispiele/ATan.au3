#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weisst einer lokalen Variable den Arctangens von 0.5 zu.
	Local $fArcTan1 = ATan(0.5)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fArcTan1 & " rad.")

	; Weisst einer lokalen konstanten Variable die gerundete PI-Zahl zu.
	Local Const $PI = 3.141592653589793

	; Weisst einer lokalen Variable die Formel für das umrechnen von Bogenmaß (Radian) in Grad zu (entspricht einem Bogenmaß in Grad).
	Local $fRadToDeg = 180 / $PI

	; Weisst einer lokalen Variable eine Gradzahl zu.
	Local $fArcTan2 = $fRadToDeg * ATan(1)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fArcTan2 & " Grad.")
EndFunc   ;==>Example
