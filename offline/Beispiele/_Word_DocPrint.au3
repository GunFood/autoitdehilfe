#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPrint Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPrint Beispiel", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Druckt das gesamte Dokument mit Standardeinstellungen
Local $sActivePrinter = $oDoc.Application.ActivePrinter
MsgBox($MB_SYSTEMMODAL, "", "Der aktive Drucker ist: " & $sActivePrinter)
_Word_DocPrint($oDoc)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPrint Beispiel", _
		"Fehler beim Drucken des Dokumentes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocPrint Beispiel", "Das Dokument wurde erfolgreich ausgegeben auf Drucker: " & _
		$sActivePrinter)
