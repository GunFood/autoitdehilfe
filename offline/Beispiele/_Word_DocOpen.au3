#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocOpen Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet das Testdokument im Lesemodus
Local $sDocument = @ScriptDir & "\Extras\Test.doc"
_Word_DocOpen($oWord, $sDocument, Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocOpen Beispiel", "Fehler beim Öffnen von '.\Extras\Test.doc'." & _
		@CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocOpen Beispiel", "Dokument '" & $sDocument & "' wurde erfolgreich geöffnet.")
