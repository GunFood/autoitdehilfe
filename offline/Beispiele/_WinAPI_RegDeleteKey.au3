#RequireAdmin

#include <Debug.au3>
#include <WinAPIReg.au3>

_DebugSetup(Default, True)

Example()

Func Example()
	Local $sKey = "HKEY_LOCAL_MACHINE"
	Local $sSubKey = "SOFTWARE\MyApp"

	Local $sMyKey = $sKey & "\" & $sSubKey
	_DebugReport('@@ Debug(' & @ScriptLineNumber & ') : $sMyKey = ' & $sMyKey & @CRLF & '>Fehlercode: ' & @error & '    Erweiterter Code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Konsole

	Local $hOpenKey = _WinAPI_RegCreateKey($sMyKey)
	_DebugReport('@@ Debug(' & @ScriptLineNumber & ') : $hOpenKey = ' & $hOpenKey & @CRLF & '>Fehlercode: ' & @error & '    Erweiterter Code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Konsole

	Local $iRegDelete = _WinAPI_RegDeleteKey($hOpenKey)
	_DebugReport('@@ Debug(' & @ScriptLineNumber & ') : $iRegDelete = ' & $iRegDelete & @CRLF & '>Fehlercode: ' & @error & '    Erweiterter Code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Konsole

	Local $iRegClose = _WinAPI_RegCloseKey($hOpenKey)
	_DebugReport('@@ Debug(' & @ScriptLineNumber & ') : $iRegClose = ' & $iRegClose & @CRLF & '>Fehlercode: ' & @error & '    Erweiterter Code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Konsole

EndFunc   ;==>Example
