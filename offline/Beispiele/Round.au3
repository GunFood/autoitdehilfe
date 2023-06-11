#include <MsgBoxConstants.au3>

Local $iRound1 = Round(-1.582, 1) ; Gibt -1.6 zurück
Local $iRound2 = Round(3.1415, 9) ; Keine Veränderung
Local $iRound3 = Round(123.5, -1) ; Gibt 120 zurück

MsgBox($MB_SYSTEMMODAL, "", "Die folgenden Werte sind gerundet: " & @CRLF & _
		$iRound1 & @CRLF & $iRound2 & @CRLF & $iRound3)
