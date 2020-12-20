#include <Array.au3>
#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Lesen der Formeln eines Zellbereichs auf Blatt 2 der angegebenen Arbeitsmappe
Local $aResult = _Excel_RangeRead($oWorkbook, 2, "A1:C1", 2)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example 2", "Fehler beim Lesen aus der Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example 2", "Daten erfolgreich gelesen." & @CRLF & "Bitte auf 'OK' klicken, um die Formeln der Zellen A1:C1 von Blatt 2 anzuzeigen.")
_ArrayDisplay($aResult, "Excel UDF: _Excel_RangeRead Example 2 - Zellen A1:C1 von Blatt 2")
