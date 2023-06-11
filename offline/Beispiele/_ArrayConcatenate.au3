#include <Array.au3>

Local $aArrayTarget[5] = ["0", "1", "2", "3", "4"]
Local $aArraySource[5] = ["5", "6", "7", "8", "9"]

_ArrayDisplay($aArrayTarget, "1D Ziel")
_ArrayDisplay($aArraySource, "1D Quelle")
_ArrayConcatenate($aArrayTarget, $aArraySource)
_ArrayDisplay($aArrayTarget, "1D Ziel und Quelle verbinden")

Local $aArrayTarget[4][3]
For $i = 0 To 3
	For $j = 0 To 2
		$aArrayTarget[$i][$j] = $i & $j
	Next
Next

Local $aArraySource[4][3]
For $i = 0 To 3
	For $j = 0 To 2
		$aArraySource[$i][$j] = (4 + $i) & $j
	Next
Next

_ArrayDisplay($aArrayTarget, "2D Ziel")
_ArrayDisplay($aArraySource, "2D Quelle")
_ArrayConcatenate($aArrayTarget, $aArraySource)
_ArrayDisplay($aArrayTarget, "2D Ziel und Quelle verbinden")
