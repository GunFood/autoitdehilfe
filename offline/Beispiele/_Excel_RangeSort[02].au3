#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeSort Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeSort Example", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Einen Bereich mit Überschriften absteigend in Spalte K sortieren. Zahlen als Text sortieren
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeSort Example 2", "OK drücken, um den Bereich I1:K7 zu sortieren. Schlüssel ist Spalte K.")
_Excel_RangeSort($oWorkbook, Default, "I1:K7", "K:K", $xlDescending, Default, $xlYes)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeSort Example 2", "Fehler beim Sortieren von Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeSort Example 2", "Daten erfolgreich im Bereich I1:K7 sortiert")
