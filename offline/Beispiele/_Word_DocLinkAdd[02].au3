#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 2", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 2", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Fügt einen Link am ENde des Dokumentes ein und setzt die Parameter ScreenTip und TextToDisplay
Local $oRange = _Word_DocRangeSet($oDoc, -2) ; Springt zum Ende des Dokumentes
$oRange.Text = " " ; Fügt ein Leerzeichen am Ende des Dokumentes ein
$oRange = _Word_DocRangeSet($oDoc, -2)
_Word_DocLinkAdd($oDoc, $oRange, "http://www.autoitscript.com", Default, "AutoIt homepage", _
		"Hyperlink 3 - Weiterer Link auf die eng. to the AutoIt Homepage")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 2", _
		"Fehler beim Hinzufügen des Links." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkAdd Beispiel 2", "Hyperlink am Ende des Dokumentes eingefügt.")
