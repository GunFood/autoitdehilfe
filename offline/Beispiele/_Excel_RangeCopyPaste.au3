#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Open Workbook 1
Local $oWorkbook1 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Kopieren eines Bereichs mit 3 Zeilen und 2 Spalten auf das aktive Arbeitsblatt.
; Übergeben des Quellbereichs als Objekt.
Local $oRange = $oWorkbook1.ActiveSheet.Range("I2:J4")
_Excel_RangeCopyPaste($oWorkbook1.ActiveSheet, $oRange, "G7")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 1", "Fehler beim Kopieren von Zellen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 1", "Bereich 'I2:J4' erfolgreich nach 'G7' kopiert.")
