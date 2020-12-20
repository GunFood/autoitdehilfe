#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Print Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel4.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Print Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel4.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Drucken einer vollständigen Arbeitsmappe auf dem Standarddrucker.
_Excel_Print($oExcel, $oWorkbook)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Print Example 3", "Fehler beim Drucken der Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Print Example 3", "Arbeitsmappe erfolgreich gedruckt.")
