#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

; Entfernt führende und nachfolgende Leerzeichen sowie mehrfache Leerzeichen zwischen den Wörtern.
Local $sString = StringStripWS("   Dies   ist   ein   Satz   mit   Leerzeichen.    ", $STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
MsgBox($MB_SYSTEMMODAL, "", $sString)
