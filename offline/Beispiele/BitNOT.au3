#include <MsgBoxConstants.au3>

; Weist einer lokalen Variable die bitweise NOT Operation von 5 zu.
Local $iBitNOT1 = BitNOT(5)

#cs Comments:
	Hinweis: "b" ist das Zeichen für binär.

	Ergebnis ist -6 weil für 32-bit Werte
	+5 == 0000 0000 0000 0000 0000 0000 0000 0101b
	-6 == 1111 1111 1111 1111 1111 1111 1111 1010b
	und das erste Bit das Vorzeichenbit ist.
#ce Comments:

; Zeigt das Ergebnis.
MsgBox($MB_SYSTEMMODAL, "", $iBitNOT1)
