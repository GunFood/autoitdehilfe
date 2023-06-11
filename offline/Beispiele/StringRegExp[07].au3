#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von ?<!
; Suchmuster:
; alles außer "142"
; DANN "Hallo"

Dim $array[2]

$array[0] = "142Hallo"
$array[1] = "412Hallo"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "(?<!142)(Hallo)", 3)
	_ArrayDisplay($regexp, $array[$i])
Next



