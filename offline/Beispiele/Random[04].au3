#include <MsgBoxConstants.au3>

; Zeigt eine Fehlermeldung wenn der Min-Wert und Max-Wert der gleiche Wert sind.

Example()

Func Example()
	Local $idRandom = Random(10, 10)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist ein Fehler aufgetreten. Beide Werte sind exakt identisch: " & $idRandom)
	EndIf
EndFunc   ;==>Example
