#include <MsgBoxConstants.au3>

Local $sString = StringTrimRight("Dies ist ein Satz mit Leerzeichen.", 5) ; Entfernt die 5 Zeichen von rechts des Strings.
MsgBox($MB_SYSTEMMODAL, "", $sString)
