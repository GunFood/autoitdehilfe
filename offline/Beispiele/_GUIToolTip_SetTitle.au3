#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Set Title v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; Create a tooltip control
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	_MemoCreate(4, 68, 444, 196)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	; Add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is the ToolTip text", $hButton)

	; Set the title of the tooltip
	_GUIToolTip_SetTitle($hToolTip, 'This is the ToolTip title', $TTI_INFO)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	_MemoMsgBox($MB_SYSTEMMODAL, "ToolTip Title =", _GUIToolTip_GetTitleText($hToolTip))
	_MemoMsgBox($MB_SYSTEMMODAL, "Tooltip Text =", _GUIToolTip_GetText($hToolTip, $hGUI, $hButton))

	_MemoMsgBoxStatus("", -1, $hGUI) ; no more action, wait GUI for closing

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
