#include <MsgBoxConstants.au3>
#include <String.au3>

Example()

Func Example()
	; Variable die das Ergebnis speichert
	Local $sOutput = ""

	; Fügt drei Unterstriche ein und gibt diese in der Console aus
	For $i = -20 To 20
		$sOutput &= $i & @TAB & _StringInsert("Supercalifragilistic", "___", $i) & @CRLF
	Next

	; Zeigt das Ergebnis
	MsgBox($MB_SYSTEMMODAL, "", $sOutput)
EndFunc   ;==>Example
