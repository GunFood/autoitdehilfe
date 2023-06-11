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

; Löschen eines Bereichs mit 3 Zeilen und 2 Spalten auf dem aktiven Arbeitsblatt
; und Verschieben der Zellen nach oben.
Local $sRange = "J5:K7"
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeDelete Example 1", "Löschen von Zellen " & $sRange & ".")
_Excel_RangeDelete($oWorkbook.ActiveSheet, $sRange, $xlShiftUp)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeDelete Example 1", "Fehler beim Löschen von Zellen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
