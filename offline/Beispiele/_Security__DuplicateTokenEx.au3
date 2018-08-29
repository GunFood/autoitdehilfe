#include <MsgBoxConstants.au3>
#include <ProcessConstants.au3>
#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIHObj.au3>
#include <WinAPIProc.au3>

Local $hProcess = _WinAPI_OpenProcess($PROCESS_ALL_ACCESS, 0, ProcessExists("explorer.exe"))
; Wenn erfolgreich:
If $hProcess Then
	; Token stellen:
	Local $hTokOriginal = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
	; Prozesshandle schließen, da es nicht mehr gebraucht wird:
	_WinAPI_CloseHandle($hProcess)
	; Wenn erfolgreich:
	If $hTokOriginal Then
		; Duplizieren des Originaltokens:
		Local $hTokDuplicate = _Security__DuplicateTokenEx($hTokOriginal, $TOKEN_ALL_ACCESS, $SECURITYIMPERSONATION, $TOKENPRIMARY)
		; Originaltoken schließen:
		_WinAPI_CloseHandle($hTokOriginal)
		; Nun liegt ein primäres Token vor (!)

		; ... Weitere Tokenbefehle hier hinein ...

		MsgBox($MB_SYSTEMMODAL, "DuplicateTokenEx", "$hTokDuplicate = " & $hTokDuplicate)

		; Token schließen:
		_WinAPI_CloseHandle($hTokDuplicate)
	EndIf
EndIf

