#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $fDegrees = 35
Local $fRadians = _Radian($fDegrees)

MsgBox($MB_SYSTEMMODAL, "Umrechnung: Grad in Radiant", $fDegrees & "° = " & $fRadians & " rad")
