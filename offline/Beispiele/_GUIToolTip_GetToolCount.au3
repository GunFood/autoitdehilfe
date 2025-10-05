#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get ToolCount - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idBtn_Add = GUICtrlCreateButton("Get Count 1", 30, 32, 75, 25)
	Local $hAdd = GUICtrlGetHandle($idBtn_Add)
	Local $idButton_Clear = GUICtrlCreateButton("Get Count 2", 30, 72, 75, 25)
	Local $hButton_Clear = GUICtrlGetHandle($idButton_Clear)
	Local $idLst_Mylist = GUICtrlCreateList("Item 1", 120, 32, 121, 97)
	Local $hMylist = GUICtrlGetHandle($idLst_Mylist)
	Local $idButton_Close = GUICtrlCreateButton("Exit button", 80, 150, 110, 28)
	Local $hButton_Close = GUICtrlGetHandle($idButton_Close)

	; Create 2 tooltip controls
	Local $hToolTip1 = _GUIToolTip_Create(0, BitOR($_TT_ghTTDefaultStyle, $TTS_BALLOON)); balloon style tooltip
	Local $hToolTip2 = _GUIToolTip_Create(0) ; default style tooltip
	_GUIToolTip_SetMaxTipWidth($hToolTip2, 100) ; this allows multiline tooltips to be used with $hToolTip2

;~ 	$hGUI = 0 ; is OK
	; add tools to the tooltip controls
	; 3 tools for $hToolTip1
	_GUIToolTip_AddTool($hToolTip1, $hGUI, "Click to display the # of tools assigned to $hToolTip1", $hAdd)
	_GUIToolTip_AddTool($hToolTip1, $hGUI, "Exit the script", $hButton_Close)
	_GUIToolTip_AddTool($hToolTip1, $hGUI, "The listbox", $hMylist)
	; 2 tools for $hToolTip2
	_GUIToolTip_AddTool($hToolTip2, $hGUI, "Click to display the # of tools assigned to $hToolTip2", $hButton_Clear)
	_GUIToolTip_AddTool($hToolTip2, $hGUI, "Multiline tooltip" & @CRLF & "for the GUI", $hGUI) ; Multiline ToolTip

	GUISetState(@SW_SHOW)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Add
				_MemoMsgBox($MB_SYSTEMMODAL, "Tool count", "Number of tools:" & @TAB & _GUIToolTip_GetToolCount($hToolTip1))
			Case $idButton_Clear
				_MemoMsgBox($MB_SYSTEMMODAL, "Tool count", "Number of tools:" & @TAB & _GUIToolTip_GetToolCount($hToolTip2))
			Case $idButton_Close, $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Destroy the tooltip controls
	_GUIToolTip_Destroy($hToolTip1)
	_GUIToolTip_Destroy($hToolTip2)
	GUIDelete($hGUI)
EndFunc   ;==>Example
