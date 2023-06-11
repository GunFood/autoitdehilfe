#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispielarbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 2", "Fehler beim Erstellen des Excel-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 2", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Fügt ein Arbeitsblatt vor dem zweiten Arbeitsblatt ein
_Excel_SheetAdd($oWorkbook, 2)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 2", "Fehler beim Einfügen des Arbeitsblattes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 2", "Arbeitsblatt vor Arbeitsblatt 2 eingefügt.")
