#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $aArray[6][4]
For $i = 0 To 5
	For $j = 0 To 3
		$aArray[$i][$j] = "#" & $i & $j
	Next
Next
_ArrayDisplay($aArray, "Suche nach '#32'", Default, 8)

; Suche in Spalten (Suchen in Spalte 2)
Local $iIndex = _ArraySearch($aArray, "#32", 0, 0, 0, 0, 1, 2)
MsgBox($MB_SYSTEMMODAL, "Gefunden '#32'", "Spalte 2 on Zeile " & $iIndex)

; Suche in Zeilen (Suchen in Zeile 3)
$iIndex = _ArraySearch($aArray, "#32", 0, 0, 0, 0, 1, 3, True)
MsgBox($MB_SYSTEMMODAL, "Gefunden '#32'", "Zeile 3 in Spalte " & $iIndex)
