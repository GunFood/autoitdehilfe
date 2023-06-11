#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von Wiederholungszeichen
; Suchmuster:
; 2x Zahl
; 1x .
; 2x Zahl
; 1x .
; 4x Zahl

Dim $array[2]

$array[0] = "23.08.2010"
$array[1] = "23.08.10"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "\d{2}\.\d{2}\.\d{4}", 3)
	_ArrayDisplay($regexp, $array[$i])
Next



