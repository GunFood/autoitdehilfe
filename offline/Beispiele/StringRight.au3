#include <MsgBoxConstants.au3>

Local $sString = StringRight("Dies ist ein Satz mit Leerzeichen.", 5) ; Erfasst 5 Zeichen von der rechten Seite des Strings.
MsgBox($MB_SYSTEMMODAL, "", "Die 5 Zeichen von rechts lauten: " & $sString)
