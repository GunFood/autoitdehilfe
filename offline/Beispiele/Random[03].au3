#include <MsgBoxConstants.au3>

; Erstellt einen Zufallstext.

Example()

Func Example()
	Local $sText = ""
	For $i = 1 To Random(5, 20, 1) ; Gibt einen Integer zwischen 5 und 20 zurück. Dieser Integer entspricht der Länge des Strings.
		$sText &= Chr(Random(65, 122, 1)) ; Gibt einen Integer zwischen 65 und 122 zurück. Dies entspricht den ASCII-Zeichen zwischen einen kleingeschriebenen a und großgeschriebenen Z.
	Next
	MsgBox($MB_SYSTEMMODAL, "", "Der Zufallsstring lautet: " & $sText) ; Zeigt den String.
EndFunc   ;==>Example
