#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer lokalen Variable ein Array mit Zahlen zu.
	Local $aNumber[8] = [4.8, 4.5, 4.3, 4, -4.8, -4.5, -4.3, -4]

	; Weist einer lokalen Variable einen String zu. Dieser enthält das Ergebnis.
	Local $sResults = ""

	; Durchläuft das Array,rundet die Zahl ab und formatiert das Ergebnis.
	For $i = 0 To 7
		$sResults &= "Floor(" & $aNumber[$i] & ") = " & Floor($aNumber[$i]) & @CRLF & ($i = 3 ? @CRLF : "")
	Next

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $sResults)
EndFunc   ;==>Example
