#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIIcons.au3>

Global $g_hToolTip, $g_aPos, $g_hButton

; Press g to display the current tooltip information.
HotKeySet("g", "GetInfo")

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Hit Test v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	$g_hToolTip = _GUIToolTip_Create(0, $TTS_CLOSE + $TTS_BALLOON)
	_MemoSetHandleInProcess($g_hToolTip)

	Local $idButton = GUICtrlCreateButton("Button ToolTip", 30, 32, 130, 28)
	$g_hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	_GUIToolTip_AddTool($g_hToolTip, $hGUI, "X: " & @TAB & " Y: " & @TAB, $g_hButton)

	Local $hIcon = _WinAPI_LoadShell32Icon(15)

	_GUIToolTip_SetTitle($g_hToolTip, 'Title', $hIcon)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	$g_aPos = MouseGetPos()
	_GUIToolTip_TrackPosition($g_hToolTip, $g_aPos[0] + 10, $g_aPos[1] + 20)
	_GUIToolTip_TrackActivate($g_hToolTip, True, $hGUI, $g_hButton)
	_GUIToolTip_UpdateTipText($g_hToolTip, $hGUI, $g_hButton, "X: " & $g_aPos[0] & " Y: " & $g_aPos[1])

	GetInfo()

	While 1
		Sleep(100)
		$g_aPos = MouseGetPos()
		_GUIToolTip_TrackPosition($g_hToolTip, $g_aPos[0] + 10, $g_aPos[1] + 20)
		_GUIToolTip_UpdateTipText($g_hToolTip, $hGUI, $g_hButton, "X: " & $g_aPos[0] & " Y: " & $g_aPos[1])
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	_MemoResetHandleInProcess($g_hToolTip)
	_GUIToolTip_Destroy($g_hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example

Func GetInfo()
	Local $aTool = _GUIToolTip_HitTest($g_hToolTip, $g_hButton, $g_aPos[0], $g_aPos[1])
	_MemoMsgBox($MB_SYSTEMMODAL, "Tooltip info", "Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
			"HWnd: " & @TAB & $aTool[1] & @CRLF & _
			"ID: " & @TAB & "0x" & $aTool[2] & @CRLF & _
			"Left X:" & @TAB & $aTool[3] & @CRLF & _
			"Left Y:" & @TAB & $aTool[4] & @CRLF & _
			"Right X:" & @TAB & $aTool[5] & @CRLF & _
			"Right Y:" & @TAB & $aTool[6] & @CRLF & _
			"Instance:" & @TAB & $aTool[7] & @CRLF & _
			"Text:" & @TAB & $aTool[8] & @CRLF & _
			"lParam:" & @TAB & $aTool[9])
EndFunc   ;==>GetInfo
