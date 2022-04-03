#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer lokalen Variable die Nummer 18 zu.
	Local $iNb = 18

	; Wenn die Modulo-Operation von $iNb durch 2 gleich 0 ist, dann ist $iNb gerade
	If Mod($iNb, 2) = 0 Then
		MsgBox($MB_SYSTEMMODAL, "", $iNb & " ist eine gerade Zahl.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", $iNb & " ist eine ungerade Zahl.")
	EndIf

	; Weist einer lokalen Variable die Rechenoperation von 4 geteilt durch 7 zu.
	Local $iMod1 = Mod(4, 7) ; 4%7 = 4 da Divisor > Dividend

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "$iMod1", $iMod1)

	; Weist einer lokalen Variable die Modulo-Operation von 1 geteilt durch 3/4 zu.
	Local $iMod2 = Mod(1, 3 / 4) ; 1%(3/4) = 0.25 weil der Divisor ein Float ist.

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "$iMod2", $iMod2)
EndFunc   ;==>Example
