#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIHObj.au3>

Example_TokInfo()

Func Example_TokInfo()
	Local $hProcess = _WinAPI_GetCurrentProcess()
	If @error Then Return ; Auf mögliche Fehler prüfen.

	Local $hToken = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
	; Wenn ein Token zurückgegeben wurde...
	If $hToken Then
		; Informationen über den Typ des Token erhalten:
		Local $tInfo = _Security__GetTokenInformation($hToken, $TOKENTYPE)
		; Das Ergebnis liegt als roher binärer Datensatz vor. Für §TOKENTYPE ist es TOKEN_TYPE, reinterpretiert als "int" Typ:
		Local $iTokenType = DllStructGetData(DllStructCreate("int", DllStructGetPtr($tInfo)), 1)

		ConsoleWrite("Der Tokentyp ist " & $iTokenType & @CRLF) ; Kann den Wert von $TOKENPRIMARY oder $TOKENIMPERSONATION annehmen.

		; Tokenhandle schließen:
		_WinAPI_CloseHandle($hToken)
	EndIf
EndFunc   ;==>Example_TokInfo
