#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispiel-Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffne eine Arbeitsmappe
Local $oWorkbook1 = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Kopiert Arbeitsblatt 1 nach Arbeitsblatt 3
Local $oCopiedSheet = _Excel_SheetCopyMove($oWorkbook1, 1, Default, 3, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 1", "Fehler beim Kopieren des Arbeitsblattes" & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Setzt den Namen des neuen Arbeitsblattes
#forceref $oCopiedSheet
$oCopiedSheet.Name = "Kopiertes Arbeitsblatt"
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 1", "Arbeitsblatt 1 nach Arbeitsblatt 3 kopiert und umbenannt.")
