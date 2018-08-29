#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Die Werte sind die gleichen, also ist der Ausdruck True
	MsgBox($MB_SYSTEMMODAL, "Ergebnis: 1=1", (1 = 1) ? "True!" : "False!")
	; Die Werte sind nicht die gleichen, also ist der Ausdruck False
	MsgBox($MB_SYSTEMMODAL, "Ergebnis: 1=2", (1 = 2) ? "True!" : "False!")
EndFunc   ;==>Example
