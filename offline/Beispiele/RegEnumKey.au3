#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sSubKey = "", $sEnumKey = "unter HKLM\SOFTWARE:" & @CRLF & @CRLF

	; Schleife von 1 bis 10, zeigt die Registryschlüssel bei dem bestimmten Instanzwert an.
	For $i = 1 To 10
		$sSubKey = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE", $i)
		If @error Then ExitLoop
		$sEnumKey &= "#" & $i & @TAB & $sSubKey & @CRLF
	Next

	MsgBox($MB_SYSTEMMODAL, "RegEnumKey Beispiel", $sEnumKey)
EndFunc   ;==>Example
