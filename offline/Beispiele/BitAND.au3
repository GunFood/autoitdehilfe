#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Hinweis: "b" ist das Zeichen für binär.

	; Weist einer lokalen Variable die bitweise AND Operation von 1 und 0 zu.
	Local $iBitAND1 = BitAND(1, 0)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitAND1)

	; Weist einer lokalen Variable die bitweise AND Operation von 1 und 1 zu.
	Local $iBitAND2 = BitAND(1, 1)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitAND2)

	; Weist einer lokalen Variable die bitweise AND Operation von 13 (1101b) und 7 (0111b) zu.
	Local $iBitAND3 = BitAND(13, 7) ; 1101b AND 0111b = 0101b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitAND3)

	; Weist einer lokalen Variable die bitweise AND Operation von 2 (0010b), 3 (0011b) und 6 (0110b) zu.
	Local $iBitAND4 = BitAND(2, 3, 6) ; 0010b AND 0011b AND 0110b = 0010b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitAND4)
EndFunc   ;==>Example
