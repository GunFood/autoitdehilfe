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

; Übersetzen eines A1-Bereichs in einen R1C1-Bereich und umgekehrt
Local $sFormula = "C4:G12"
; Relativ: A1 zu R1C1
Local $sR1C1 = _Excel_ConvertFormula($oExcel, $sFormula, $xlA1, $xlR1C1, $xlRelative)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 1", "Fehler bei der Umwandlung der Formel in den R1C1-Stil." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; R1C1 zu A1
Local $sA1 = _Excel_ConvertFormula($oExcel, $sR1C1, $xlR1C1, $xlA1, $xlRelative)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 1", "Fehler bei der Umwandlung der Formel in den Stil A1." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Ergebnis anzeigen
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 1", "Konvertierungstyp: Relativ" & @CRLF & "  A1 zu einem R1C1-Stil: " & $sFormula & " zu " & $sR1C1 & @CRLF & "  R1C1 zu A1 Stil: " & $sR1C1 & " zu " & $sA1)

; Absolut: A1 zu R1C1
$sR1C1 = _Excel_ConvertFormula($oExcel, $sFormula, $xlA1, $xlR1C1, $xlAbsolute)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 1", "Fehler bei der Umwandlung der Formel in den R1C1-Stil." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; R1C1 zu A1
$sA1 = _Excel_ConvertFormula($oExcel, $sR1C1, $xlR1C1, $xlA1, $xlAbsolute)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 1", "Fehler bei der Umwandlung der Formel in den Stil A1." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Ergebnis anzeigen
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_ConvertFormula Beispiel 1", "Konvertierungstyp: Absolut" & @CRLF & "  A1 zu einem R1C1-Stil: " & $sFormula & " zu " & $sR1C1 & @CRLF & "  R1C1 zu A1 Stil: " & $sR1C1 & " zu " & $sA1)
