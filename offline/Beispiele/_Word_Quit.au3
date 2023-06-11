#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocQuit Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $bWordClose = @extended
; Öffnet das Testdokument im Lesemodus
_Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocQuit Beispiel", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Wenn Word beim Starten des Skripts bereits lief, dann wird nur die Referenz auf das Word Objekt beendet.
; Wenn Word durch dieses Beispiel gestartet wurde, dann wird die Word Anwendung geschlossen und somit ALLE Word Dokumente.
Local $iResult
If $bWordClose Then
	$iResult = MsgBox(($MB_OKCANCEL + $MB_SYSTEMMODAL), "Word UDF: _Word_Quit Beispiel", _
			"Wenn Sie OK klicken, dann gehen ALLE ungesicherten Änderungen ALLER offenen Dokumente dieser Word Instanz verloren und di Instanz wird beendet.")
Else
	$iResult = MsgBox(($MB_OKCANCEL + $MB_SYSTEMMODAL), "Word UDF: _Word_Quit Beispiel", _
			"Word lief bereits als die Funktion _Word_Create aufgerufen wurde. Daher wird nun nur die Referenz auf das Word Objekt beendet.")
EndIf
If $iResult = 2 Then Exit
_Word_Quit($oWord)
If @error Then MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_Quit Beispiel", _
		"Fehler beim Schließen des Word Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
