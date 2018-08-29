#Include <Array.au3>
#include <MsgBoxConstants.au3>

Local $aArray_Base[2] = ["Original Item 0", "Original Item 1"]
Local $aArray
Local $sFill = ""
For $i = 2 To 6
	$sFill &= $i & "|" ; Es ist zu beachten, dass Variablen hier als Zahl-Datentyp hinzugefügt werden
Next
$sFill = StringTrimRight($sFill, 1)
MsgBox($MB_SYSTEMMODAL, "Hinzuzufügender getrennter String", $sFill)

; Fügt Items durch einen getrennten String hinzu
$aArray = $aArray_Base
_ArrayAdd($aArray, $sFill)
_ArrayDisplay($aArray, "Umgeandelt in einen String")
; Wird jedoch beim Einfügen in einen String-Datentyp konvertiert
MsgBox($MB_SYSTEMMODAL, "Ergebnis", "Daten:" & @TAB & $aArray[6] & @CRLF & "Datentyp:" & @TAB & VarGetType($aArray[6]))

; Fügt Items durch einen getrennten String hinzu
$aArray = $aArray_Base
; Es wird der Datentyp Zahl erzwungen
_ArrayAdd($aArray, $sFill, Default, Default, Default, $ARRAYFILL_FORCE_NUMBER)
_ArrayDisplay($aArray, "Datentyp Zahl erzwungen")
; Der Datentyp wird zum erforderlichen Typ gezwungen
MsgBox($MB_SYSTEMMODAL, "Ergebnis", "Daten:" & @TAB & $aArray[6] & @CRLF & "typ:" & @TAB & VarGetType($aArray[6]))
