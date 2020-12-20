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

; Drucken des aktiven Arbeitsblatts auf dem Standarddrucker.
_Excel_Print($oExcel, $oExcel.ActiveSheet)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Print Example 2", "Fehler beim Drucken eines Arbeitsblatts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Print Example 2", "Aktives Arbeitsblatt erfolgreich gedruckt.")
