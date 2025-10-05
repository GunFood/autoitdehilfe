#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines Beispiel Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"), True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel", "Fehler beim Öffnen des Workbook '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel", "Enter drücken um den ersten Filter zu setzen!")

; Filtern des gesamten aktiven Arbeitsblatt in Spalte 1.
; Nur Zeilen mit Inhalten >20 und <40 in der angegebenen Spalte anzeigen.
_Excel_FilterSet($oWorkbook, Default, "A1:E30", 1, ">20", 1, "<40")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 1", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 1", "Gefiltert in Spalte 'A'. Nur Zeilen mit Werten >20 und <40 anzeigen.")

; Hinzufügen eines Filters zu Spalte 2.
; Nur Zeilen mit Inhalt <310 in der angegebenen Spalte anzeigen.
_Excel_FilterSet($oWorkbook, Default, Default, 2, "<310")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 2", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 1", "Filter auf Spalte 'B' hinzugefügt. Nur Zeilen mit Werten <310 anzeigen.")

; Filter aus Spalte 1 entfernen.
_Excel_FilterSet($oWorkbook, Default, Default, 1)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 3", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 1", "Filter aus Spalte 'A' entfernt.")

; Nur ausgewählte Werte (20, 40 und 60) der Spalte 2 anzeigen.
Local $aShow[] = ["20", "40", "60"]
_Excel_FilterSet($oWorkbook, Default, Default, 2, $aShow, $xlFilterValues)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 4", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 1", "Filter in Spalte 'B' so einstellen, dass nur ausgewählte Werte (20, 40 und 60) angezeigt werden.")

; Entfernen aller Filter.
_Excel_FilterSet($oWorkbook, Default, Default, 0)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 5", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterSet Beispiel 1", "Alle Filter entfernt.")
