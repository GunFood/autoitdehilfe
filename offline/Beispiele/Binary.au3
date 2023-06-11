#include <MsgBoxConstants.au3>

Local $dBinary = Binary("0x00204060") ; konvertiert einen String in eine binäre Darstellung

MsgBox($MB_SYSTEMMODAL, "Gibt 1 zurück, wenn die Variable binär ist", IsBinary($dBinary))
