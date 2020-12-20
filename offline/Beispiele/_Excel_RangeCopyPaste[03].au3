#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Arbeitsmappe 1 öffnen
Local $oWorkbook1 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Kopieren von 2 Zeilen (1 und 2) aus Arbeitsblatt 2 in die Zwischenablage
_Excel_RangeCopyPaste($oWorkbook1.Worksheets(2), "1:2")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 3", "Fehler beim Kopieren von Zeilen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 3", "Zeilen 1+2 erfolgreich von Arbeitsblatt 2 in die Zwischenablage kopiert.")

; Einfügen des in Beispiel 3 geschriebenen Bereichs aus der Zwischenablage in das aktive Arbeitsblatt.
; Es werden nur Werte ohne Formatierung eingefügt.
_Excel_RangeCopyPaste($oWorkbook1.Activesheet, Default, "1:1", Default, $xlPasteValues)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 4", "Fehler beim Kopieren von Zeilen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 4", "2 Zeilen erfolgreich aus der Zwischenablage in Zeile 1 eingefügt.")
