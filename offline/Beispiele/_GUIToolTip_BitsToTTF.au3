#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip BitsToTTF - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton("This is a button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)
	; create a tooltip control using default settings
	Local $hToolTip = _GUIToolTip_Create(0)

;~ 	$hGUI = 0 ; no text
	; add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is a ToolTip", $hButton)

	GUISetState(@SW_SHOW)

	; Retrieve the information for the tool assigned to the button
	Local $aTool = _GUIToolTip_GetToolInfo($hToolTip, $hGUI, $hButton)
	; Convert the array to text using the _GUIToolTip_BitsToTTF function to convert the flag
	; information to a text string.
	_MemoMsgBox($MB_SYSTEMMODAL, "Tooltip info", "Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
			"HWnd: " & @TAB & $aTool[1] & @CRLF & _
			"ID: " & @TAB & $aTool[2] & @CRLF & _
			"Left X:" & @TAB & $aTool[3] & @CRLF & _
			"Left Y:" & @TAB & $aTool[4] & @CRLF & _
			"Right X:" & @TAB & $aTool[5] & @CRLF & _
			"Right Y:" & @TAB & $aTool[6] & @CRLF & _
			"Instance:" & @TAB & $aTool[7] & @CRLF & _
			"Text:" & @TAB & $aTool[8] & @CRLF & _
			"lParam:" & @TAB & $aTool[9])

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
