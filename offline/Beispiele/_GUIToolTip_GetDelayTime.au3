#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get/Set DelayTime (v" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton = GUICtrlCreateButton("This is a button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)
	; Create a tooltip control
	Local $hToolTip = _GUIToolTip_Create(0)

;~ 	$hGUI = 0 ; is OK
	; Add a tool to the tooltip control
	_GUIToolTip_AddTool($hToolTip, $hGUI, "This is the ToolTip text", $hButton)

	; set the time for how long the tooltip displays, to 1500 ms ($TTDT_AUTOPOP)
	_GUIToolTip_SetDelayTime($hToolTip, $TTDT_AUTOPOP, 1500)

	GUISetState(@SW_SHOW)

	; Retrieve and display the time that the tooltip displays
	_MemoMsgBox($MB_SYSTEMMODAL, 'Message', 'Display time : ' & _GUIToolTip_GetDelayTime($hToolTip, $TTDT_AUTOPOP) & ' ms')

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)

EndFunc   ;==>Example
