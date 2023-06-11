#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines neuen Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel", "Fehler beim Erstellen eines neuen Workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Übersetzen einer Formel vom Stil A1 in den Stil R1C1 und verwenden einer relativen Referenz
Local $sFormula = "=SUM(C4:G12)", $sReference = "B2"
Local $sConverted = _Excel_ConvertFormula($oExcel, $sFormula, $xlA1, $xlR1C1, $xlRelative, $oExcel.Range($sReference))
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 2", "Fehler bei der Umwandlung der Formel." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 2", "Übersetzen einer A1-Formel in eine R1C1 und verwenden von " & $sReference & " als relative Referenz:" & @CRLF & $sFormula & " zu " & $sConverted)
