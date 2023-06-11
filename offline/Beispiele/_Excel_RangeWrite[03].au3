#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und eine neue Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 3", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 3", "Fehler beim Erstellen der neuen Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Schreibt einen 2D-Array in den Bereich B1:D2 des aktiven Blattes der aktiven Arbeitsmappe.
; Es werden nur 2 Zeilen und 3 Spalten des Array geschrieben, da der angegebene Bereich kleiner ist als der Array.
Local $aArray2D[3][5] = [[11, 12, 13, 14, 15], [21, 22, 23, 24, 25], [31, 32, 33, 34, 35]]
_Excel_RangeWrite($oWorkbook, $oWorkbook.Activesheet, $aArray2D, "B1:D2")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 3", "Fehler beim Schreiben in das Arbeitsblatt." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 3", "2D array erfolgreich geschrieben (aber auf 2 Zeilen und 3 Spalten abgeschnitten).")
