#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIIcons.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get Title BitMap v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; Create a tooltip control
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; is OK
	; Add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is the ToolTip text", $hButton)

	Local $hIcon = _WinAPI_LoadShell32Icon(15)

	; Set the title of the tooltip
	_GUIToolTip_SetTitle($hToolTip, 'This is the Title Text', $hIcon)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	_MemoMsgBox($MB_SYSTEMMODAL, "Title Bitmap", _GUIToolTip_GetTitleBitMap($hToolTip))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
 				_MemoMsgBox($MB_SYSTEMMODAL, "Title Bitmap", _GUIToolTip_GetTitleBitMap($hToolTip) & @CRLF & $hToolTip)
		EndSwitch
	WEnd

	; Destroy the tooltip control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
