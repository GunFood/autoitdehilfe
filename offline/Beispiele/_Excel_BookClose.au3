#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookClose Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Erstellt eine neue Arbeitsmappe, schreibt einige Daten und schließt die Mappe ohne sie zu speichern
; Erstellte eine neue Arbeitsmappe
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookClose Beispiel 1", "Fehler beim Erstellen der neuen Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Schreibt Daten in Zelle A1
_Excel_RangeWrite($oWorkbook, Default, "Test", "A1")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookClose Beispiel 1", "Fehler beim Schreiben in Zelle 'A1'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox(64, "Excel UDF: _Excel_BookClose Beispiel 1", "Auf OK klicken, um die Arbeitsmappe ohne Speichern zu schließen.")
; Schließt die Arbeitsmappe ohne sie zu speichern
_Excel_BookClose($oWorkbook, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookClose Beispiel 1", "Fehler beim Schließen der Arbeitsmappe." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookClose Beispiel 1", "Arbeitsmappe wurde erfolgreich geschlossen.")
