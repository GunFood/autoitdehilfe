#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 1", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 1", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; macht das vierte Wort des Dokumentes zu einem Link auf die engl. AutoIt Homepage
Local $oRange = _Word_DocRangeSet($oDoc, -1, $wdWord, 3, $wdWord, 1)
_Word_DocLinkAdd($oDoc, $oRange, "http://www.autoitscript.com")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 1", _
		"Fehler beim Hinzufügen des Links." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 1", "Wort 4 des Dokumentes ist nun ein Link zur engl. AutoIt Homepage.")
