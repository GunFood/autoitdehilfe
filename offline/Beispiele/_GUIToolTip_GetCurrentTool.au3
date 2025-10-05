#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Global $g_hToolTip

; Hover over the button on the GUI and press the "g" key to disply the information
HotKeySet("g", "Get_Tool")

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get Current Tool v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; create a tooltip control using default settings
	$g_hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($g_hToolTip)

	Local $idButton = GUICtrlCreateButton("Button ToolTip", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

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
	_MemoResetHandleInProcess($g_hToolTip)
	_GUIToolTip_Destroy($g_hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example

Func Get_Tool()
	Local $aTool = _GUIToolTip_GetCurrentTool($g_hToolTip)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Tooltip info @error = " & @error, "No Tooltip displayed")
	Else
		_MemoMsgBox($MB_SYSTEMMODAL, "Tooltip info", "Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
				"HWnd: " & @TAB & $aTool[1] & @CRLF & _
				"ID: " & @TAB & "0x" & Hex($aTool[2]) & @CRLF & _
				"Left X:" & @TAB & $aTool[3] & @CRLF & _
				"Left Y:" & @TAB & $aTool[4] & @CRLF & _
				"Right X:" & @TAB & $aTool[5] & @CRLF & _
				"Right Y:" & @TAB & $aTool[6] & @CRLF & _
				"Instance:" & @TAB & $aTool[7] & @CRLF & _
				"Text:" & @TAB & $aTool[8] & @CRLF & _
				"lParam:" & @TAB & $aTool[9])
	EndIf

EndFunc   ;==>Get_Tool
