#RequireAdmin ; erforderlich, wenn im Benutzermodus gearbeitet wird

#include <MsgBoxConstants.au3>
#include <Security.au3>
#include <SecurityConstants.au3>
#include <WinAPIHObj.au3>

Local $hToken = _Security__OpenProcessToken(_WinAPI_GetCurrentProcess(), $TOKEN_ALL_ACCESS)
If $hToken Then
	; $hToken ist das Prozesstoken mit $TOKEN_ALL_ACCESS Zugriff.

	; SeDebugPrivilege für dieses Token nutzen:
	If _Security__SetPrivilege($hToken, $SE_DEBUG_NAME, True) Then
		;... Hier alle Funktionen hinein, die mit dem Token arbeiten ...
		MsgBox($MB_SYSTEMMODAL, "TokenPrivileges", $SE_DEBUG_NAME & " aktiviert!")
		; Deaktivieren:
		If _Security__SetPrivilege($hToken, $SE_DEBUG_NAME, False) Then
			MsgBox($MB_SYSTEMMODAL, "TokenPrivileges", $SE_DEBUG_NAME & " deaktiviert!")
		Else
			MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, "TokenPrivileges", $SE_DEBUG_NAME & " deaktiviert FAILED!")
		EndIf
	Else
		MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, "TokenPrivileges", $SE_DEBUG_NAME & " aktiviert FAILED!")
	EndIf

	; Handle schließen
	_WinAPI_CloseHandle($hToken)
Else
	MsgBox($MB_ICONERROR + $MB_SYSTEMMODAL, "OpenProcessToken", "TOKEN_ALL_ACCESS FAILED!")
EndIf
