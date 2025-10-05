#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_Attach Beispiel 1", _
		"Fehler beim Erstellen des neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Testdokument schreibgeschützt öffnen
_Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 1", "Fehler beim Öffnen von '.\Extras\Test.doc'." & _
		@CRLF & "@error = " & @error & ", @extended = " & @extended)

; An das Testdokument mit Modus "Filename" anhängen und den Fokus auf das Fenster setzen
Local $oDoc = _Word_DocAttach($oWord, "Test.doc", "Filename")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 1", _
		"Fehler beim Anhängen an das Dokument '.\Extras\Test.doc' im Modus 'FileName'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Fokus auf das Word-Dokument setzen - Ident mit Parameter $f_takeFocus der alten Funktion _WordCreate
WinActivate($oWord.ActiveWindow.Caption & " - " & $oWord.Caption)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAttach Beispiel 1", "Anhängen an das Dokument im Modus 'Filename' erfolgreich!" & @CRLF & _
		@CRLF & "Text des angehängten Dokuments:" & @CRLF & $oDoc.Range().Text)
