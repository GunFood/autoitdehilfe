#include "Extras\HelpFileInternals.au3"

#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 2", _
		"Fehler beim Erstellen des neuen Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Öffnet das Testdokument im Lesemodus
Local $oDoc = _Word_DocOpen($oWord, _Extras_PathFull("Test.doc"), Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 2", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Unterstreicht den Text "line" in den Absätzen 2-4.
Local $oRangeFound, $oSearchRange
$oSearchRange = _Word_DocRangeSet($oDoc, -1, $wdParagraph, 1, $wdParagraph, 3)
$oRangeFound = _Word_DocFind($oDoc, "line", $oSearchRange)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 2", _
		"Fehler beim Suchen des angegebenen Textes im Dokument." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRangeFound.Underline = True
While 1
	$oRangeFound = _Word_DocFind($oDoc, "line", $oSearchRange, $oRangeFound)
	If @error Then ExitLoop
	$oRangeFound.Underline = True
WEnd
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocFind Beispiel 2", _
		"Alle Vorkommen der Zeichenkette 'line' in den Absätzen 2-4 wurden unterstrichen.")
