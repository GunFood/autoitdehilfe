#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $aArray_Base[2] = ["Original Item 0", "Original Item 1"]
_ArrayDisplay($aArray_Base, "1D - Basis Array")

; Fügt ein einzelnes Item hinzu
Local $aArray = $aArray_Base
Local $sSingleFill = "Neues Item 2"
_ArrayAdd($aArray, $sSingleFill)
_ArrayDisplay($aArray, "1D - Einzeln")

; Fügt einen String mit einem Trennzeichen ein. Jedes Item fügt ein neues Element hinzu
$aArray = $aArray_Base
Local $sFill = ""
For $i = 1 To 5
	$sFill &= "Neues Item " & $i + 1 & "|"
Next
$sFill = StringTrimRight($sFill, 1)
MsgBox($MB_SYSTEMMODAL, "String mit einem Trennzeichen zu hinzufügen", $sFill)
_ArrayAdd($aArray, $sFill)
_ArrayDisplay($aArray, "1D - String mit einem Trennzeichen")

; Fügt ein 1D Array hinzu. Jedes Item fügt ein neues Element hinzu
$aArray = $aArray_Base
Local $aFill[5]
For $i = 0 To 4
	$aFill[$i] = "Neues Item " & $i + 2
Next
_ArrayDisplay($aFill, "hinzuzufügendes Array")
_ArrayAdd($aArray, $aFill)
_ArrayDisplay($aArray, "1D - 1D Array")
