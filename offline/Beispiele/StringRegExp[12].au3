#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von ?:
; Das folgende Beispiel soll aufzeigen, wie ein Subpattern gespeichert wird und wie nicht.
$sString = "Mein Name ist Peter" & @CRLF
$sString &= "Mein Name ist Karl" & @CRLF
$sString &= "Mein Name ist Max" & @CRLF

; So würde nur das Subpattern zurückgegeben werden
$aResult = StringRegExp($sString, "Mein Name ist (Karl|Max)", 3)
_ArrayDisplay($aResult)

; Durch voranstellen von ?: wird das Subpattern nicht gespeichert und es wird der komplette Satz als Ergebnis zurückgegeben
$aResult = StringRegExp($sString, "Mein Name ist (?:Karl|Max)", 3)
_ArrayDisplay($aResult)


