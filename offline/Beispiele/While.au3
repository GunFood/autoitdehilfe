#include <MsgBoxConstants.au3>

Local $i = 0
While $i <= 10
	MsgBox($MB_SYSTEMMODAL, "Der Wert von $i lautet:", $i)
	$i = $i + 1
WEnd
