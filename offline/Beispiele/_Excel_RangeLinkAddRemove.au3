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

; Einen Link zu den Zellen A1:C1 hinzufügen
_Excel_RangeLinkAddRemove($oWorkbook, $oWorkbook.Activesheet, "A1:C1", "http://www.autoitscript.com", Default, "AutoIt Homepage")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example 1", "Fehler beim Setzen eines Hyperlinks." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example 1", "Links zu den Zellen 'A1:C3' gesetzt.")

; Entfernen der Links aus den Zellen A1:C1
_Excel_RangeLinkAddRemove($oWorkbook, $oWorkbook.Activesheet, "A1:C1", "")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example 2", "Fehler beim Setzen eines Hyperlinks." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeLinkAddRemove Example 2", "Links aus den Zellen 'A1:C3' entfernt.")
