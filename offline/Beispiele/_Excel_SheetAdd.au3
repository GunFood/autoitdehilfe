#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispielarbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Fügt zwei Arbeitsblätter nach dem letzten Arbeitsblatt ein und ändert den Namen dieser neuen Arbeitsblätter
_Excel_SheetAdd($oWorkbook, -1, False, 2, "Test1|Test2")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 1", "Fehler beim Einfügen des Arbeitsblattes" & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 1", "Zwei Arbeitsblätter nach dem letzten Arbeitsblatt eingefügt.")
