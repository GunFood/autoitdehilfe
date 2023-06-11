#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Local $hWnd, $iRET, $sMsg, $tRET

; Eine Notepad-Instanz erzeugen
Run("notepad.exe")
$hWnd = WinWait("[CLASS:Notepad]")
WinMove($hWnd, "", 256, 256, 400, 400)
Sleep(1000)

; Minimiert das Fenster, danach Ausgabe der Positionswerte, die mit _WinAPI_GetWindowPlacement() ermittelt werden
WinSetState($hWnd, "", @SW_MINIMIZE)
$tRET = _WinAPI_GetWindowPlacement($hWnd)
If @error = 0 Then
	$sMsg = "$stWindowPlacement:" & @CRLF
	$sMsg &= @TAB & "Länge der Struktur = " & DllStructGetData($tRET, "length") & " Byte" & @CRLF
	$sMsg &= @TAB & "Flags = " & DllStructGetData($tRET, "flags") & @CRLF
	$sMsg &= @TAB & "showCmd = " & DllStructGetData($tRET, "showCmd") & @CRLF & @CRLF
	$sMsg &= "ptMinPosition:" & @CRLF
	$sMsg &= @TAB & "MinX = " & DllStructGetData($tRET, "ptMinPosition", 1) & @CRLF
	$sMsg &= @TAB & "MinY = " & DllStructGetData($tRET, "ptMinPosition", 2) & @CRLF & @CRLF
	$sMsg &= "ptMaxPosition:" & @CRLF
	$sMsg &= @TAB & "MaxX = " & DllStructGetData($tRET, "ptMaxPosition", 1) & @CRLF
	$sMsg &= @TAB & "MaxY = " & DllStructGetData($tRET, "ptMaxPosition", 2) & @CRLF & @CRLF
	$sMsg &= "rcNormalPosition:" & @CRLF
	$sMsg &= @TAB & "links = " & DllStructGetData($tRET, "rcNormalPosition", 1) & @CRLF
	$sMsg &= @TAB & "oben = " & DllStructGetData($tRET, "rcNormalPosition", 2) & @CRLF
	$sMsg &= @TAB & "rechts = " & DllStructGetData($tRET, "rcNormalPosition", 3) & @CRLF
	$sMsg &= @TAB & "unten = " & DllStructGetData($tRET, "rcNormalPosition", 4)
	MsgBox($MB_SYSTEMMODAL, "Erfolg", $sMsg)

	; Ändert das normalisierte Rechteck mit _WinAPI_SetWindowPlacement(), danach das Fenster wiederherstellen
	DllStructSetData($tRET, "rcNormalPosition", 128, 1) ; Links
	DllStructSetData($tRET, "rcNormalPosition", 128, 2) ; Oben
	DllStructSetData($tRET, "rcNormalPosition", @DesktopWidth - 128, 3) ; Rechts
	DllStructSetData($tRET, "rcNormalPosition", @DesktopHeight - 128, 4) ; Unten
	$iRET = _WinAPI_SetWindowPlacement($hWnd, $tRET)
	If @error = 0 Then
		WinSetState($hWnd, "", @SW_RESTORE)
		ControlSetText($hWnd, "", "Edit1", "_WinAPI_SetWindowPlacement() war erfolgreich!")
	Else
		MsgBox($MB_SYSTEMMODAL, "Fehler", "_WinAPI_SetWindowPlacement() schlug fehl!" & @CRLF & _
				"$iRET = " & $iRET & @CRLF & _
				"@error = " & @error & @CRLF & _
				"@extended = " & @extended)
	EndIf
Else
	MsgBox($MB_SYSTEMMODAL, "Fehler", "_WinAPI_GetWindowPlacement() schlug fehl!" & @CRLF & _
			"$tRET = " & $tRET & @CRLF & _
			"@error = " & @error & @CRLF & _
			"@extended = " & @extended)
EndIf
