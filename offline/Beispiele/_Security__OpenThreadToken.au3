#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIError.au3>
#include <WinAPIHObj.au3>

Local $hToken = _Security__OpenThreadToken($TOKEN_ADJUST_PRIVILEGES)
If $hToken Then
	ConsoleWrite("$hToken = " & $hToken & @CRLF)
	; $hToken ist das Threadtoken mit $TOKEN_ADJUST_PRIVILEGES Zugriff.

	;... Hier alle Funktionen hinein, die mit dem Token arbeiten ...

	_WinAPI_CloseHandle($hToken)
Else
	ConsoleWrite(_WinAPI_GetLastErrorMessage())
	; Mehr dazu in der Hilfe zu _Security__OpenThreadToken
EndIf
