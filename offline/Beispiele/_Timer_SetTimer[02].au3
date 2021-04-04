#include <Timers.au3>

Global $g_iMsecs = 0, $g_sResult = '', $g_sCDdrv

_Example_TimeOut()

Func _Example_TimeOut()
	$g_sCDdrv = DriveGetDrive("CDROM")
	$g_sCDdrv = $g_sCDdrv[1]

	Local $hGUI = GUICreate("", 140, 64, -1, -1, 0)
	GUICtrlCreateLabel("Lege eine CD in das Laufwerk ein", 8, 8, 115, 17)
	GUISetState(@SW_SHOW)

	Local $iIDtimer = _Timer_SetTimer($hGUI, 1000, "Check_mounted") ; Timer erstellen.
	While $g_sResult = ''
		Sleep(200)
	WEnd

	_Timer_KillTimer($hGUI, $iIDtimer)
	MsgBox(0, '', $g_sResult, 5)

	ConsoleWrite("Alle Timer beendet? " & _Timer_KillAllTimers($hGUI) & @CRLF) ; muss falsch sein, da alle Timer bereits beendet wurden
	GUIDelete($hGUI)
EndFunc   ;==>_Example_TimeOut

Func Check_mounted($hWnd, $iMsg, $iIDtimer, $iTime)
	#forceref $hWnd, $iMsg, $iIDTimer,$iTime
	$g_sResult = ''
	If FileExists($g_sCDdrv & '\') Then
		$g_sResult = DriveGetLabel($g_sCDdrv) & ' eingefügt' & @CRLF
		$g_sResult &= 'auf Laufwerk ' & $g_sCDdrv
	Else
		$g_iMsecs += 1000
		If $g_iMsecs = 10000 Then
			$g_sResult = 'Zeitüberschreitung'
		EndIf
	EndIf
EndFunc   ;==>Check_mounted
