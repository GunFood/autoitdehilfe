#include <Date.au3>
#include <MsgBoxConstants.au3>

; Vollständigen (englischen) Monatsnamen in Textform bestimmen
Local $sLongMonthName = _DateToMonth(@MON)

; Kurzform des englischen Monatsnamens bestimmen
Local $sShortMonthName = _DateToMonth(@MON, $DMW_SHORTNAME)

MsgBox($MB_SYSTEMMODAL, "Aktueller Monat", "Der englische Name des aktuellen Monats lautet: " & $sLongMonthName & " (" & $sShortMonthName & ")")
