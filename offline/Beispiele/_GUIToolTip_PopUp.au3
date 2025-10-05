#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Pop - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton("ToolTip showing", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

	$hGUI = 0 ; is OK
	Local $hToolTip = _GUIToolTip_Create($hGUI, BitOR($_TT_ghTTDefaultStyle, $TTS_BALLOON))
	_MemoCreate(4, 68, 444, 196)

;~ 	$hGUI = 0 ; is OK
	_GUIToolTip_AddTool($hToolTip, $hGUI, " ", $hButton)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	_MemoMsgBoxStatus("", -1) ; display wait for closing status

	_GUIToolTip_TrackActivate($hToolTip, True, $hGUI, $hButton)
	Local $bDisplay = True
	Local $aMousePos
	Local $hTimer = TimerInit()
	While 1
		Sleep(10)
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
		$aMousePos = MouseGetPos()
		_GUIToolTip_TrackPosition($hToolTip, $aMousePos[0] + 10, $aMousePos[1] + 20)
		_GUIToolTip_UpdateTipText($hToolTip, $hGUI, $hButton, "X: " & $aMousePos[0] & " Y: " & $aMousePos[1])
		; Every 3 seconds the tooltip will be "popped" in or out of view
		; to get it to display after the 8 seconds has passed, you have to hover
		; over the button.
		If TimerDiff($hTimer) > 3000 Then
			$bDisplay = Not $bDisplay
			$hTimer = TimerInit()
			If $bDisplay Then
				; to allow tooltip to display
				MouseMove(50, 42, 0)
				Sleep(250)

				GUICtrlSetData($idButton, "ToolTip showing")
				_GUIToolTip_PopUp($hToolTip)
			Else
				GUICtrlSetData($idButton, "Hover here now")
				_GUIToolTip_Pop($hToolTip)
			EndIf
		EndIf
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
