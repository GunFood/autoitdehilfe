#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Zu beachten: "b" ist das Zeichen für Byte.

	; Weist einer lokalen Variable die bitweise XOR Operation von 1 und 0 zu.
	Local $iBitXOR1 = BitXOR(1, 0) ; 0001b XOR 0000b = 0001b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitXOR1)

	; Weist einer lokalen Variable die bitweise XOR Operation von 1 und 1 zu.
	Local $iBitXOR2 = BitXOR(1, 1) ; 0001b XOR 0001b = 0000b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitXOR2)

	; Weist einer lokalen Variable die bitweise XOR Operation von 13 (1101b) und 7 (0111b) zu.
	Local $iBitXOR3 = BitXOR(13, 7) ; 1101b XOR 0111b = 1010b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitXOR3)

	; Weist einer lokalen Variable die bitweise XOR Operation von 2 (0010b), 3 (0011b) und 6 (0110b) zu.
	Local $iBitXOR4 = BitXOR(2, 3, 6) ; 0010b XOR 0011b XOR 0110b = 0111b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitXOR4)
EndFunc   ;==>Example
