#include <Date.au3>
#include <MsgBoxConstants.au3>

Local $aMyDate, $aMyTime
_DateTimeSplit("2005/01/01 14:30", $aMyDate, $aMyTime)
If @error Then
	MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Ergebnis", "Fehler")
Else
	Local $sMsg = "Jahr = " & @TAB & @TAB & $aMyDate[1] & @CRLF
	$sMsg &= "Monat = " & @TAB & $aMyDate[2] & @CRLF
	$sMsg &= "Tag = " & @TAB & @TAB & $aMyDate[3] & @CRLF
	$sMsg &= "Stunde = " & @TAB & $aMyTime[1] & @CRLF
	$sMsg &= "Minute = " & @TAB & $aMyTime[2] & @CRLF
	If $aMyTime[0] = 3 Then $sMsg &= "Sekunde = " & @TAB & $aMyTime[3] & @CRLF
	MsgBox($MB_SYSTEMMODAL, "Ergebnis", $sMsg)
EndIf
