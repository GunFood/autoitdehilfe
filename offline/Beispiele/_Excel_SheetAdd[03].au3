#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispielarbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 3", "Fehler beim Erstellen des Excel-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls", True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 3", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Fügt ein Index-Arbeitsblatt vor Arbeitsblatt 1 mit Verknüpfungen zu allen anderen Arbeitsblättern ein
Local $oSheet = _Excel_SheetAdd($oWorkbook, 1, True, 1, "Index")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 3", "Fehler beim Einfügen des Arbeitsblattes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oSheet.Range("A1").Value = "Index"
Local $iRow = 2
For $iSheet = 2 To $oWorkbook.Sheets.Count
	$oSheet.Cells($iRow, 1).Value = $iRow - 1
	$oSheet.Cells($iRow, 2).Value = $oWorkbook.Worksheets($iRow).Name
	$oSheet.Hyperlinks.Add($oSheet.Cells($iRow, 2), "", "'" & $oSheet.Cells($iRow, 2).Value & "'!A1")
	$iRow = $iRow + 1
Next
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetAdd Beispiel 3", "Index-Arbeitsblatt vor Arbeitsblatt 1 eingefügt.")
