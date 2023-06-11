#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Wandelt eine Spaltenzahl einer Excel-Datei in einen Spaltenbuchstaben
Local $iCol = 676
Local $sLetter = _Excel_ColumnToLetter($iCol)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ColumnToLetter Beispiel 1", "Fehler beim umwandeln der Zahl in einen Buchstaben." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ColumnToLetter Beispiel 1", "Zahl: " & $iCol & " = Buchstabe: " & $sLetter)
