#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableWrite Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableWrite Beispiel", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Schreibt den Inhalt eines 0-basierten Arrays in eine Word Tabelle
Local $asArray[3][3] = [[1, 2, 3], ["a", "b", "c"], ["x", "y", "z"]]
Local $oRange = _Word_DocRangeSet($oDoc, -2)
_Word_DocTableWrite($oRange, $asArray, 0)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableWrite Beispiel", _
		"Fehler beim Erstellen der Tabelle." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableWrite Beispiel", _
		"Tabelle erfolgreich am Ende des Dokumentes eingefügt.")
