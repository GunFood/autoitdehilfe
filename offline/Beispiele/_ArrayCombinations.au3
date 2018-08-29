;Deklariert ein 1D Array und erstellt ein Array welches alle möglichen Kombinationen enthält

#include <Array.au3>

Local $aArray[5] = [1, 2, 3, 4, 5]

For $i = 1 To UBound($aArray)
	Local $aArrayCombo = _ArrayCombinations($aArray, $i, ",")
	_ArrayDisplay($aArrayCombo, "iSet = " & $i)
Next
