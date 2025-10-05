#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Activate/Deactivate (v" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idBtn_ToggleTips = GUICtrlCreateButton("Tips: On", 30, 32, 180, 28)
	Local $hToggleTips = GUICtrlGetHandle($idBtn_ToggleTips)
	; create a tooltip control using the balloon style
	Local $hToolTip = _GUIToolTip_Create(0, $TTS_BALLOON)

;~ 	$hGUI = 0 ; is OK
	; add a tool to the tooltip control using the default settings.
	_GUIToolTip_AddTool($hToolTip, $hGUI, "Tooltip for the GUI", $hGUI)
	; add a tool to the tooltip control centering the tip below the button instead of above the mouse pointer
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This button toggles the tooltips on and off", $hToggleTips, 0, 0, 0, 0, BitOR($TTF_CENTERTIP, $TTF_SUBCLASS, $TTF_IDISHWND))

	GUISetState(@SW_SHOW)

	Local $bActivate = True
	While 1
		Switch GUIGetMsg()
			Case $idBtn_ToggleTips
				$bActivate = Not $bActivate
				If $bActivate Then
					_GUIToolTip_Activate($hToolTip)
					GUICtrlSetData($idBtn_ToggleTips, 'Tips: On')
				Else
					_GUIToolTip_Deactivate($hToolTip)
					GUICtrlSetData($idBtn_ToggleTips, 'Tips: Off')
				EndIf

			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
