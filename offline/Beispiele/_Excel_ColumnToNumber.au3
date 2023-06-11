#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Wandelt einen Spaltenbuchstaben einer Excel-Datei in eine Spaltenzahl
Local $sCol = "YZ"
Local $iNumber = _Excel_ColumnToNumber($sCol)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ColumnToNumber Beispiel 1", "Fehler beim umwandeln des Buchstabens in eine Zahl." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ColumnToNumber Beispiel 1", "Buchstabe: " & $sCol & " = Zahl: " & $iNumber)
