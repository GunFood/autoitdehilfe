#include <WinAPIGdi.au3>
#include <WinAPIMisc.au3>

_Example()

Func _Example()
	Local $aPos = _WinAPI_GetPosFromRect(_WinAPI_CreateRectEx(10, 10, 100, 100))

	ConsoleWrite('Links:   ' & $aPos[0] & @CRLF)
	ConsoleWrite('Oben:    ' & $aPos[1] & @CRLF)
	ConsoleWrite('Breite:  ' & $aPos[2] & @CRLF)
	ConsoleWrite('Höhe: ' & $aPos[3] & @CRLF)
EndFunc   ;==>_Example
