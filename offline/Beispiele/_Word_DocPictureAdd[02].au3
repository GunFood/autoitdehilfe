#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 2", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 2", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Fügt am Ende des Dokumentes eine Bilddatei ein.
; Setzt das Range Objekt als Einfügemarke auf das Dokumentenende..
Local $oRange = _Word_DocRangeSet($oDoc, -2)
_Word_DocPictureAdd($oDoc, @ScriptDir & "\Extras\Screenshot.png", Default, Default, $oRange)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 2", _
		"Fehler beim Einfügen der Bilddatei." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 2", _
		"Bilddatei wurde erfolgreich am Ende des Dokumentes eingefügt.")
