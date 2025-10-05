#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Global $g_hToolTip

; Press the "g" key to display the information
HotKeySet("g", "Get_Tool")

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip ToolExists - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton("Button ToolTip", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)
	; create a tooltip control using default settings
	$g_hToolTip = _GUIToolTip_Create(0)

;~ 	$hGUI = 0 ; is OK
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($g_hToolTip, $hGUI, "This is a ToolTip", $hButton)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	Get_Tool()

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($g_hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example

Func Get_Tool()
	; This will display "True" if the tool is displaying
	_MemoMsgBox($MB_SYSTEMMODAL, "", "Tooltip Exists = " & _GUIToolTip_ToolExists($g_hToolTip))
EndFunc   ;==>Get_Tool
