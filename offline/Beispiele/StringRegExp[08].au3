#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von \b
; Durch das Voranstellen von \b und das anh‰ngen von \b an das Ende wird nur an der Wortgrenze gesucht.
; "Abgrund oder folge" wird nicht gefunden, da das Wort Abgrund und nicht Grund heisst

$sString = _
		"Grund oder Folge der Armut?" & @CRLF & _
		"Fahre ich in den Abgrund oder folge ich der Straﬂe?"
$aResult = StringRegExp($sString, "(?i)\bgrund oder folge\b", 3)
_ArrayDisplay($aResult, "StringRegExp Results")



