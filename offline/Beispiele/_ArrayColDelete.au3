#include <Array.au3>

Local $aArray[4][3]
For $i = 0 To 3
	For $j = 0 To 2
		$aArray[$i][$j] = $i & $j
	Next
Next
_ArrayDisplay($aArray, "Original")

_ArrayColDelete($aArray, 2)
_ArrayDisplay($aArray, "Spalte 2 gelöscht")

; Kopiert das 2-Spalten Array
Local $aArray_2Col = $aArray

; Standardmäßig wird eine Spalte im 2D Array belassen
_ArrayColDelete($aArray, 0)
_ArrayDisplay($aArray, "Spalte 0 gelöscht - 2D Array")

; Wandelt das 1-Spalten Array in ein 1D Array um
_ArrayColDelete($aArray_2Col, 0, True)
_ArrayDisplay($aArray_2Col, "Spalte 0 gelöscht - 1D Array")
