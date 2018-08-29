#include <MsgBoxConstants.au3>

Example(Default, Default)

Func Example($vParam1 = Default, $vParam2 = "Two", $vParam3 = Default)
	If $vParam1 = Default Then $vParam1 = "One" ; Falls das Schlüsselwort 'Default' verwendet wird, so wird der Variablen "One" zugewiesen
	If $vParam3 = Default Then $vParam3 = "Three" ; Falls das Schlüsselwort 'Default' verwendet wird, so wird der Variablen "Three" zugewiesen

	; Zeigt die folgenden Parameter die an die Funktion übergeben werden.
	MsgBox($MB_SYSTEMMODAL, "Parameter", "1 = " & $vParam1 & @CRLF & _
			"2 = " & $vParam2 & @CRLF & _
			"3 = " & $vParam3)
EndFunc   ;==>Example
