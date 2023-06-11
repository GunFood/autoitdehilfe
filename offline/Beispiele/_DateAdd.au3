#include <Date.au3>
#include <MsgBoxConstants.au3>

; Addiert zum heutigen Datum 5 Tage dazu
Local $sNewDate = _DateAdd('d', 5, _NowCalcDate())
MsgBox($MB_SYSTEMMODAL, "", "Heute + 5 Tage: " & $sNewDate)

; Subtrahiert vom heutigen Datum 2 Wochen
$sNewDate = _DateAdd('w', -2, _NowCalcDate())
MsgBox($MB_SYSTEMMODAL, "", "Heute minus 2 Wochen: " & $sNewDate)

; Addiert zur jetzigen Zeit 15 Minuten
$sNewDate = _DateAdd('n', 15, _NowCalc())
MsgBox($MB_SYSTEMMODAL, "", "Aktuelle Zeit + 15 Minuten: " & $sNewDate)

; Addiert zum 01.01.1970 1087497645 Sekunden und gibt das neue Datum zurück
$sNewDate = _DateAdd('s', 1087497645, "1970/01/01 00:00:00")
MsgBox($MB_SYSTEMMODAL, "", "Datum: " & $sNewDate)
