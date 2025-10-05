#include "Extras\HelpFileInternals.au3"

#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableRead Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableRead Beispiel", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Erstellt eine Tabelle aus einem Array
Local $asArray[3][3] = [[1, 2, 3], ["a", "b", "c"], ["x", "y", "z"]]
Local $oRange = _Word_DocRangeSet($oDoc, -2)
Local $oTable = _Word_DocTableWrite($oRange, $asArray, 0)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableRead Beispiel", _
		"Fehler beim Erstellen der Tabelle." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Liest die erste Tabelle eines Dokumentes und gibt den gesamten Inhalt zurück
Local $asResult = _Word_DocTableRead($oDoc, 1, 1)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocTableRead Beispiel", _
		"Fehler beim Lesen der Tabelle." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
_ArrayDisplay($asResult, "Word UDF: _Word_DocTableRead Beispiel")
