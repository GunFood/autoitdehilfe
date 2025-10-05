#include "Extras\HelpFileInternals.au3"

#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellt das Anwendungsobjekt
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpen Beispiel 1", "Fehler beim Erstellen des Excel-Anwendungsobjekts." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet eine bestehende Arbeitmappe und zeigt das Erstellungsdatum an
Local $sWorkbook = _Extras_PathFull("_Excel1.xls")
Local $oWorkbook = _Excel_BookOpen($oExcel, $sWorkbook)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpen Beispiel 1", "Fehler beim Öffnen der Arbeitsmappe '" & $sWorkbook & "'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookOpen Beispiel 1", "Arbeitsmappe '" & $sWorkbook & "' wurde erfolgreich geöffnet." & @CRLF & @CRLF & "Erstellungsdatum: " & $oWorkbook.BuiltinDocumentProperties("Creation Date").Value)
