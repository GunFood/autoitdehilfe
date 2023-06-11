#include <MsgBoxConstants.au3>

Beispiel()

Func Beispiel()
	; Deklariert eine Map und belegt sie mit verschiedenen Schlüssel-Wert-Paaren.
	Local $mMap[]
	$mMap[1] = "Integer Eins" ; Integer-Wert als Schlüssel.
	$mMap["2"] = "String Zwei" ; String-Wert, der eine ganze Zahl als Schlüssel darstellt. Dies ist ein String und keine ganze Zahl.
	MapAppend($mMap, "Integer Zwei") ; Anhängen eines Wertes unter Verwendung der nächsten verfügbaren ganzen Zahl, die in diesem Fall 2 ist.

	; Ruft die in der Map enthaltenen Schlüssel ab. Es wird ein nullbasiertes eindimensionales Array zurückgegeben.
	Local $aMapKeys = MapKeys($mMap)
	For $i = 0 To UBound($aMapKeys) - 1
		MsgBox($MB_SYSTEMMODAL, "", "Key: " & $aMapKeys[$i] & @CRLF & _ ; Der Schlüssel.
				"Value: " & $mMap[$aMapKeys[$i]] & @CRLF & _ ; Verwendet den Array-Wert von MapKeys(), um den Wert des Schlüssels anzuzeigen.
				"Variable Type: " & VarGetType($aMapKeys[$i]) & @CRLF) ; Zeigt den Variablentyp des Schlüssels an, d.h. Ganzzahl oder String.
	Next
EndFunc   ;==>Beispiel
