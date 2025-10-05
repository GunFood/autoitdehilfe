#include <Security.au3>
#include <WinAPIError.au3>
#include <WinAPIHObj.au3>

Local $hToken = _Security__OpenThreadToken($TOKEN_ADJUST_PRIVILEGES)
If $hToken Then
	_WinAPI_CloseHandle($hToken)
Else
	ConsoleWrite("_Security__OpenThreadToken Error: " & _WinAPI_GetLastErrorMessage() & @CRLF)
	ConsoleWrite("Neuer Versuch..." & @CRLF)

	; Mehr dazu bei den Bemerkungen zu _Security__OpenThreadToken.
	_Security__ImpersonateSelf()
	$hToken = _Security__OpenThreadToken($TOKEN_ADJUST_PRIVILEGES)
	If $hToken Then
		ConsoleWrite(">>> ERFOLGREICH, $hToken = " & $hToken & @CRLF)
		_WinAPI_CloseHandle($hToken)
	Else
		ConsoleWrite("!FEHLGESCHLAGEN" & @CRLF)
	EndIf
EndIf
