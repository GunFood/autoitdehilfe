#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Hinweis: "b" ist das Zeichen für binär.

	; Weist einer lokalen Variable die bitweise links-rotierte Operation von 2 zu.
	Local $iBitRotate1 = BitRotate(2, 1) ; 2 = 0010b einmal links-rotiert -> 4 = 0100b

	; Zu beachten: Es ist das gleiche wie: BitShift(2, -1)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitRotate1)

	; Weist einer lokalen Variable die bitweise rechts-rotierte Operation von 1 zu.
	Local $iBitRotate2 = BitRotate(1, -1) ; 1 = 0001b einmal rechts-rotiert -> 32768 (32 bits) = 1000 0000 0000 0000b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitRotate2)

	; Weist einer lokalen Variable die bitweise rechts-rotierte Operation von 14 zu.
	Local $iBitRotate3 = BitRotate(14, -2) ; 14 = 1110b zweimal rechts-rotiert -> 32771 (16 bits) = 1000 0000 0000 0011b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitRotate3)

	; Weist einer lokalen Variable die bitweise rechts-rotierte Operation von 14 bei 32 bits zu.
	Local $iBitRotate4 = BitRotate(14, -2, "D")
	; 14 = 1110b zweimal rechts-rotiert -> -2147483645 (32 bits) = 1000 0000 0000 0000 0000 0000 0000 0011b (das erste Bit wird gezeichnet)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitRotate4)
EndFunc   ;==>Example
