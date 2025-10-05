#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip New ToolRect v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; create a tooltip control using default settings
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is the ToolTip text", $hButton)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(60, 42, 0)
	Sleep(250)

	; Retrieve the text of the tool
	Local $tRect = DllStructCreate($tagRECT)
	Local $aRect[4] = [100, 100, 240, 140]
	DllStructSetData($tRect, "Left", $aRect[0])
	DllStructSetData($tRect, "Top", $aRect[1])
	DllStructSetData($tRect, "Right", $aRect[2])
	DllStructSetData($tRect, "Bottom", $aRect[3])
	_GUIToolTip_NewToolRect($hToolTip, $hGUI, $hButton, $aRect[0], $aRect[1], $aRect[2], $aRect[3])

	Local $aTool = _GUIToolTip_GetToolInfo($hToolTip, $hGUI, $hButton)
	_MemoMsgBox($MB_SYSTEMMODAL, 'New ToolRect = ', _
			"Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
			"HWnd: " & @TAB & "0x" & Hex($aTool[1]) & @CRLF & _
			"ID: " & @TAB & "0x" & Hex($aTool[2]) & @CRLF & _
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
	_MemoResetHandleInProcess($hToolTip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
