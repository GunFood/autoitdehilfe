#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocGet Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Dokument Test.doc im Lesemodus
_Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocGet Beispiel", "Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & _
		"@error = " & @error & ", @extended = " & @extended)
; Öffnet das Dokument Test2.doc im Lesemodus
_Word_DocOpen($oWord, _Extras_PathFull("Test2.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocGet Beispiel", "Fehler beim Öffnen von '.\Extras\Test2.doc'." & @CRLF & _
		"@error = " & @error & ", @extended = " & @extended)

; Finde das erste Dokument in der Sammlung (Collection) aller Dokumente.
; Schreibe den Namen dieses Dokumentes sowie die Gesamtanzahl aller Dokumente auf die Konsole.
Local $oDoc = _Word_DocGet($oWord, 1)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocGet Beispiel", _
		"Fehler beim Zugriff auf die Sammlung (Collection) von Dokumenten." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocGet Beispiel", "Das erste Dokument in der Sammlung (Collection) wurde ausgewählt." & _
		@CRLF & "Name: " & $oDoc.Name & @CRLF & "Gesamtzahl an Dokumenten: " & @extended)
