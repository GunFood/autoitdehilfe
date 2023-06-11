#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispiel-Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 4", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Arbeitsmappe 2 öffnen
Local $oWorkbook2 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel3.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 4", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel3.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf
; Arbeitsmappe 1 öffnen
Local $oWorkbook1 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 4", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Blatt 1 der Arbeitsmappe 1 vor Blatt 1 der Arbeitsmappe 2 verschieben
_Excel_SheetCopyMove($oWorkbook1, 1, $oWorkbook2, 1, Default, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 4", "Fehler beim Verschieben des Blatts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 4", "Arbeitsmappe 1 Blatt 1 nach Arbeitsmappe2 vor Blatt 1 verschoben")
