#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeDelete Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeDelete Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Löschen von 2 Zeilen (1 und 2) auf Arbeitsblatt 3
$oWorkbook.Worksheets(3).Activate
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeDelete Example 2", "Löschen der Zeilen 1 und 2 auf Arbeitsblatt 3.")
_Excel_RangeDelete($oWorkbook.Worksheets(3), "1:2")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeDelete Example 2", "Error deleting rows." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
