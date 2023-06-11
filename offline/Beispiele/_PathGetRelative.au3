#include <File.au3>

Example()

Func Example()
	Local $sFrom, $sTo, $sPath

	$sFrom = @ScriptDir
	ConsoleWrite("Quellpfad: " & $sFrom & @CRLF)
	$sTo = @ScriptDir & "\.."
	ConsoleWrite("Zielpfad: " & $sTo & @CRLF)
	$sPath = _PathGetRelative($sFrom, $sTo)

	If @error Then
		ConsoleWrite("Fehler: " & @error & @CRLF)
		ConsoleWrite("Pfad: " & $sPath & @CRLF)
	Else
		ConsoleWrite("Relativer Pfad: " & $sPath & @CRLF)
		ConsoleWrite("Aufgelöster Pfad: " & _PathFull($sFrom & "\" & $sPath) & @CRLF)
	EndIf
EndFunc   ;==>Example
