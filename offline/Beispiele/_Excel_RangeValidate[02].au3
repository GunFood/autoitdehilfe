#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open(True, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example", "Fehler beim Erstellen einer neuen Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Nur Werte aus einer in einem Zellbereich (Spalte 'D') definierten Liste sind gültig
; Werte in einen Bereich schreiben
Local $aValidation[] = ["10", "20", "30", "40", "50"]
_Excel_RangeWrite($oWorkbook, Default, $aValidation, "D1")
; Nur Werte aus dem Bereich sind gültig
_Excel_RangeValidate($oWorkbook, Default, "C:C", $xlValidateList, "=D:D")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example 2", "Fehler beim Setzen der Bereichsüberprüfung." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example 2", "Validierung gegen eine Liste von Werten im Zellbereich '=D:D' erfolgreich für Spalte 'C' gesetzt.")
