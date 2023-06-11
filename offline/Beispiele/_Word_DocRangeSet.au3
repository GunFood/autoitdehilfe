#include <MsgBoxConstants.au3>
#include <Word.au3>

; Erzeugt ein neues oder stellt eine Verbindung zu einem bestehenden Word-Objekt her
Local $oRange, $oWord = _Word_Create()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Fehler beim Erstellen des Word-Anwendungsobjektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Öffnet das Testdokument
Local $oDoc = _Word_DocOpen($oWord, @ScriptDir & "\Extras\Test.doc", Default, Default, True)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Fehler beim Öffnen von '.\Extras\Test.doc'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)

; Szene 1
; Verschiebt den Beginn des Bereichs zum nächsten Absatz und verlängert das Ende um 2 Worte.
; Fügt Text vor und nach dem Bereich ein und zeigt Statistikdaten an.
$oRange = _Word_DocRangeSet($oDoc, -1, $wdParagraph, 1, Default, 2)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Fehler beim Festlegen/Erweitern des Bereiches." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRange.Select
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Der Bereich wurde auf die ersten beiden Worte des zweiten Absatzes festgelegt.")

; Fügt vor dem Bereich Text ein
$oRange.InsertBefore("Am Beginn eingefügter Text! ")
$oRange.Select
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", "Text wurde am Beginn des Bereiches eingefügt.")

; Fügt Text nach dem Bereich ein
$oRange.InsertAfter("Am Ende eingefügter Text! ")
$oRange.Select
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", "Text wurde am Ende des Bereiches eingefügt.")

; Zeigt einige Statistikwerte des Bereiches an
Local $iWords = $oRange.ComputeStatistics(0)
Local $iCharacters = $oRange.ComputeStatistics(3)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", "Der ausgewählte Bereich umfasst:" & @CRLF & _
		$iWords & " Worte " & @CRLF & $iCharacters & " Zeichen.")

; Szene 2
; Verschiebt das Ende des Bereichs um ein Zeichen nach links, damit das Leerzeichen zum nächsten
; Wort nicht formatiert wird und formatiert den Text fett, kursiv und unterstrichen formatiert
$oRange = _Word_DocRangeSet($oDoc, $oRange, Default, Default, $wdCharacter, -1)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Fehler beim Festlegen/Erweitern des Bereiches." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Formatiert den Bereich fett, kursiv und unterstrichen
$oRange.Bold = True
$oRange.Italic = True
$oRange.Underline = True
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", "Formatierungen wurden hinzugefügt.")

; Szene 3
; Reduziert den Bereich auf die Länge 0 (er wird somit zur Einfügemarke) und fügt einen Zeilenumbruch ein
$oRange = _Word_DocRangeSet($oDoc, $oRange, Default, Default, -1, Default)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Fehler beim Festlegen/Erweitern des Bereiches." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRange.InsertBreak($wdLineBreak)
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", "Zeilenumbruch wurde eingefügt.")

; Szene 4
; Bewegt den Bereich auf das erste Zeichen in der nächsten Zeile (Leerzeichen) und entfernt es
$oRange = _Word_DocRangeSet($oDoc, $oRange, Default, Default, $wdCharacter, 1)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", _
		"Fehler beim Festlegen/Erweitern des Bereiches." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
$oRange.Delete
MsgBox($MB_SYSTEMMODAL, "Word UDF: _Word_DocRangeSet Beispiel", "Leerzeichen wurde entfernt.")
