#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get Bubble Size/Height/Width v(" & @AutoItVersion & ")", 430, 300, 100, 100)

	; create a tooltip control using default settings
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is a ToolTip", $hButton)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	Local $iSize = _GUIToolTip_GetBubbleSize($hToolTip, $hGUI, $hButton)
	Local $iBubbleHeight = _GUIToolTip_GetBubbleHeight($hToolTip, $hGUI, $hButton)
	Local $iBubbleWidth = _GUIToolTip_GetBubbleWidth($hToolTip, $hGUI, $hButton)

	; Display the height of the tooltip bubble in pixels
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Bubble Size = " & @TAB & "0x" & Hex($iSize) & @CRLF & _
			"Bubble Height = " & @TAB & $iBubbleHeight & " " & " Pixels" & @CRLF & _
			"Bubble Width = " & @TAB & $iBubbleWidth & " Pixels")

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
