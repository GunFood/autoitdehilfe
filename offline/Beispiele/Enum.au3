#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Diese Variablen sind konstant im Bereich von 0 bis 2.
	Local Enum $eVar1, $eVar2, $eVar3
	MsgBox($MB_SYSTEMMODAL, "", "$eVar1 ist gleich wie (0): " & $eVar1 & @CRLF & _
			"$eVar2 ist gleich wie (1): " & $eVar2 & @CRLF & _
			"$eVar3 ist gleich wie (2): " & $eVar3 & @CRLF)

	; Diese Variablen sind konstant im Bereich von 1 bis 2. $eVariant3 wird auf 5 gesetzt und ab dort fortgesetzt mit dem Inkrement von 1.
	Local Enum $eVariant1 = 1, $eVariant2, $eVariant3 = 5, $eVariant4
	MsgBox($MB_SYSTEMMODAL, "", "$eVariant1 ist gleich wie (1): " & $eVariant1 & @CRLF & _
			"$eVariant2 ist gleich wie (2): " & $eVariant2 & @CRLF & _
			"$eVariant3 ist gleich wie (5): " & $eVariant3 & @CRLF & _
			"$eVariant3 ist gleich wie (6): " & $eVariant4 & @CRLF)

	; Das Mehrfache von jeder Aufzählung von 2.
	Local Enum Step *2 $eFoo1, $eFoo2, $eFoo3, $eFoo4
	MsgBox($MB_SYSTEMMODAL, "", "$eFoo1 ist gleich wie (1): " & $eFoo1 & @CRLF & _
			"$eFoo2 ist gleich wie (2): " & $eFoo2 & @CRLF & _
			"$eFoo3 ist gleich wie (4): " & $eFoo3 & @CRLF & _
			"$eFoo3 ist gleich wie (8): " & $eFoo4 & @CRLF)
EndFunc   ;==>Example