#include <Array.au3>

Local $aArray[5] = [0, 1, 2, 3, 4]

_ArrayDisplay($aArray, "Original")
_ArrayDelete($aArray, 2)
_ArrayDisplay($aArray, "Element 2 gelöscht")

Local $aArray_Base[25][4]
For $i = 0 To 24
	For $j = 0 To 3
		$aArray_Base[$i][$j] = $i & "-" & $j
	Next
Next

; Einzelne Zeile
$aArray = $aArray_Base
_ArrayDisplay($aArray, "VOR dem löschen")
_ArrayDelete($aArray, 7)
_ArrayDisplay($aArray, "EINZELNE ZEILE gelöscht")

; Bereich Übergabe als String
$aArray = $aArray_Base
Local $sRange = "0;11-15;24"
_ArrayDisplay($aArray, "VOR dem löschen")
_ArrayDelete($aArray, $sRange)
ConsoleWrite(" " & @error & @CRLF)
_ArrayDisplay($aArray, "BEREICH (ÜBERGABE ALS STRING) gelöscht")

; Bereich Übergabe als 1D-Array
$aArray = $aArray_Base
Local $aDel[4] = [3, 5, 11, 13]
_ArrayDisplay($aArray, "VOR dem löschen")
_ArrayDelete($aArray, $aDel)
_ArrayDisplay($aArray, "BEREICH (ÜBERGABE ALS ARRAY) gelöscht")
