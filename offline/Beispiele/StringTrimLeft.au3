#include <MsgBoxConstants.au3>

Local $sString = StringTrimLeft("Dies ist ein Satz mit Leerzeichen.", 5) ; Entfernt die 5 Zeichen von links des Strings.
MsgBox($MB_SYSTEMMODAL, "", $sString)
