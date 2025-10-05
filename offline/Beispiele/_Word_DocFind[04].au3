#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 4", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 4", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Ersetzt das Paragraf-Steuerzeichen durch Paragraf-Steuerzeichen + Text + Paragraf-Steuerzeichen.
; Ersetzt nur das erste Auftreten.
Local $oRangeFound
$oRangeFound = _Word_DocFind($oDoc, "^p")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 4", _
		"Fehler beim Suchen des Paragraf-Steuerzeichens." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRangeFound.InsertAfter("[New Line] ")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 4", _
		"Fehler beim Einfügen des Textes." & @CRLF & "@error = " & @error & _
		", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 4", "Das Paragraf-Steuerzeichen wurde erfolgreich ersetzt" & @CRLF & _
		"und der Text eingefügt.")
