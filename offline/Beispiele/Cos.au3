#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weisst einer lokalen konstanten Variable die gerundete PI-Zahl zu.
	Local Const $PI = 3.141592653589793

	; Weisst einer lokalen Variable den Cosinus von PI / 4 (entspricht Sqrt(2 / 2) zu.
	Local $fCos1 = Cos($PI / 4)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fCos1)

	; Weisst einer lokalen Variable die Formel für das umrechnen von Radian in Grad (gleich wie ein Grad in Radian) zu.
	Local $fDegToRad = $PI / 180

	; Weisst einer lokalen Variable den Cosinus von 90 Grad zu (zuerst in Radian umgeandelt).
	Local $fCos2 = Cos(90 * $fDegToRad)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fCos2)
EndFunc   ;==>Example
