#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>

Example()

Func Example()
	; Hier den Benutzername und Passwort eingeben, die dem System entsprechen.
	Local $sUserName = "Username"
	Local $sPassword = "Password"

	; Startet den Editor und wartet bis der Prozess nicht mehr existiert. Der Editor läuft unter dem obigen Benutzer.
	Local $iReturn = RunAsWait($sUserName, @ComputerName, $sPassword, $RUN_LOGON_NOPROFILE, "notepad.exe")

	If @error Then
		Local $sLastError = _WinAPI_GetLastErrorMessage()
		MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Fehler", "Der Editor wurde nicht gestartet :" & @CRLF & @CRLF & $sLastError)
	Else
		; Zeigt den Rückgabewert des Editorprozesses an.
		MsgBox($MB_SYSTEMMODAL, "", "Der Rückgabecode des Editors lautete: " & $iReturn)
	EndIf
EndFunc   ;==>Example
