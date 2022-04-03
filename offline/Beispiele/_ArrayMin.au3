#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $aArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox($MB_SYSTEMMODAL, 'Minimaler String Wert', _ArrayMin($aArray, 0, 1))
MsgBox($MB_SYSTEMMODAL, 'Minimaler numerischer Wert', _ArrayMin($aArray, 1, 0))

Local $aArray[4][4]
For $i = 0 To 3
	For $j = 0 To 3
		$aArray[$i][$j] = Random(0, 99, 1)
	Next
Next
_ArrayDisplay($aArray, "2D Array")
MsgBox($MB_SYSTEMMODAL, 'Minimaler numerischer Wert in Spalte 2', _ArrayMin($aArray, 1, 0, -1, 2))
