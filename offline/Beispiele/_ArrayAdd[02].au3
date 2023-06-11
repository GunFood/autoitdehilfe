#include <Array.au3>

Local $aArray, $sFill

Local $aArray_Base[2][2] = [["Item 0 - 0", "Item 0 - 1"], ["Item 1 - 0", "Item 1 - 1"]]
_ArrayDisplay($aArray_Base, "2D - Grundarray")

; Fügt einen durch ein Trennzeichen getrennten String hinzu
$aArray = $aArray_Base
$sFill = "Neues Item 2 - 0|Neues Item 2 - 1"
_ArrayAdd($aArray, $sFill)
_ArrayDisplay($aArray, "2D - Item getrennt")

; Fügt einen durch ein Zeilentrennzeichen getrennten String hinzu - eingetragen in Spalte 1
$aArray = $aArray_Base
$sFill = "Neues Item 2 - 1" & @CRLF & "Neues Item 3 - 1"
_ArrayAdd($aArray, $sFill, 1)
_ArrayDisplay($aArray, "2D - Zeile getrennt")

; Fügt ein Item und ein Zeilentrennzeichen getrennten String hinzu
$aArray = $aArray_Base
$sFill = "Neues Item 2 - 0|Neues Item 2 - 1" & @CRLF & "Neues Item 3 - 0|Neues Item 3 - 1"
_ArrayAdd($aArray, $sFill)
_ArrayDisplay($aArray, "2D - Item und Zeile getrennt")

; Fügt ein 2D Array hinzu
$aArray = $aArray_Base
Local $aFill[2][2] = [["Neues Item 2 - 1", "Neues Item 2 - 2"], ["Neues Item 3 - 1", "Neues Item 3 - 2"]]
_ArrayAdd($aArray, $aFill)
_ArrayDisplay($aArray, "2D - 2D Array")

; Fügt ein 2D Array hinzu - Einzelnes Item bzw. Spalte - eingetragen in Spalte 1
$aArray = $aArray_Base
Local $aFill[2][1] = [["Neues Item 2 - 1"], ["Neues Item 3 - 1"]]
_ArrayAdd($aArray, $aFill, 1)
_ArrayDisplay($aArray, "2D - 2D Array")
