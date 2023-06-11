#include <MsgBoxConstants.au3>

Local $sString = StringLeft("Dies ist ein Satz mit Leerzeichen.", 5) ; Gibt die 5 Zeichen von links des Strings zurück.
MsgBox($MB_SYSTEMMODAL, "", "Die 5 linken Zeichen sind: " & $sString)
