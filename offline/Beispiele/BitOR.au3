#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Hinweis: "b" ist das Zeichen für binär.

	; Weist einer lokalen Variable die bitweise OR Operation von 1 und 0 zu.
	Local $iBitOR1 = BitOR(1, 0) ; 0001b OR 0000b = 0001b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitOR1)

	; Weist einer lokalen Variable die bitweise OR Operation von 1 und 1 zu.
	Local $iBitOR2 = BitOR(1, 1) ; 0001b OR 0001b = 0001b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitOR2)

	; Weist einer lokalen Variable die bitweise OR Operation von 13 (1101b) und 7 (0111b) zu.
	Local $iBitOR3 = BitOR(13, 7) ; 1101b OR 0111b = 1111b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitOR3)

	; Weist einer lokalen Variable die bitweise OR Operation von 2 (0010b), 3 (0011b) und 6 (0110b) zu.
	Local $iBitOR4 = BitOR(2, 3, 6) ; 0010b OR 0011b OR 0110b = 0111b

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iBitOR4)
EndFunc   ;==>Example
