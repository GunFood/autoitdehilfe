#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Einfügen eines Indexblattes mit Links zu allen anderen Blättern.
; Behandelt Blattnamen mit Leerzeichen korrekt.
Local $oSheet = _Excel_SheetAdd($oWorkbook, 1, True, 1, "Index")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example 3", "Fehler beim Hinzufügen eines Blattes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oSheet.Range("A1").Value = "Index"
Local $iRow = 2
For $iSheet = 2 To $oWorkbook.Sheets.Count
	$oSheet.Cells($iRow, 1).Value = $iRow - 1
	$oSheet.Cells($iRow, 2).Value = $oWorkbook.Worksheets($iRow).Name
	_Excel_RangeLinkAddRemove($oWorkbook, $oSheet, $oSheet.Cells($iRow, 2), $oWorkbook.Fullname, "'" & $oSheet.Cells($iRow, 2).Value & "'!A1")
	$iRow = $iRow + 1
Next
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example 3", "Indexblatt als Blatt 1 eingefügt.")
