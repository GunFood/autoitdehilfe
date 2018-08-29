#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $aArray_Base[2][2] = [["Original Item 0 - 0", "Original Item 0 - 1"], ["Original Item 1 - 0", "Original Item 1 - 1"]]
Local $aArray
Local $sFill = 1 & @CRLF & 2 ; Es ist zu beachten, dass Variablen hier als Zahl-Datentyp hinzugefügt werden
MsgBox($MB_SYSTEMMODAL, "hinzuzufügender getrennter String", $sFill)

; Fügt Items durch einen durch Trennzeichen getrennten String hinzu
$aArray = $aArray_Base
 _ArrayInsert($aArray, "0;1", $sFill)
_ArrayDisplay($aArray, "In einen String umgewandelt")
; Wird jedoch beim Einfügen in einen String-Datentyp konvertiert
MsgBox($MB_SYSTEMMODAL, "Ergebnis", "Daten:" & @TAB & $aArray[2][0] & @CRLF & "Datentype:" & @TAB & VarGetType($aArray[2][0]))

; Fügt Items durch einen durch Trennzeichen getrennten String hinzu
$aArray = $aArray_Base
; Der Datentyp wird zum erforderlichen Typ gezwungen
Local $hDataType = Number
 _ArrayInsert($aArray, "0;1", $sFill, Default, Default, Default, $ARRAYFILL_FORCE_NUMBER)
_ArrayDisplay($aArray, "Forced to number")
; Der Datentyp wird zum erforderlichen Typ gezwungen
MsgBox($MB_SYSTEMMODAL, "Ergebnis", "Daten:" & @TAB & $aArray[2][0] & @CRLF & "Datentype:" & @TAB & VarGetType($aArray[2][0]))
