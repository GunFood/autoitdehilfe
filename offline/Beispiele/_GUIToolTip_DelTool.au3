#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Del Tool v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; create a tooltip control using default settings
	Local $hTooltip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hTooltip)

	Local $idButton = GUICtrlCreateButton("Click to Delete Tool", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

	_GUIToolTip_SetMaxTipWidth($hTooltip, 400)

;~ 	$hGUI = 0 ; is OK
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($hTooltip, $hGUI, "Click this to delete the tooltip" & @CRLF & "for this button", $hButton)
	_GUIToolTip_AddTool($hTooltip, $hGUI, "ToolTip text for the GUI", $hGUI)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
				; Deletes the tooltip assigned to the button,
				; but not the tooltip control for the GUI
				_GUIToolTip_DelTool($hTooltip, $hGUI, $hButton)
				_MemoMsgBox($MB_SYSTEMMODAL, "Tool count", "Number of tools:" & @TAB & _GUIToolTip_GetToolCount($hToolTip))
		EndSwitch
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hTooltip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
