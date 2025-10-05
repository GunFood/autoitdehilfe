#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
_Word_Create()
If @error <> 0 Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_Create Beispiel", _
		"Fehler beim Erstellen des neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
If @extended = 1 Then
	MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_Create Beispiel", "MS Word wurde nicht ausgeführt, als _Word_Create aufgerufen wurde.")
Else
	MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_Create Beispiel", "MS Word wurde bereits ausgeführt, als _Word_Create aufgerufen wurde.")
EndIf
