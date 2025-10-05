#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 2", _
		"Fehler beim Erstellen des neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Word Testdokument
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 2", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Exportiert einen Bereich (die Zeilen 2 und 3) als PDF/A und zeigt die erstellte Exportdatei an
Local $oRange = _Word_DocRangeSet($oDoc, -1, $wdParagraph, 1, $wdParagraph, 2)
Local $sFileName = @TempDir & "\Test2.pdf"
_Word_DocExport($oRange, $sFileName, Default, $wdExportFromTo, Default, Default, True, Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 2", "Fehler beim Exportieren des Dokumentes." & _
		@CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 2", _
		"Der angegebene Bereich wurde erfolgreich exportiert nach: " & $sFileName)
