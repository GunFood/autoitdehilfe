#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpen Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Erstellen einer neue Arbeitsmappe, schreiben einiger Daten und speichern in @tempdir
; Erstellen eines neuen Workbook
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave Beispiel 1", "Fehler beim Erstellen des neuen Workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Etwas in die Zelle A1 schreiben
_Excel_RangeWrite($oWorkbook, Default, "Test", "A1")
If Not IsObj($oWorkbook) Or ObjName($oWorkbook, 1) <> "_Workbook" Then Exit SetError(1, 0, 0)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave Beispiel 1", "Fehler beim Schreiben in Zelle 'A1'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Speichern des Workbook in @tempdir als _Excel.xls (ersetzt existierende Datei)
_Excel_BookSaveAs($oWorkbook, @TempDir & "\_Excel.xls", Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave Beispiel 1", "Fehler beim Speichern des Workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Etwas in die Zelle B1 schreiben
_Excel_RangeWrite($oWorkbook, Default, "2nd Test", "B1")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave Beispiel 1", "Fehler beim Schreiben in Zelle 'A1'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Speichern des geänderten Workbook
_Excel_BookSave($oWorkbook)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave Beispiel 1", "Fehler beim Speichern des Workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave Beispiel 1", "Das Workbook wurde erfolgreich gespeichert als '" & @TempDir & "\_Excel.xls'.")
