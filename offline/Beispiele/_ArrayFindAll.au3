#include <Array.au3>

Local $aArray[5] = [0, 1, 2, 1, 0]
_ArrayDisplay($aArray, "1D Array")
Local $aiResult = _ArrayFindAll($aArray, 0)
_ArrayDisplay($aiResult, "Ergebnis")

Local $aArray[5][5] = [[0, 1, 2, 1, 0], _
		[4, 5, 5, 4, 2], _
		[4, 1, 3, 1, 3], _
		[0, 3, 2, 1, 0], _
		[1, 5, 5, 4, 1]]
_ArrayDisplay($aArray, "2D Array")

Local $aResult = _ArrayFindAll($aArray, 0, Default, Default, Default, Default, 4)
_ArrayDisplay($aResult, "Ergebnis in Spalte 4")

$aResult = _ArrayFindAll($aArray, 1, Default, Default, Default, Default, 2, True)
_ArrayDisplay($aResult, "Ergebnis in Zeile 2")
