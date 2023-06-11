#include <Array.au3>

Example()

Func Example()
	Local $aArray[1] ; Erstellt ein 1D-Array mit einem Element.
	For $i = 0 To 100 ; Durchläuft die Werte von 0 bis 100, um den Index des Arrays zu erhalten
		ReDim $aArray[UBound($aArray) + 1] ; Bestimmt die aktuelle Größe des Arrays und erhöht diese um 1
		$aArray[$i] = $i
	Next
	_ArrayDisplay($aArray) ; Zeigt das Array.
EndFunc   ;==>Example
