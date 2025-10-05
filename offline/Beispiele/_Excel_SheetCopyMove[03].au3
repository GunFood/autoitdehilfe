#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Beispiel-Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 3", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Arbeitsmappe 2 öffnen
Local $oWorkbook2 = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel3.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 3", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel3.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf
; Öffnet Arbeitsmappe 1
Local $oWorkbook1 = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel1.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 3", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel1.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Blatt 3 der Arbeitsmappe 1 nach Blatt 3 der Arbeitsmappe 2 kopieren
_Excel_SheetCopyMove($oWorkbook1, 3, $oWorkbook2, 3, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 3", "Fehler beim Kopieren des Blatts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetCopyMove Beispiel 3", "Arbeitsmappe 1 Blatt 3 nach Arbeitsmappe 2 nach Blatt 3 kopiert")
