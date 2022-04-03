#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von \n
; Das erste Wort (auf welches " Email: " folgt) wird in einer temporären Variable gespeichert (weil eingeklammert)
; Diese Variable wird mit \1 abgerufen. Die 1 steht dabei für die Nummer des Subpatterns.
$sString = "Name Email: Name@web.de" & @CRLF
$sString &= "Name Email: Peter@live.de" & @CRLF
$sString &= "Acanis Email: Acanis@gmx.net" & @CRLF
$sString &= "Acanis Email: Coolertyp@googlemail.com" & @CRLF
$aRegExp = StringRegExp($sString, "(\w+) Email: (\1@\w+\.\w+)", 3)
_ArrayDisplay($aRegExp)


