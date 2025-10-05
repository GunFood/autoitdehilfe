#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 2", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 2", "Fehler beim Öffnen von '.\Extras\Test.doc'. @error = " & _
		@error & ", @extended = " & @extended)

; Gibt einige Eigenschaften des zweiten Hyperlinks aus
Local $oLink = _Word_DocLinkGet($oDoc, 2)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 2", _
		"Fehler beim Zugriff auf die Hyperlinks." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $sResult = "Anzahl der Hyperlinks im Dokument: " & @extended & @CRLF & @CRLF & _
		"Text: " & $oLink.TextToDisplay & @CRLF & _
		"Adresse: " & $oLink.Address & @CRLF & _
		"Screentip: " & $oLink.Screentip
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 2 - Eigenschaften von Hyperlink #2", $sResult)
