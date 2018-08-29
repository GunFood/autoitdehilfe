#RequireAdmin ; Für Änderungen im System

#include <MsgBoxConstants.au3>
#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIHObj.au3>

Example_SeTokInfo()

Func Example_SeTokInfo()
	Local $hProcess = _WinAPI_GetCurrentProcess()
	If @error Then Return ; Auf Fehler prüfen.

	Local $hToken = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)

	; Wenn Token erhalten:
	If $hToken Then
		; Mittleres Integritätslevel für dieses Token:
		Local $tSID = _Security__StringSidToSid($SID_MEDIUM_MANDATORY_LEVEL)
		; TOKEN_MANDATORY_LABEL Struct deklarieren:
		Local Const $tTOKEN_MANDATORY_LABEL = DllStructCreate("ptr Sid; dword Attributes")
		; Mit Daten füllen:
		DllStructSetData($tTOKEN_MANDATORY_LABEL, "Sid", DllStructGetPtr($tSID, 1))
		DllStructSetData($tTOKEN_MANDATORY_LABEL, "Attributes", $SE_GROUP_INTEGRITY)

		If _Security__SetTokenInformation($hToken, $TOKENINTEGRITYLEVEL, $tTOKEN_MANDATORY_LABEL, DllStructGetSize($tTOKEN_MANDATORY_LABEL)) Then

			; Default ist $SID_HIGH_MANDATORY_LEVEL als Integritätslevel, wie auch immer...
			MsgBox($MB_SYSTEMMODAL, "SetTokenInformation", "$hToken = " & $hToken & @CRLF & "Dieses Token läuft nicht default mit mittlerem Integritätslevel!")

			; ... Sonstige Tokenbefehle hier ...

		EndIf
		; Handle schließen:
		_WinAPI_CloseHandle($hToken)
	EndIf
EndFunc   ;==>Example_SeTokInfo

