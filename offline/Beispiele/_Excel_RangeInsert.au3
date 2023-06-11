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

; Einen Bereich mit 3 Zeilen und 2 Spalten vor A1 auf dem aktiven Arbeitsblatt einfügen
; und die Zellen nach unten verschieben.
_Excel_RangeInsert($oWorkbook.Activesheet, "A1:B3", $xlShiftDown)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeInsert Example 1", "Fehler beim Einfügen von Zellen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeInsert Example 1", "Bereich erfolgreich eingefügt.")
