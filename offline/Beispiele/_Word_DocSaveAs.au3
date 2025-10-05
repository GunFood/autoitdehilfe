#include "Extras\HelpFileInternals.au3"

#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <Word.au3>

; Kopiert \Extras\Test.doc nach @TempDir
If FileCopy(_Extras_PathFull("Test.doc"), @TempDir & "\_Word_Test.doc", $FC_OVERWRITE) = 0 Then Exit MsgBox($MB_SYSTEMMODAL, _
		"Word UDF: _Word_DocSaveAs Beispiel", "Fehler beim Kopieren von '.\Extras\Test.doc' als '_Word_Test.doc' in das @TempDir Verzeichnis.")
; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocSaveAs Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, @TempDir & "\_Word_Test.doc")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocSaveAs Beispiel", _
		"Fehler beim Öffnen von '_Word_Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Sichert das Dokument als _Word_Test2.doc
; Fügt Text am Anfang des Dokumentes ein
Local $oRange = _Word_DocRangeSet($oDoc, -1)
$oRange.Text = "Fett formatierter Text am Beginn des Dokumentes. "
$oRange.Bold = True
; Sichert das Dokument
_Word_DocSaveAs($oDoc, @TempDir & "\_Word_Test2.doc")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocSaveAs Beispiel", _
		"Fehler beim Sichern des Dokumentes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocSaveAs Beispiel", "Dokument erfolgreich gesichert als '" & _
		@TempDir & "\_Word_Test2.doc'.")
