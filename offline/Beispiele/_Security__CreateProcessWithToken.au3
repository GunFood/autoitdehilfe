#include <MsgBoxConstants.au3>
#include <ProcessConstants.au3>
#include <Security.au3>
#include <SecurityConstants.au3>
#include <StructureConstants.au3>
#include <WinAPIHObj.au3>
#include <WinAPIProc.au3>

#RequireAdmin ; Adminrechte für Änderungen im System.

Example_ProcessWithTok()


Func Example_ProcessWithTok()
	; AutoIt mit normalem Level ausführen, unabhängig von den Rechten, welche durch #RequireAdmin oder andere Kommandos erlangt wurden.
	_RunNonElevated('"' & @AutoItExe & '" /AutoIt3ExecuteLine  "MsgBox(4096, ''RunNonElevated'', ''IsAdmin() = '' & "IsAdmin()" & '', PID = '' & "@AutoItPID")"')
EndFunc   ;==>Example_ProcessWithTok


Func _RunNonElevated($sCommandLine = "")
	If Not IsAdmin() Then Return Run($sCommandLine) ; Wenn der aktuelle Prozess kein höheres Level hat wird ein Neuer gestartet.

	; Structs für das Erstellen von Prozessen:
	Local $tSTARTUPINFO = DllStructCreate($tagSTARTUPINFO)
	Local $tPROCESS_INFORMATION = DllStructCreate($tagPROCESS_INFORMATION)

	; Handle von einem Low-Level Prozess, beispielsweise Explorer:
	Local $hProcess = _WinAPI_OpenProcess($PROCESS_ALL_ACCESS, 0, ProcessExists("explorer.exe"))

	; Wenn erfolgreich:
	If $hProcess Then
		; Token:
		Local $hTokOriginal = _Security__OpenProcessToken($hProcess, $TOKEN_ALL_ACCESS)
		; Prozesshandle schließen, da nicht mehr benötigt:
		_WinAPI_CloseHandle($hProcess)
		; Wenn erfolgreich:
		If $hTokOriginal Then
			; Originaltoken duplizieren:
			Local $hTokDuplicate = _Security__DuplicateTokenEx($hTokOriginal, $TOKEN_ALL_ACCESS, $SECURITYIMPERSONATION, $TOKENPRIMARY)
			; Originaltoken schließen:
			_WinAPI_CloseHandle($hTokOriginal)
			; Wenn erfolgreich:
			If $hTokDuplicate Then
				; Neuen Prozess mit diesem Token erstellen:
				_Security__CreateProcessWithToken($hTokDuplicate, 0, $sCommandLine, 0, @ScriptDir, $tSTARTUPINFO, $tPROCESS_INFORMATION)
				; Dieses Token schließen:
				_WinAPI_CloseHandle($hTokDuplicate)
				; Alle Handles schließen:
				_WinAPI_CloseHandle(DllStructGetData($tPROCESS_INFORMATION, "hProcess"))
				_WinAPI_CloseHandle(DllStructGetData($tPROCESS_INFORMATION, "hThread"))
				; PID vom neuen Prozess zurückgeben:
				Return DllStructGetData($tPROCESS_INFORMATION, "ProcessID")
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_RunNonElevated
