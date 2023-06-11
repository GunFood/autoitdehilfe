#include <Array.au3>
#include <MsgBoxConstants.au3>

;verwendet ein 2D Array

Local $avArray[6][2] = [ _
		["String0", "SubString0"], _
		["String1", "SubString1"], _
		["String2", "SubString2"], _
		["String3", "SubString3"], _
		["String4", "SubString4"], _
		["String5", "SubString5"]]

_ArrayDisplay($avArray, "$avArray")

Local $sSearch = InputBox("_ArraySearch() Demo", "Welcher String soll gesucht werden?")
If @error Then Exit

Local $sColumn = InputBox("_ArraySearch() Demo", "Welche Spalte soll durchsucht werden?")
If @error Then Exit
$sColumn = Int($sColumn)

Local $iIndex = _ArraySearch($avArray, $sSearch, 0, 0, 0, 1, 1, $sColumn)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Nicht gefunden", '"' & $sSearch & '" wurde nicht in der Spalte ' & $sColumn & ' gefunden.')
Else
	MsgBox($MB_SYSTEMMODAL, "Gefunden", '"' & $sSearch & '" wurde im Array an Stelle ' & $iIndex & ' in der Spalte ' & $sColumn & ' gefunden.')
EndIf
