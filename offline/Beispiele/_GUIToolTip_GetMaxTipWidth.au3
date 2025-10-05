#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get/Set Max TipWidth (v" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton("Button ToolTip", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

	; Create a ToolTip control
	Local $hToolTip = _GUIToolTip_Create(0)
	; Set the maximum width to 400 pixels
	_GUIToolTip_SetMaxTipWidth($hToolTip, 400)

;~ 	$hGUI = 0 ; is OK
	; Add a multi-line tool to the ToolTip control using @CRLF to break the text into 2 lines
	_GUIToolTip_AddTool($hToolTip, $hGUI, 'If the text exceeds the width, then it carries over to the next line.' & @CRLF & 'Also allows you to use @CRLF', $hButton)
	; Add a multi-line tool to the ToolTip control using the MaxTipWidth setting to break the text into 2 lines.
	_GUIToolTip_AddTool($hToolTip, $hGUI, 'If the text exceeds the width, then it carries over to the next line. Also allows you to use @CRLF', $hGUI)

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Destroy the ToolTip control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
