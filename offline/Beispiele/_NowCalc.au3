#include <Date.au3>
#include <MsgBoxConstants.au3>

; Berechnet die Anzahl der Sekunden seit dem 01.01.1970 0:00:00 (Unixzeit EPOCH 1970/01/01 00:00:00)
Local $iDateCalc = _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
MsgBox($MB_SYSTEMMODAL, "", "Vergangene Sekunden seit EPOCH: " & $iDateCalc)

; Berechnet die Anzahl der in diesem Jahr vergangenen Stunden
$iDateCalc = _DateDiff('h', @YEAR & "/01/01 00:00:00", _NowCalc())
MsgBox($MB_SYSTEMMODAL, "", "Dieses Jahr ist " & $iDateCalc & " Stunden alt.")

; Details zur Unixzeit unter http://de.wikipedia.org/wiki/Unixzeit
