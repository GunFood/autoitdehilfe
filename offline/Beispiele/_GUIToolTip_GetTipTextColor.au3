#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>
#include <WinAPITheme.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get/Set Tip TextColor (v" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idBtn_Add = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hAdd = GUICtrlGetHandle($idBtn_Add)

	; Create a tooltip control
	Local $hToolTip = _GUIToolTip_Create(0, $TTS_BALLOON)
	_WinAPI_SetWindowTheme($hToolTip, "", "")

	; Change the color settings for the tooltip
	; The color value used in the _GUIToolTip_SetTipBkColor function is a COLORREF (BGR) value
	_GUIToolTip_SetTipBkColor($hToolTip, 0x395A00)
	; The color value used in the _GUIToolTip_SetTipTextColor function is a COLORREF (BGR) value
	_GUIToolTip_SetTipTextColor($hToolTip, 0x1EBFFF)

;~ 	$hGUI = 0 ; is OK
	; Add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is the ToolTip text", $hAdd)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	; Retrieve the text color of the tooltip.
	_MemoMsgBox($MB_SYSTEMMODAL, 'Message', 'Text color : 0x' & Hex(_GUIToolTip_GetTipTextColor($hToolTip), 6))

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the tooltip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
