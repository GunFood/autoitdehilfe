#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 1", _
		"Fehler beim Erstellen eines neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Word Testdokument
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 1", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Exportiert das gesamte Dokument unter Verwendung von standard Parameterwerten
Local $sFileName = @TempDir & "\Test1.pdf"
_Word_DocExport($oDoc, $sFileName)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 1", _
		"Fehler beim Exportieren des Dokumentes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
ShellExecute($sFileName)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocExport Beispiel 1", _
		"Das gesamte Dokument wurde erfolgreich exportiert in Datei: " & $sFileName)
