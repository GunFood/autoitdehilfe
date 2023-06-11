#include <MsgBoxConstants.au3>
#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIError.au3>
#include <WinAPIHObj.au3>

Local $hToken = _Security__OpenThreadTokenEx($TOKEN_ADJUST_PRIVILEGES)
If $hToken Then
	; $hToken ist das Threadtoken mit $TOKEN_ADJUST_PRIVILEGES Zugriff.
	MsgBox($MB_SYSTEMMODAL, "OpenThreadTokenEx", "$hToken = " & $hToken)

	_WinAPI_CloseHandle($hToken)
Else
	ConsoleWrite("! _Security__OpenThreadTokenEx ERROR. Fehler: " & _WinAPI_GetLastErrorMessage())
EndIf
