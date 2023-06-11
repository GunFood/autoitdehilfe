#include <MsgBoxConstants.au3>

Local $fResult = myDiv(5, 0)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Teilung durch Null")
Else
	MsgBox($MB_SYSTEMMODAL, "Ergebnis", $fResult)
EndIf
Exit

Func myDiv($iDividend, $iDivisor)
	If $iDividend = 0 And $iDivisor = 0 Then
		SetError(2) ; Nicht ermittelbare Form 0/0
	ElseIf $iDivisor = 0 Then
		SetError(1) ; Teilung durch Null
	EndIf
	Return $iDividend / $iDivisor
EndFunc   ;==>myDiv
