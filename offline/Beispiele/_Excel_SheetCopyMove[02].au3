#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispiel-Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 2", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Arbeitsmappe 1 öffnen
Local $oWorkbook1 = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 2", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Blatt 2 vor Blatt 1 verschieben. Legt den Namen des verschobenen Blattes fest
Local $oMovedSheet = _Excel_SheetCopyMove($oWorkbook1, 2, Default, 1, Default, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 2", "Fehler beim Verschieben des Blattes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Setzt den Namen des neuen Blattes
#forceref $oMovedSheet
$oMovedSheet.Name = "Verschobenes Blatt"
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 2", "Blatt 2 wurde vor Blatt 1 verschoben")
