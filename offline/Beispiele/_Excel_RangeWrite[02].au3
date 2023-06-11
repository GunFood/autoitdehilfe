#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und eine neue Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 2", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 2", "Fehler beim Erstellen der neuen Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Schreibt einen 1D-Array in das aktive Blatt der aktiven Arbeitsmappe
Local $aArray1D[3] = ["AA", "BB", "CC"]
_Excel_RangeWrite($oWorkbook, $oWorkbook.Activesheet, $aArray1D, "A3")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 2", "Fehler beim Schreiben in das Arbeitsblatt." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeWrite Beispiel 2", "1D-Array erfolgreich in das Arbeitsblatt geschrieben.")
