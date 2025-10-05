#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get BubbleHeight - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton("This is a button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)
	; create a tooltip control using default settings
	Local $hToolTip = _GUIToolTip_Create(0)

;~ 	 $hGUI = 0 ; is OK
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is a ToolTip", $hButton)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	; Display the height of the tooltip bubble in pixels
	_MemoMsgBox($MB_SYSTEMMODAL, "Info", "Bubble Height = " & _GUIToolTip_GetBubbleHeight($hToolTip, $hGUI, $hButton) & " Pixels")

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
