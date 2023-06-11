#include <Date.au3>
#include <MsgBoxConstants.au3>

; Gibt den ausgeschriebenen Namen des aktuellen Wochentages zurück (leider nur auf Englisch)
Local $sLongDayName = _DateDayOfWeek(@WDAY)

; Gibt den abgekürzten Namen des aktuellen Wochentages zurück (leider nur auf Englisch)
Local $sShortDayName = _DateDayOfWeek(@WDAY, $DMW_SHORTNAME)

MsgBox($MB_SYSTEMMODAL, "Wochentag", "Heute ist " & $sLongDayName & " (" & $sShortDayName & ")")
