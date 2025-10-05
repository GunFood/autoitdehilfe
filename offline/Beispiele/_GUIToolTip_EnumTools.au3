#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Enum Tool v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; create a tooltip control using default settings
	Local $hTooltip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hTooltip)

	Local $idButton = GUICtrlCreateButton("This is a button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; text not return
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($hTooltip, $hGUI, "This is a ToolTip", $hButton)
	_GUIToolTip_AddTool($hTooltip, $hGUI, "This is the GUI ToolTip", $hGUI)

	GUISetState(@SW_SHOW)

	; GetToolCount returns 2, but tools are numbered starting from zero (0), so we have to subtract 1
	For $I = 0 To _GUIToolTip_GetToolCount($hTooltip) - 1
		Local $aTool = _GUIToolTip_EnumTools($hTooltip, $I)
		_MemoMsgBox($MB_SYSTEMMODAL, "Tooltip info for tooltip - #" & $I, "Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
				"HWnd: " & @TAB & "0x" & Hex($aTool[1]) & @CRLF & _
				"ID: " & @TAB & "0x" & Hex($aTool[2]) & @CRLF & _
				"Left X:" & @TAB & $aTool[3] & @CRLF & _
				"Left Y:" & @TAB & $aTool[4] & @CRLF & _
				"Right X:" & @TAB & $aTool[5] & @CRLF & _
				"Right Y:" & @TAB & $aTool[6] & @CRLF & _
				"Instance:" & @TAB & $aTool[7] & @CRLF & _
				"Text:" & @TAB & $aTool[8] & @CRLF & _
				"lParam:" & @TAB & $aTool[9])
	Next

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hTooltip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
