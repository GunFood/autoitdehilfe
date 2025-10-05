#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Adjust Rect Text v(" & @AutoItVersion & ")", 450, 300, 100, 100)

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

	Local $bLarger = True
	$tRect = _GUIToolTip_AdjustRect($hToolTip, $tRect, $bLarger)
	$aRect[0] = DllStructGetData($tRect, "Left")
	$aRect[1] = DllStructGetData($tRect, "Top")
	$aRect[2] = DllStructGetData($tRect, "Right")
	$aRect[3] = DllStructGetData($tRect, "Bottom")
	_MemoMsgBox($MB_SYSTEMMODAL, 'Adjust Rect (' & $bLarger & ') = ', _
			"Left = " & $aRect[0] & @CRLF & _
			"Top = " & $aRect[1] & @CRLF & _
			"Right = " & $aRect[2] & @CRLF & _
			"Bottom = " & $aRect[3])

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hToolTip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
