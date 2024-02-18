#include <MsgboxConstants.au3>

;~ #RequireAdmin

; erfordert Admin-Rechte
Local $sKey = "HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders"
Local $iRegWrite = RegWrite($sKey, "test", "REG_DWORD", "1")
If $iRegWrite = 0 Then
	MsgBox($MB_ICONWARNING + $MB_TOPMOST, "erfordert Admin-Rechte", "Kann nicht erstellt werden" & @CRLF & @CRLF & $sKey & @CRLF & @CRLF & 'Return = ' & $iRegWrite & @CRLF & '@error = ' & @error & @TAB & '@extended = ' & @extended & ' (0x' & Hex(@extended) & ')') ;### Debug MSGBOX
Else
	MsgBox($MB_TOPMOST, "RegWrite", $sKey & @CRLF & @CRLF & "erfolgreich erstellt")

	; Registry bereinigen
	RegDelete($sKey, "test")
EndIf

; Erfordert keine Admin-Rechte
$sKey = "HKEY_CURRENT_USER\Software\Test"
$iRegWrite = RegWrite("HKEY_CURRENT_USER\Software\Test", "test", "REG_DWORD", "1")
If $iRegWrite = 0 Then
	; Sollte nicht vorkommen
	MsgBox($MB_ICONERROR + $MB_TOPMOST, "AutoIt Fehler", "Kann nicht erstellt werden" & @CRLF & @CRLF & $sKey & @CRLF & @CRLF & 'Return = ' & $iRegWrite & @CRLF & '@error = ' & @error & @TAB & '@extended = ' & @extended & ' (0x' & Hex(@extended) & ')')
Else
	If IsAdmin() Then
		MsgBox($MB_TOPMOST, "RegWrite", $sKey & " erfolgreich erstellt")
	Else
		ConsoleWrite("- " & $sKey & " erfolgreich erstellt" & @CRLF)
	EndIf

	; Registry bereinigen
	RegDelete($sKey, "test")
	RegDelete($sKey)
EndIf
