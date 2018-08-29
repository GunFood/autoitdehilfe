#include <File.au3>

Example()

Func Example()
	Local $sFrom, $sTo, $sPath
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir")

	$sFrom = @ScriptDir
	ConsoleWrite("Quellpfad: " & $sFrom & @CRLF)
	$sTo = $sFile & "\autoit3.exe"
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
