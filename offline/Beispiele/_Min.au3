#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $x = _Min(1, 10) ; Gibt 1 zurück
MsgBox($MB_SYSTEMMODAL, '', 'Minimaler Wert: ' & $iMin)
