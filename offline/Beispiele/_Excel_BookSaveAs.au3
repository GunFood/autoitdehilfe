#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines Beispiel Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSaveAs Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $oWorkbook = _Excel_BookOpen($oExcel, @ScriptDir & "\Extras\_Excel1.xls")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSaveAs Beispiel", "Fehler beim Öffnen des Workbooks '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Speichern des Workbook (xls) in einem anderen Format (html) in einem anderen Verzeichnis und
; überschreiben einer vorhandenen Version
Local $sWorkbook = @TempDir & "\_Excel1.html"
_Excel_BookSaveAs($oWorkbook, $sWorkbook, $xlHtml, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSaveAs Beispiel 1", "Fehler beim Speichern des Workbook in '" & $sWorkbook & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSaveAs Beispiel 1", "Das Workbook wurde erfolgreich gespeichert als '" & $sWorkbook & "'.")
ShellExecute($sWorkbook)
