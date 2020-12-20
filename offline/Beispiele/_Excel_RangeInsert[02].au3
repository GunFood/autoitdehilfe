#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeInsert Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeInsert Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extra\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; 3 Spalten vor Spalte B auf dem aktiven Arbeitsblatt einfügen
_Excel_RangeInsert($oWorkbook.Activesheet, "B:D")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeInsert Example 2", "Fehler beim Einfügen von Spalten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeInsert Example 2", "3 Spalten erfolgreich vor Spalte B eingefügt.")
