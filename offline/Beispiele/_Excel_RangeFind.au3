#include <Array.au3>
#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Anwendungsobjekt erstellen und eine Beispielarbeitsmappe öffnen
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeFind Example", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeFind Example", "Fehler beim Öffnen der Arbeitsmappe '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Finden aller Vorkommen mit dem Wert "37000" (teilweise Übereinstimmung)
Local $aResult = _Excel_RangeFind($oWorkbook, "37000")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeFind Example 1", "Fehler bei der Suche im Bereich." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeFind Example 1", "Alle Vorkommen mit dem Wert '37000' finden (teilweise Übereinstimmung)." & @CRLF & "Daten erfolgreich durchsucht.")
_ArrayDisplay($aResult, "Excel UDF: _Excel_RangeFind Example 1", "", 0, "|", "Blatt|Name|Zelle|Wert|Formel|Kommentar")
