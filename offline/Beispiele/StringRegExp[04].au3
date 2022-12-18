; Option 4, globale Rückgabe, php/preg_match_all()-Stil

#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Local $aArray = StringRegExp('F1oF2oF3o', '(F.o)*?', $STR_REGEXPARRAYGLOBALFULLMATCH)
#cs
	1. Capturing Gruppe (F.o)*?
	*? findet Zeichen zwischen null und unbegrenzt oft, aber so wenig wie möglich, Erweiterung nach Bedarf (träge)
#ce
_ArrayDisplay($aArray, "Option 4 Ergebnisse")
Local $aMatch = 0
For $i = 0 To UBound($aArray) - 1
	$aMatch = $aArray[$i]
	If UBound($aMatch) > 1 Then
		_ArrayDisplay($aMatch, "Array #" & $i)
	Else
		MsgBox($MB_SYSTEMMODAL, "Array #" & $i, "'" & $aMatch[0] & "' StringLen = " & StringLen(StringLen))
	EndIf
Next
