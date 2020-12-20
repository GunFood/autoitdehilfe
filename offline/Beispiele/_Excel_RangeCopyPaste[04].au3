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

; Übertragen des Formats einer Zelle auf andere Zellen
_Excel_RangeCopyPaste($oWorkbook1.Activesheet, "A1") ; Kopieren der Zelle in die Zwischenablage
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example5", "Fehler beim Kopieren von Zelle A1." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
_Excel_RangeCopyPaste($oWorkbook1.Activesheet, Default, "B1:E16", Default, $xlPasteFormats) ; das Format in den Zielbereich einfügen
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example5", "Fehler beim Einfügen von Zellen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 5", "Format der Zelle 'A1' erfolgreich in 'B1:E16' eingefügt.")
