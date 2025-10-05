#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAdd Beispiel", _
		"Fehler beim Erstellen des neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Ein neues leeres Dokument hinzufügen
_Word_DocAdd($oWord)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAdd Beispiel", "Fehler beim Erstellen eines neuen Word-Dokuments." _
		 & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocAdd Beispiel", "Ein neues leeres Dokument wurde erfolgreich hinzugefügt.")
