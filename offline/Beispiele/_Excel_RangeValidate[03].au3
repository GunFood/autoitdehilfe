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

; Nur numerische Werte sind gültig
_Excel_RangeValidate($oWorkbook, Default, "B:B", $xlValidateDecimal, 0, $xlGreater, Default, Default, $xlValidAlertStop, "Es wurde ein nicht numerischer Wert eingegeben!", "Nur numerische Werte sind gültig.")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example 3", "Fehler beim Setzen der Bereichsüberprüfung." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeValidate Example 3", "In Spalte 'B' sind nur numerische Werte gültig.")
