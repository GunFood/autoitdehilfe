#include <Array.au3>

Local $aArray_Base[10][3]
For $i = 0 To 9
	For $j = 0 To 2
		$aArray_Base[$i][$j] = $i & " - " & $j
	Next
Next
_ArrayDisplay($aArray_Base, "2D - Original")

; Fügt ein einzelnes Item ein
Local $aArray = $aArray_Base
_ArrayInsert($aArray, 7, "Eingefügt über 7-0")
_ArrayDisplay($aArray, "2D - einzelnes Item")

; Fügt ein einzelnes Item in einer festgelegten Spalte hinzu
$aArray = $aArray_Base
_ArrayInsert($aArray, 3, "Eingefügt über 3-1", 1)
_ArrayDisplay($aArray, "2D - festgelegte Spalte")

; Fügt einen durch ein Trennzeichen getrennten String ein - einfügt als 1 Zeile - die anderen Zeilen werden mit " gefüllt
$aArray = $aArray_Base
Local $sFill = "Über 3-0|Über 3-1|Über 3-2"
_ArrayInsert($aArray, "3;5;9", $sFill)
_ArrayDisplay($aArray, "2D - Trennzeichen getrennter String")

; Fügt ein durch ein Zeilentrennzeichen getrennten String ein (Verwendung eines Bereichs eines Arrays) - einfügt als 3 Zeilen - die anderen Zeilen werden mit " gefüllt
$aArray = $aArray_Base
Local $aRange[4] = [3, 3, 5, 9]
$sFill = "Über 3-2" & @CRLF & "Über 5-2" & @CRLF & "Über 9-2"
_ArrayInsert($aArray, $aRange, $sFill, 2) ; Insert in column 2
_ArrayDisplay($aArray, "2D - Trennzeichen getrennter String")

; Fügt ein Item als ein Zeilentrennzeichen ein - eingefügt als 4 Zeilen
$aArray = $aArray_Base
$sFill = "Über 3-0|3-1|3-2" & @CRLF & "Über 5a|5-1a|5-2a" & @CRLF & "Über 5b|5-1b|5-2b" & @CRLF & "Über 9|9-1|9-2"
_ArrayInsert($aArray, "3;5;5;9", $sFill)
_ArrayDisplay($aArray, "2D - Trennzeichen getrennte Zreile bzw String")

; Fügt ein 2D Array hinzu
$aArray = $aArray_Base
Local $aFill_1D[3][3] = [["Über 2", "2-1", "2-2"], ["Über 3", "3-1", "3-2"], ["Über 4", "4-1", "4-2"]]
_ArrayInsert($aArray, "2-4", $aFill_1D)
_ArrayDisplay($aArray, "2D - 2D Array")
