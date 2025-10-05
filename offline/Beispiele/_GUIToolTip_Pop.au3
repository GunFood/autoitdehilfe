#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Pop - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton(" Button ", 30, 32, 130, 28)
	; Local $hButton = GUICtrlGetHandle($idButton)

	Local $hToolTip = _GUIToolTip_Create(0, $TTS_BALLOON)
	Local $aPos = MouseGetPos()

;~ 	$hGUI = 0 ; is OK
	_GUIToolTip_AddTool($hToolTip, $hGUI, " ", 0, 0, 0, 0, 0, 0)

	_GUIToolTip_SetTitle($hToolTip, 'Mouse Coordinates', $TTI_INFO)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	; Find the mouse's position to use as the starting point for tracking
	_GUIToolTip_TrackPosition($hToolTip, $aPos[0], $aPos[1])
	_GUIToolTip_TrackActivate($hToolTip, True, $hGUI, 0)

	Local $hTimer = TimerInit()
	While 1
		Sleep(50)
		; Read the mouse position
		$aPos = MouseGetPos()
		; Use the position of the mouse to set the location of the tooltip
		_GUIToolTip_TrackPosition($hToolTip, $aPos[0], $aPos[1])
		_GUIToolTip_UpdateTipText($hToolTip, $hGUI, 0, "X: " & $aPos[0] & " Y: " & $aPos[1])

		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
				; ...
		EndSwitch
		; 3 seconds after starting, this will remove the tool from displaying
		If TimerDiff($hTimer) >= 3000 Then
			_GUIToolTip_Pop($hToolTip)
		EndIf
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
