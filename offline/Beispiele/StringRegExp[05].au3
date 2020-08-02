#Region    ;************ Includes ************
#include <Array.au3>
#EndRegion ;************ Includes ************
$sTest = "Name Paul (Müller). Name Hans (Schmidt oder Meier)."
$sPattern = "Name\h(\w+)\h*\(([^\)]*)\)"
#cs
Name\h        "Name" gefolgt von einem horizontalen Tab/Leerzeichen.
(\w+)         Eine Folge von Wörterzeichen [a-zA-Z_0-9], 1-mal oder mehr, in einer Gruppe aufgefangen - Vorname.
\h*\(         Horizontale Tabs/Leerzeichen, 0-mal oder mehr, gefolgt von öffnender Klammer.
([^\)]*)      Alle Zeichen außer schließender Klammer, 0-mal oder mehr, in einer Gruppe aufgefangen - Nachname(n).
\)            Am Ende eine schließende Klammer.
#ce

Global $a2D[0][2]
Global $iArrayIdx = -1

$aMatch = StringRegExp($sTest, $sPattern, 1) ; $STR_REGEXPARRAYMATCH
ConsoleWrite("$aMatch --> " & _cwArray($aMatch, 1) & @LF) ; ==> Paul | Müller

$aMatch = StringRegExp($sTest, $sPattern, 2) ; $STR_REGEXPARRAYFULLMATCH
ConsoleWrite("$aMatch --> " & _cwArray($aMatch, 2) & @LF) ; ==> Name Paul (Müller) | Paul | Müller

$aMatch = StringRegExp($sTest, $sPattern, 3) ; $STR_REGEXPARRAYGLOBALMATCH
ConsoleWrite("$aMatch --> " & _cwArray($aMatch, 3) & @LF) ; ==> Paul | Müller | Hans | Schmidt oder Meier

$aMatch = StringRegExp($sTest, $sPattern, 4) ; $STR_REGEXPARRAYGLOBALFULLMATCH
ConsoleWrite("$aMatch --> " & _cwArray($aMatch, 4) & @LF) ; ==> [a-0]: Name Paul (Müller) | Paul | Müller | [a-1]: Name Hans (Schmidt oder Meier) | Hans | Schmidt oder Meier

Func _cwArray($a, $iFlag, $sText = "")
	Local $s
	For $i = 0 To UBound($a) - 1
		If IsArray($a[$i]) Then
			$iArrayIdx += 1
			$s &= "[a-" & $iArrayIdx & "]: " & _cwArray($a[$i], $iFlag, " (Unter-Array) " & $i)
		Else
			If $iFlag = 4 Then _ArrayAdd($a2D, '{Array} ' & $iArrayIdx & '  Item ' & $i & '|' & $a[$i])
			$s &= $a[$i] & " | "
		EndIf
	Next
	If $iFlag < 4 Then
		_ArrayDisplay($a, "Flag " & $iFlag & $sText)
	Else
		If Not StringInStr($sText, " (Unter-Array) ") Then
			_ArrayDisplay($a2D, "Flag " & $iFlag & " (Unter-Arrays) ")
		EndIf
	EndIf
	Return $s
EndFunc   ;==>_cwArray
