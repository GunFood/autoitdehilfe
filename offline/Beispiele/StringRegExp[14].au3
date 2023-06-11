#include <Array.au3>
#include <Constants.au3>

; ----------------- Verwendung von Wiederholungszeichen.
; Hier wird der Inhalt der Gruppe überschrieben, sobald ein Wiederholungszeichen auf die Gruppe angewandt wird
$sText = "aaabacad"
$aRet = StringRegExp($sText, "(a.)+", 3)
_ArrayDisplay($aRet)
