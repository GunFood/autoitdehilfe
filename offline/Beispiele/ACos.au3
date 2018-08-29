#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weisst einer lokalen Variable den Arccosinus von 0.5 zu.
	Local $fArcCos1 = ACos(0.5)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fArcCos1 & " rad.")

	; Weisst einer lokalen konstanten Variable die gerundete PI-Zahl zu.
	Local Const $PI = 3.141592653589793

	; Weisst einer lokalen Variable die Formel für das umrechnen von Bogenmaß (Radian) in Grad zu (entspricht einem Bogenmaß in Grad).
	Local $fRadToDeg = 180 / $PI

	; Weisst einer lokalen Variable eine Gradzahl zu.
	Local $fArcCos2 = $fRadToDeg * ACos(-1)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fArcCos2 & " Grad.")
EndFunc   ;==>Example
