#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeReplace Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeReplace Example", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Inhalt der Zelle A1 durch einen anderen Wert ersetzen
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeReplace Example 1", "OK drücken, um die Daten in Zelle 'A1' zu ändern..")
_Excel_RangeReplace($oWorkbook, Default, "A1", 1, 3.37)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeReplace Example 1", "Fehler beim Ersetzen von Daten im Bereich." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeReplace Example 1", "Daten in Zelle 'A1' erfolgreich ersetzt.")
