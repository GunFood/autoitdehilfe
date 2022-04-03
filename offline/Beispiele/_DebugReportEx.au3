#include <Debug.au3>

_DebugSetup()

_DebugOut("message1")

SomeUDF("anyfunction")
If @error Then _DebugReportEx("user32|anyfunction", True); wird an die letzte Errormeldung angehangen

Local $iRet = SomeUDF("CloseClipboard")
If @error Or $iRet = 0 Then _DebugReportEx("user32|CloseClipboard")

_DebugOut("message2")

$iRet = SomeUDF("CloseClipboard")
If @error Or $iRet = 0 Then _DebugReportEx("user32|CloseClipboard", False, True) ; Skript wird "zerstört"
_DebugReport("message3") ; wird nicht gemeldet

Func SomeUDF($sFunc)
	Local $aResult = DllCall("user32.dll", "int", $sFunc)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aResult[0]
EndFunc   ;==>SomeUDF
