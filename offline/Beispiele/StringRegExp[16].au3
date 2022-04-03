#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von Oder und ?:
; Suchmuster:
; "-XY" ODER " XY" (?:\-XY| XY) >>> durch ?: wird nicht nur das Ergebnis der Oder-Bedingung sondern auch der Rest im Array ausgegeben
; DANN Zahlen (beliebige Anzahl) \d*
; DANN "-" \-

Dim $array[2]

$array[0] = "425-65-XY4587543-ghzgt7"
$array[1] = "4 25-65 XY4587543-ghzgt7"

For $i = 0 To UBound($array) - 1
	$regexp = StringRegExp($array[$i], "(?:\-XY| XY)\d*\-", 3)
	_ArrayDisplay($regexp, $array[$i])
Next



