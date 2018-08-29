#include <MsgBoxConstants.au3>

Local $iSum = 0, $iAns = 0

While 1 ; Endlosschleife bis ExitLoop aufgerufen wird
	$iAns = InputBox("Summe=" & $iSum, _
			"	Bitte eine positive Zahl eingeben. (Durch die Eingabe einer negativen Zahl wird die InputBox beendet)")
	If $iAns < 0 Then ExitLoop
	$iSum = $iSum + $iAns
WEnd

MsgBox($MB_SYSTEMMODAL, "", "Die Summe beträgt: " & $iSum)
