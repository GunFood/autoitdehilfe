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

; Alle Vorkommen der Zeichenfolge "test" in den Kommentaren finden
Local $aResult = _Excel_RangeFind($oWorkbook, "test", Default, $xlComments)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeFind Example 3", "Fehler bei der Suche im Bereich." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeFind Example 3", "Alle Vorkommen der Zeichenkette 'test' in den Kommentaren finden." & @CRLF & "Daten erfolgreich durchsucht.")
_ArrayDisplay($aResult, "Excel UDF: _Excel_RangeFind Example 3", "", 0, "|", "Blatt|Name|Zelle|Wert|Formel|Kommentar")
