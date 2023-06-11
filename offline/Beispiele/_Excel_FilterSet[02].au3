#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines Beispiel Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel", "Fehler beim Öffnen des Workbook '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel", "Enter drücken um den ersten Filter zu setzen!")

; Filtern der Spalte M nach Datum. Alle Termine im Oktober 2013 und 2014 anzeigen.
; 0-Jahr, 1-Monat, 2-Tag, 3-Stunde, 4-Minute, 5-Sekunde
Local $aShow[] = [1, "01/10/2013", 1, "01/10/2014"]
_Excel_FilterSet($oWorkbook, Default, Default, 13, Default, $xlFilterValues, $aShow)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 6", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 2", "Spalte 'M' gefiltert nach Datum. Alle Termine im Oktober 2013 und 2014 anzeigen.")

; Filtern der Spalte M nach Datum. Alle Daten des letzten Jahres anzeigen.
_Excel_FilterSet($oWorkbook, Default, Default, 13, $xlFilterLastYear, $xlFilterDynamic)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 7", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 2", "Spalte 'M' gefiltert nach Datum. Alle Daten des letzten Jahres anzeigen.")
