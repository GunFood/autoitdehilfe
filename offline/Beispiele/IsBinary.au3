#include <MsgBoxConstants.au3>

Local $dBinary = Binary("0x00204060")
Local $sString = "0x00204060"

MsgBox($MB_SYSTEMMODAL, "Gibt 1 zurück, wenn die Variable binär ist", IsBinary($dBinary))
MsgBox($MB_SYSTEMMODAL, "Gibt 1 zurück, wenn die Variable ein String ist", IsBinary($sString))
