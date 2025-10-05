#include "Extras\HelpFileInternals.au3"

#include <Array.au3>
#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt zwei Instanzen von Excel und öffnet in jeder Instanz eine Arbeitsmappe
Local $sWorkbook1 = _Extras_PathFull("_Excel1.xls"), $sWorkbook2 = _Extras_PathFull("_Excel2.xls")
Local $oExcel1 = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookList Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook1 = _Excel_BookOpen($oExcel1, $sWorkbook1)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookList Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe	 '" & $sWorkbook1 & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel1)
	Exit
EndIf
Local $oExcel2 = _Excel_Open(Default, Default, Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookList Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook2 = _Excel_BookOpen($oExcel2, $sWorkbook2)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookList Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe '" & $sWorkbook2 & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel1)
	_Excel_Close($oExcel2)
	Exit
EndIf

; Zeigt eine Liste aller Arbeitsmappen aller Excel-Instanzen an
Local $aWorkBooks = _Excel_BookList()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookList Beispiel 1", "Fehler bei Anzeige der Arbeitsmappen." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
_ArrayDisplay($aWorkBooks, "Excel UDF: _Excel_BookList Beispiel 1 - Liste der Arbeitsmappen aller Instanzen")
