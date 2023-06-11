#RequireAdmin ; damit dieses Beispiel einen Sinn hat

#include <MsgBoxConstants.au3>
#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIHObj.au3>

Example_GetTokInfo()

Example_SetTokInfo()

Func Example_GetTokInfo()
	Local $hProcess = _WinAPI_GetCurrentProcess()
	If @error Then Return ; Auf mögliche Fehler prüfen.

	Local $hToken = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
	; Wenn ein Token zurückgegeben wurde...
	If $hToken Then
		; Informationen über den Typ des Token erhalten:
		Local $tInfo = _Security__GetTokenInformation($hToken, $TOKENTYPE)
		; Das Ergebnis liegt als roher binärer Datensatz vor. Für §TOKENTYPE ist es TOKEN_TYPE, reinterpretiert als "int" Typ:
		Local $iTokenType = DllStructGetData(DllStructCreate("int", DllStructGetPtr($tInfo)), 1)

		MsgBox($MB_SYSTEMMODAL, "GetTokenInformation", "Der Tokentyp ist " & $iTokenType) ; Kann entweder den Wert $TOKENPRIMARY = 1 oder $TOKENIMPERSONATION = 2 annehmen

		; Tokenhandle schließen:
		_WinAPI_CloseHandle($hToken)
	EndIf
EndFunc   ;==>Example_GetTokInfo

Func Example_SetTokInfo()
	Local $hProcess = _WinAPI_GetCurrentProcess()
	If @error Then Return ; Prüfung auf mögliche Fehler

	Local $hToken = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)

	; Wenn Token get ist...
	If $hToken Then
		; Mittlere Integritätsstufe für dieses Token festlegen.
		Local $tSID = _Security__StringSidToSid($SID_MEDIUM_MANDATORY_LEVEL)
		; Definieren Sie die Struktur TOKEN_MANDATORY_LABEL
		Local Const $tTOKEN_MANDATORY_LABEL = DllStructCreate("ptr Sid; dword Attributes")
		; Mit den gewünschten Daten füllen
		DllStructSetData($tTOKEN_MANDATORY_LABEL, "Sid", DllStructGetPtr($tSID, 1))
		DllStructSetData($tTOKEN_MANDATORY_LABEL, "Attributes", $SE_GROUP_INTEGRITY)

		If _Security__SetTokenInformation($hToken, $TOKENINTEGRITYLEVEL, $tTOKEN_MANDATORY_LABEL, DllStructGetSize($tTOKEN_MANDATORY_LABEL)) Then

			; Standard IL ist $SID_HIGH_MANDATORY_LEVEL, however...
			MsgBox($MB_SYSTEMMODAL, "SetTokenInformation", "$hToken = " & $hToken & @CRLF & "Dieses Token hat eine nicht standardmäßige mittlere Integritätsstufe")

			; ... Hier etwas mit Token machen ...

		EndIf
		; Den Token-Handle schließen, wenn er nicht mehr benötigt wird
		_WinAPI_CloseHandle($hToken)
	EndIf
EndFunc   ;==>Example_SetTokInfo

