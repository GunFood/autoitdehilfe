#include <MsgBoxConstants.au3>

; Ermittelt die 5 Zeichen ab der zehnten Position des Strings.
Local $sString = StringMid("Dies ist ein Satz mit Leerzeichen.", 10, 5)
MsgBox($MB_SYSTEMMODAL, "", $sString)
