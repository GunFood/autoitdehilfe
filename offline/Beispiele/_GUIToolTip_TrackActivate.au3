#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Track Activate v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $hToolTip = _GUIToolTip_Create(0, $TTS_BALLOON)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; Is OK
;~ 	$hButton = 0 ; Is OK

	; Add tool to the ToolTip control, not using a control or the GUI to link it to
	_GUIToolTip_AddTool($hToolTip, $hGUI, " ", $hButton, 0, 0, 0, 0, $TTF_SUBCLASS)

	_GUIToolTip_SetTitle($hToolTip, 'Mouse position', $TTI_INFO)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	_GUIToolTip_TrackActivate($hToolTip, True, $hGUI, $hButton)

	Local $aPos, $iOldaPos0, $iOldaPos1
	While 1
		Sleep(10)
		$aPos = MouseGetPos()
		If $aPos[0] <> $iOldaPos0 Or $aPos[1] <> $iOldaPos1 Then
			_GUIToolTip_TrackPosition($hToolTip, $aPos[0] + 10, $aPos[1] + 20)
			_GUIToolTip_UpdateTipText($hToolTip, $hGUI, $hButton, "X: " & $aPos[0] & " Y: " & $aPos[1])
			$iOldaPos0 = $aPos[0]
			$iOldaPos1 = $aPos[1]
		EndIf
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
