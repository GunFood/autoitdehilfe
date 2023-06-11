#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 1", _
		"Fehler beim Erstellen eines neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 1", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Findet das erste Auftreten von "test document". Suchrichtung vom Ende zum Anfang des Dokumentes. Markiert die gefundene Stelle in fetter Schrift.
Local $oRangeFound
#forceref $oRangeFound
$oRangeFound = _Word_DocFind($oDoc, "test document", 0, Default, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 1", _
		"Fehler beim Suchen des angegebenen Textes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRangeFound.Bold = True
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 1", _
		"Der Text 'test document' wurde vom Ende des Dokumentes in Richtung Dokumentenanfang gesucht, gefunden und fett markiert.")
