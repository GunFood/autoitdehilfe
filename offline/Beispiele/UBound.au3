#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3> ; Required for _ArrayDisplay.

Example()

Func Example()
	Local $aArray[10][20]
	Local $iRows = UBound($aArray, $UBOUND_ROWS) ; Gesamte Anzahl von Zeilen. In diesem Beispiel sind es 10.
	Local $iCols = UBound($aArray, $UBOUND_COLUMNS) ; Gesamte Anzahl von Spalten. In diesem Beispiel sind es 20.
	Local $iDimension = UBound($aArray, $UBOUND_DIMENSIONS) ; Die Dimension des Arrays, z. B. 1/2/3 dimensional.

	MsgBox($MB_SYSTEMMODAL, "", "Das Array ist ein " & $iDimension & " dimensionales Array mit " & _
			$iRows & " Zeilen & " & $iCols & " Spalten.")

	; Füllt das Array mit Daten.
	For $i = 0 To $iRows - 1
		For $j = 0 To $iCols - 1
			$aArray[$i][$j] = "Zeile: " & $i & " - Spalte: " & $j
		Next
	Next
	_ArrayDisplay($aArray)
EndFunc   ;==>Example
