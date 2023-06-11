#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace Beispiel 2", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace Beispiel 2", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Ersetzt das Paragraf-Steuerzeichen durch Paragraf-Steuerzeichen + Text + Paragraf-Steuerzeichen.
; Ersetzt nur das erste Auftreten.
_Word_DocFindReplace($oDoc, "^p", "^pInserted Line^p", $wdReplaceOne)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace Beispiel 2", _
		"Fehler beim Ersetzen des Textes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFindReplace Beispiel 2", "Das Paragraf-Steuerzeichen wurde erfolgreich ersetzt.")
