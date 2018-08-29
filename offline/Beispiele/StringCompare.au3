#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Local $sStr1 = "Tiësto"
Local $sStr2 = "TIËSTO"

; Vergleicht zwei String ohne die Groß- und Kleinschreibung.
Local $iCmp = StringCompare($sStr1, $sStr2)
MsgBox($MB_SYSTEMMODAL, "", _
		"Vergleiche '" & $sStr1 & "' mit '" & $sStr2 & "'" & @CRLF & _
		"StringCompare Ergebnis (Modus $STR_NOCASESENSE): " & $iCmp)

; Vergleicht zwei String unter Berücksichtigung der Groß- und Kleinschreibung.
$iCmp = StringCompare($sStr1, $sStr2, $Str_CASESENSE)
MsgBox($MB_SYSTEMMODAL, "", _
		"Vergleiche '" & $sStr1 & "' mit '" & $sStr2 & "'" & @CRLF & _
		"StringCompare Ergebnis (Modus $STR_CASESENSE): " & $iCmp)

; Vergleicht zwei String ohne die Groß- und Kleinschreibung.
$iCmp = StringCompare($sStr1, $sStr2, $Str_NOCASESENSEBASIC)
MsgBox($MB_SYSTEMMODAL, "", _
		"Vergleiche '" & $sStr1 & "' mit '" & $sStr2 & "'" & @CRLF & _
		"StringCompare Ergebnis (Modus $STR_NOCASESENSEBASIC): " & $iCmp)
