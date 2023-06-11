#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Arbeitsmappe 2 öffnen
Local $oWorkbook2 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel3.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel3.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf
; Arbeitsmappe 1 öffnen
Local $oWorkbook1 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Kopieren einer einzelnen Zelle aus einer anderen Arbeitsmappe. Übergeben des Quellbereichs als Objekt.
Local $oRange = $oWorkbook2.Worksheets(1).Range("A1")
_Excel_RangeCopyPaste($oWorkbook1.Worksheets(1), $oRange, "G15")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 2", "Fehler beim Kopieren von Zellen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeCopy Example 2", "Bereich 'A1' aus der Arbeitsmappe _Excel3.xls erfolgreich nach 'G15' kopiert.")
