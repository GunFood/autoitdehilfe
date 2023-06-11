#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von Wiederholungszeichen
; Suchmuster:
; 1x "P"
; mindestens 1x "a"
; 1x "r"

Dim $array[2]

$array[0] = "Ich habe 10 Paaaaaar zu Hause"
$array[1] = "Ich habe 10 Par zu Hause"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "Pa+r", 3) ;alternativ: Pa{1,}r
	_ArrayDisplay($regexp, $array[$i])
Next



