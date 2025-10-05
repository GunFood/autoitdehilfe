#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines Beispiel Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Export Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"), True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Export Beispiel", "Fehler beim Öffnen des Workbook '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Exportieren des gesamten Workbook als PDF.
Local $sOutput = @TempDir & "\_Excel1_2.pdf"
_Excel_Export($oExcel, $oWorkbook, $sOutput)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Export Beispiel 2", "Fehler beim Speichern des Workbook als '" & $sOutput & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Export Beispiel 2", "Das gesamte Workbook wurde erfolgreich exportiert als '" & $sOutput & "'.")
