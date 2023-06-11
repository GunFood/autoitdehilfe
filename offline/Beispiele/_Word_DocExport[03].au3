#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 3", _
		"Fehler beim Erstellen eines neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 3", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Exportiert die aktuelle Seite
Local $sFileName = @TempDir & "\Test3.pdf"
_Word_DocExport($oDoc, $sFileName, Default, $wdExportCurrentPage)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 3", _
		"Fehler beim Exportieren des Dokumentes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 3", _
		"Die aktuelle Seite wurde erfolgreich exportiert nach: " & $sFileName)
ShellExecuteWait($sFileName)
