; Beispiel für die Verwendung von ACos mit Grad.

#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $fDegree = _Degree(ACos(-1))

MsgBox($MB_SYSTEMMODAL, Default, "ACos(-1) = " & $fDegree & " Grad")
