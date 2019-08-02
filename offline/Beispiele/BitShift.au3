#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Hinweis: "b" ist das Zeichen für binär.

	; Weist einer lokalen Variable die bitweise links-rotierte Operation von 2 zu.
	Local $iBitShift1 = BitShift(2, -1) ; 2 = 0010b einmal links-rotiert -> 4 = 0100b

	; Zu beachten: Es ist das gleiche wie: BitRotate(2, 1)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitShift1)

	; Weist einer lokalen Variable die bitweise links-rotierte Operation von 1 zu.
	Local $iBitShift2 = BitShift(1, 1) ; 1 = 0001b einmal rechts-rotiert -> 0 = 0000b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitShift2)

	; Weist einer lokalen Variable die bitweise links-rotierte Operation von 14 zu.
	Local $iBitShift3 = BitShift(14, -2) ; 14 = 1110b zweimal rechts-rotiert -> 56 = 0011 1000b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitShift3)

	; Weist einer lokalen Variable die bitweise Operation zu.
	Local $iBitShift4 = BitShift(1, -31)
	;1 = 0001b 31x rechts-rotiert -> -2147483648 (32 bits) = 1000 0000 0000 0000 0000 0000 0000 0000b

	; Zu beachten: in der Darstellung als 2-Komplement das 32. Bit von rechts das Minuszeichen darstellt

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitShift4)
EndFunc   ;==>Example
