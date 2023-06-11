#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und eine neue Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 4", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 4", "Fehler beim Erstellen der neuen Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Füllt einen Bereich im aktiven Arbeitsblatt in der aktiven Arbeitsmappe mit einer Formel
_Excel_RangeWrite($oWorkbook, $oWorkbook.Activesheet, "=B1+3", "B5:F6", False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 4", "Fehler beim Schreiben in das Arbeitsblatt." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 4", "Bereich erfolgreich mit einer Formel gefüllt.")
