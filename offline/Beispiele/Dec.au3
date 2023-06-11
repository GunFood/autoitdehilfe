#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

_Example()
Func _Example()
	Local $iDec = Dec("FFF", $NUMBER_AUTO)
	MsgBox($MB_SYSTEMMODAL, "", $iDec) ; Stellt die Dezimalzahl 4095 dar.
EndFunc   ;==>_Example
