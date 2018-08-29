#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist ein lokalein Variable den natürlichen Logarithmus von 1000 zu.
	Local $fLog1 = Log(1000)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fLog1)

	; Weist ein lokalein Variable den 10er natürlichen Logarithmus von 1000 zu.
	Local $fLog2 = Log10(1000)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $fLog2)
EndFunc   ;==>Example

; Benutzerdefinierte Funktion für einen gemeinsamen Log
Func Log10($fNb)
	Return Log($fNb) / Log(10) ; 10 ist die Grundlage
EndFunc   ;==>Log10
