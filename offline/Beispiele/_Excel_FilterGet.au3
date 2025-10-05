#include "Extras\HelpFileInternals.au3"

#include <Array.au3>
#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines Beispiel Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterGet Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"), True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterGet Beispiel", "Fehler beim Öffnen des Workbook '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Setzen von zwei Filtern
_Excel_FilterSet($oWorkbook, Default, "A:E", 3, "<610")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterGet Beispiel", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $aShow[] = ["20", "40", "60"]
_Excel_FilterSet($oWorkbook, Default, "A:E", 2, $aShow, $xlFilterValues)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterGet Beispiel", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterGet Beispiel", "Gesetzte Filter:" & @CRLF & "  Spalte B: Werte = 20, 40 oder 60." & @CRLF & "  Spalte C: Werte <610.")

; Informationen über die Filter auf dem aktiven Arbeitsblatt anzeigen.
Local $aFilters = _Excel_FilterGet($oWorkbook)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_FilterGet Beispiel 1", "Fehler beim Filtern der Daten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
_ArrayDisplay($aFilters, "Excel UDF: _Excel_FilterGet Beispiel 1", Default, Default, Default, "Filter on|#areas|Criteria1|Criteria2|Operator|Range|#Records")
