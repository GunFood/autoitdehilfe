#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ProgressConstants.au3>
#include <Timers.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_hStatus, $g_idProgress, $g_iPercent = 0, $g_iDirection = 1
Global $g_iTimer1, $g_iTimer2

_Example_Events()

Func _Example_Events()
	Local $hGUI, $idBtn_Change, $iWait = 10, $idBtn_State
	Local $aParts[3] = [75, 330, -1]

	$hGUI = GUICreate("Timer unter Verwendung von WM_TIMER Events", 400, 320)
	_MemoCreate(2, 32, 396, 226, BitOR($WS_HSCROLL, $WS_VSCROLL))
	$idBtn_State = GUICtrlCreateButton("Startet Progressbar", 75, 270, 120, 25)
	$idBtn_Change = GUICtrlCreateButton("Intervall ändern", 205, 270, 120, 25)
	GUICtrlSetState($idBtn_Change, $GUI_DISABLE)
	$g_hStatus = _GUICtrlStatusBar_Create($hGUI, $aParts)
	_GUICtrlStatusBar_SetText($g_hStatus, "2 Timer")
	_GUICtrlStatusBar_SetText($g_hStatus, @TAB & @TAB & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 2)
	$g_idProgress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
	GUICtrlSetColor($g_idProgress, 0xff0000)
	_GUICtrlStatusBar_EmbedControl($g_hStatus, 1, GUICtrlGetHandle($g_idProgress))
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_TIMER, "WM_TIMER")

	$g_iTimer1 = _Timer_SetTimer($hGUI, 1000) ; Timer 1 erstellen

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_State
				If GUICtrlRead($idBtn_State) = "Startet Progressbar" Then
					$g_iTimer2 = _Timer_SetTimer($hGUI, $iWait) ; Timer 2 erstellen
					If @error Or $g_iTimer2 = 0 Then ContinueLoop
					GUICtrlSetData($idBtn_State, "Stoppe Progressbar")
					GUICtrlSetState($idBtn_Change, $GUI_ENABLE)
				Else
					GUICtrlSetState($idBtn_Change, $GUI_DISABLE)
					_Timer_KillTimer($hGUI, $g_iTimer2)
					GUICtrlSetData($idBtn_State, "Startet Progressbar")
				EndIf

			Case $idBtn_Change
				If $iWait = 10 Then
					$iWait = 250
				Else
					$iWait = 10
				EndIf
				_MemoWrite("Timer für _UpdateProgressBar gesetzt auf: " & $iWait & " ms")
				$g_iTimer2 = _Timer_SetTimer($hGUI, $iWait, "", $g_iTimer2) ; Timer mit verschiedenen Zeitintervallen verwenden
		EndSwitch
	WEnd

	ConsoleWrite("Alle Timer zerstört? " & _Timer_KillAllTimers($hGUI) & @CRLF)
	GUIDelete()
EndFunc   ;==>_Example_Events

; Timer-Ereignisse
Func WM_TIMER($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam

	Switch _Timer_GetTimerID($wParam)
		Case $g_iTimer1
			_UpdateStatusBarClock()
		Case $g_iTimer2
			_UpdateProgressBar()
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_TIMER

Func _UpdateStatusBarClock()
	_GUICtrlStatusBar_SetText($g_hStatus, @TAB & @TAB & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 2)
EndFunc   ;==>_UpdateStatusBarClock

Func _UpdateProgressBar()
	$g_iPercent += 5 * $g_iDirection
	GUICtrlSetData($g_idProgress, $g_iPercent)
	If $g_iPercent = 100 Or $g_iPercent = 0 Then $g_iDirection *= -1
	If $g_iPercent = 100 Then
		GUICtrlSetColor($g_idProgress, 0xff0000)
	ElseIf $g_iPercent = 0 Then
		GUICtrlSetColor($g_idProgress, 0x0000ff)
	EndIf
EndFunc   ;==>_UpdateProgressBar