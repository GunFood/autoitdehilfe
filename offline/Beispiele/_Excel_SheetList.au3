#include "Extras\HelpFileInternals.au3"

#include <Array.au3>
#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt und öffnet eine Arbeitsmappe
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetList Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, _Extras_PathFull("_Excel2.xls"))
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetList Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe '" & _Extras_PathFull("_Excel2.xls") & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Zeigt eine Liste aller Arbeitsblätter für eine bestimmte Arbeitsmappe an
Local $aWorkSheets = _Excel_SheetList($oWorkbook)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_SheetList Beispiel 1", "Fehler beim Auflisten von Arbeitsblättern." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
_ArrayDisplay($aWorkSheets, "Excel UDF: _Excel_SheetList Beispiel 1")
