; == Beispiel 2 Skript mit $sType = „a“

#include <Date.au3>
#include <MsgBoxConstants.au3>

Local $sStartDate = "2024/08/19 18:25:59"
Local $sEndDate = "2024/08/20 16:25:00"

Local $aDiffDate = _DateDiff("a", $sStartDate, $sEndDate)

Local $sAddDate = _DateAdd("a", $aDiffDate, $sStartDate)

Local $iError = 0
If $sAddDate <> $sEndDate Then $iError = $MB_ICONERROR
MsgBox($MB_SYSTEMMODAL + $iError, "Ergebnisse", "$sStartDate = " & $sStartDate & @CRLF & _
		"$sEndDate = " & $sEndDate & @CRLF & @CRLF & _
		"$Diff Tage = " & $aDiffDate[0] & @CRLF & _
		"$Diff Stunden = " & $aDiffDate[1] & @CRLF & _
		"$Diff Minuten = " & $aDiffDate[2] & @CRLF & _
		"$Diff Sekunden = " & $aDiffDate[3] & @CRLF & @CRLF & _
		"Fügt Datum hinzu = " & $sAddDate & @TAB & ($iError ? "<<< KO >>>": "OK"))
