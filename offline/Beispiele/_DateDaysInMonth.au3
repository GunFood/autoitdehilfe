#include <Date.au3>
#include <MsgBoxConstants.au3>

Local $iDays = _DateDaysInMonth(@YEAR, @MON)
MsgBox($MB_SYSTEMMODAL, "Tage des Monats ", "Dieser Monat hat genau  " & String($iDays) & " Tage. ")
