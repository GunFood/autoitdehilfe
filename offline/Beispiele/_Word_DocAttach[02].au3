#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 2", _
		"Fehler beim Erstellen des neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Test-Dokument im Lesemodus öffnen
_Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 2", "Error opening '.\Extras\Test.doc'." & _
		@CRLF & "@error = " & @error & ", @extended = " & @extended)

; An das Test-Dokument im Modus "Text" anknüpfen.
Local $oDoc = _Word_DocAttach($oWord, "Test", "Text")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 2", _
		"Fehler beim Verknüpfen mit '\Extras\Test.doc' im Modus 'Text'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 2", "Verknüpfung mit dem Dokument im Modus 'Text' war erfolgreich!" & _
		@CRLF & @CRLF & "Text des verknüpften Dokumentes:" & @CRLF & $oDoc.Range().Text)
