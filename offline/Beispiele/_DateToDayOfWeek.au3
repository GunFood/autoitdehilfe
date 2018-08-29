#include <Date.au3>
#include <MsgBoxConstants.au3>

; Wochentagnummer des gegebenen Datums.
Local $iWeekday = _DateToDayOfWeek(@YEAR, @MON, @MDAY)
; Sollte das gleiche wie @WDAY bewirken
MsgBox($MB_SYSTEMMODAL, "", "Die Wochentagsnummer ist: " & $iWeekday)
MsgBox($MB_SYSTEMMODAL, "", "Heute ist : " & _DateDayOfWeek($iWeekday))
