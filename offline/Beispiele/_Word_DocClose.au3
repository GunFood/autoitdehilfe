#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocClose Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lese-Modus
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocClose Beispiel", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Schließt das Word Document
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocClose Beispiel", "Press 'OK' to close document '.\Extras\Test.doc'.")
_Word_DocClose($oDoc)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocClose Beispiel", _
		"Error closing document '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocClose Beispiel", "The document has been closed successfully.")
