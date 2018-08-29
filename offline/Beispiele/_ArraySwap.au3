#include <Array.au3>

Local $aArray[10] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

_ArrayDisplay($aArray, "Original", Default, 8)
_ArraySwap($aArray, 3, 7)
_ArrayDisplay($aArray, "Getauscht 3 und 7", Default, 8)

Local $aArray_Base[10][10]
For $i = 0 To 9
	For $j = 0 To 9
		$aArray_Base[$i][$j] = $i & " - " & $j
	Next
Next
_ArrayDisplay($aArray_Base, "Original", Default, 8)

$aArray = $aArray_Base
_ArraySwap($aArray, 3, 7)
_ArrayDisplay($aArray, "Getauscht Zeilen 3 und 7 in allen Spalten", Default, 8)

$aArray = $aArray_Base
_ArraySwap($aArray, 3, 7, False, 2, 5)
_ArrayDisplay($aArray, "Getauscht Zeilen 3 und 7 in den Spalten 2 bis 5", Default, 8)

$aArray = $aArray_Base
_ArraySwap($aArray, 3, 7, True)
_ArrayDisplay($aArray, "Getauscht Spalten 3 und 7 in allen Zeilen", Default, 8)

$aArray = $aArray_Base
_ArraySwap($aArray, 3, 7, True, 2, 5)
_ArrayDisplay($aArray, "Getauscht Spalten 3 und 7 in den Spalten 2 bis 5", Default, 8)
