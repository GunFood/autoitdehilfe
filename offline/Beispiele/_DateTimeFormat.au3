#include <Date.au3>
#include <MsgBoxConstants.au3>

; Zeigt das Datum in dem PC Format.
MsgBox($MB_SYSTEMMODAL, "Langes PC Format", _DateTimeFormat(_NowCalc(), 1))
MsgBox($MB_SYSTEMMODAL, "Kurzes PC Format", _DateTimeFormat(_NowCalc(), 2))
