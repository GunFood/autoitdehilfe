#include <Array.au3>
#include <Constants.au3>

; ----------------- Verwendung von Subpatterns
; Das folgende Beispiel soll aufzeigen, wie ein Subpattern gespeichert wird und dieses dann später wieder verwendet wird.
$date = '01.03.2008' ; YYYY/MM/DD
$new = StringRegExpReplace($date, "(\d{2})\.(\d{2})\.(\d{4})", "$3/$2/$1")
MsgBox($MB_OK, "", $new)



