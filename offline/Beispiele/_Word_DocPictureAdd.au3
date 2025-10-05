#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 1", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 1", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Fügt nach dem vierten Wort im Dokument eine Bilddatei ein.
; Setzt das Range Objekt als Einfügemarke nach dem vierten Wort.
Local $oRange = _Word_DocRangeSet($oDoc, -1, Default, 4, Default, 4)
_Word_DocPictureAdd($oDoc, _Extras_PathFull("Screenshot.png"), Default, Default, $oRange)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 1", _
		"Fehler beim Einfügen der Bilddatei" & @CRLF & " @error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPictureAdd Beispiel 1", _
		"Bilddatei wurde erfolgreich nach dem vierten Wort in das Dokument eingefügt.")
