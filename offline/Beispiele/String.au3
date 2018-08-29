#include <MsgBoxConstants.au3>

Local $sString = String(10) ; Der an String übergebene Ausdruck wird in Stringdarstellung zurückgegeben, aktuell ist 10 eine Zahl.
MsgBox($MB_SYSTEMMODAL, "", "$sString enthält den Wert: " & $sString & " und IsString gibt folgendes zurück: " & IsString($sString))
