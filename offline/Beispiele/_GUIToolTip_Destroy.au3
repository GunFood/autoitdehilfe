#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiToolTip.au3>

; Click the button to destroy the tooltip control
Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Destroy - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; create a tooltip control using default settings
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Click to Destroy", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is a ToolTip", $hButton)
	_GUIToolTip_AddTool($hToolTip, $hGUI, "ToolTip text for the GUI", $hGUI)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
				; Destroys the tooltip control
				_GUIToolTip_Destroy($hToolTip)
				_MemoMsgBox($MB_SYSTEMMODAL, "Tool count", "Number of tools:" & @TAB & _GUIToolTip_GetToolCount($hToolTip))
		EndSwitch
	WEnd

	; Destroy the tooltip control (in case the button hasn't been actioned yet)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
