#include <MsgBoxConstants.au3>

Local $aPos = MouseGetPos()
MsgBox($MB_SYSTEMMODAL, "Maus x, y:", $aPos[0] & ", " & $aPos[1])
