#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 1", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 1", "Fehler beim Öffnen von '.\Extras\Test.doc'. @error = " & _
		@error & ", @extended = " & @extended)

; Gib für jeden Hyperlink des Dokumentes einige Eigenschaften aus
Local $oLinks = _Word_DocLinkGet($oDoc)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 1", _
		"Fehler beim Zugriff auf die Hyperlinks." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $sResult = "Anzahl der Hyperlinks im Dokument: " & @extended & @CRLF & @CRLF
For $oLink In $oLinks
	$sResult = $sResult & "Text: " & $oLink.TextToDisplay & @CRLF & "Adresse: " & $oLink.Address & _
			@CRLF & "------------------------------------------" & @CRLF
Next
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocLinkGet Beispiel 1 - Liste aller Hyperlinks im Dokument", $sResult)
