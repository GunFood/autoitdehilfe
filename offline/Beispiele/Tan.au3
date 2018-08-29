#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weisst einer lokalen konstanten Variable die gerundete PI-Zahl zu.
	Local Const $PI = 3.141592653589793

	; Weisst einer lokalen Variable den Tangens von PI / 4 zu.
	Local $fTan1 = Tan($PI / 4)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fTan1)

	; Weisst einer lokalen Variable die Formel für das umrechnen von Radian in Grad (gleich wie ein Grad in Radian) zu.
	Local $iDegToRad = $PI / 180

	; Weisst einer lokalen Variable den Tangens von 90 Grad zu (zuerst in Radian umgeandelt).
	Local $fTan2 = Tan(90 * $iDegToRad)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fTan2)
EndFunc   ;==>Example
