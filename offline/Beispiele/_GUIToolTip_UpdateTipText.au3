#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Update TipText v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; Create a tooltip control
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Toggle Text", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	; Add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "Click this to change tooltip text", $hButton)

	GUISetState(@SW_SHOW)

	Local $bNew = False
	While 1
		Switch GUIGetMsg()
			Case $idButton ; Press the button to change the text of the tooltip
				$bNew = Not $bNew
				If $bNew Then
					_GUIToolTip_UpdateTipText($hToolTip, $hGUI, $hButton, 'New text')
				Else
					_GUIToolTip_UpdateTipText($hToolTip, $hGUI, $hButton, "Click this to change tooltip text")
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
