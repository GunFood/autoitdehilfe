#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open(True, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example", "Fehler beim Erstellen einer neuen Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Benutzerdefinierte Validierung. Die Summe aller Zellen in Spalte 'E' muss < 100 sein.
_Excel_RangeValidate($oWorkbook, Default, "E:E", $xlValidateCustom, "=SUM(E:E)<=100", Default, Default, Default, Default, "Summe aller Zellen in Spalte 'E' < 100.")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example 4", "Fehler beim Setzen der Bereichsüberprüfung." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example 4", "Die Summe aller Zellen in Spalte 'E' muss < 100 sein.")
