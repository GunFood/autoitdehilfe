#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpenText Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnen einer Textdatei als abgegrenzt, Trennzeichen = |, Feldinfo übergeben und
; Dezimaltrennzeichen und Tausenderseparator setzen.
Local $sTextFile = _Extras_PathFull("_Excel1.txt")
Local $aField1[2] = [1, $xlTextFormat]
Local $aField2[2] = [2, $xlTextFormat]
Local $aField3[2] = [3, $xlGeneralFormat]
Local $aField4[2] = [4, $xlDMYFormat]
Local $aField5[2] = [5, $xlTextFormat]
Local $aFieldInfo[5] = [$aField1, $aField2, $aField3, $aField4, $aField5]
_Excel_BookOpenText($oExcel, $sTextFile, Default, $xlDelimited, Default, True, "|", $aFieldInfo, ",", ".")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpenText Beispiel 1", "Fehler beim Öffnen von '" & $sTextFile & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpenText Beispiel 1", "Workbook '" & $sTextFile & "' wurde erfolgreich geöffnet.")
