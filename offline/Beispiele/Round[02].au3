#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer lokalen Variable ein Array mit gerundeten Zahlen zu.
	Local $aRound[5]

	$aRound[0] = Round(-1.582, 1) ; Gibt -1.6 zurück.
	$aRound[1] = Round(3.1415, 9) ; Gibt 3.1415 zurück.
	$aRound[2] = Round(123.5, -1) ; Gibt 120 zurück.
	$aRound[3] = Round(123.5) ; Gibt 124 zurück.
	$aRound[4] = Round(50) ; Gibt 50 zurück.

	; Zeigt das Ergebnis.
	For $i = 0 To UBound($aRound) - 1
		MsgBox($MB_SYSTEMMODAL, "", "Gerundet" & $i & ": " & $aRound[$i] & @CRLF)
	Next
EndFunc   ;==>Example
