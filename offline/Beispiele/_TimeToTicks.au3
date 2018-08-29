#include <Date.au3>
#include <MsgBoxConstants.au3>

Global $iSec, $iMin, $iHour
; Ermittelt Ticks der aktuellen Zeit
Local $StartTicks = _TimeToTicks(@HOUR, @MIN, @SEC)
; Berechne Ticks in 45 Minuten
Local $EndTicks = $StartTicks + 45 * 60 * 1000
; In Uhrzeit umrechnen
_TicksToTime($EndTicks, $iHour, $iMin, $iSec)
MsgBox($MB_SYSTEMMODAL, '', 'Neue Zeit:' & $iHour & ":" & $iMin & ":" & $iSec)
