#include <MsgBoxConstants.au3>

Local $sText = ""
For $i = 65 To 90
	$sText = $sText & Chr($i) ; Oder $sText &= Chr($i) kann genauso verwendet werden
Next
MsgBox($MB_SYSTEMMODAL, "Alphabet der Großbuchstaben", $sText) ;Zeigt die Zeichen zwischen 65 und 90
