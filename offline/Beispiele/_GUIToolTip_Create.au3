#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Create - v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	Local $idButton_Add = GUICtrlCreateButton("Add", 30, 32, 75, 25)
	Local $hButton_Add = GUICtrlGetHandle($idButton_Add)

	Local $idButton_Clear = GUICtrlCreateButton("Clear", 30, 72, 75, 25)
	Local $hButton_Clear = GUICtrlGetHandle($idButton_Clear)

	Local $idLst_Mylist = GUICtrlCreateList("Item 1", 120, 32, 121, 97)
	Local $hMylist = GUICtrlGetHandle($idLst_Mylist)

	Local $idButton_Close = GUICtrlCreateButton("Exit button", 80, 150, 110, 28)
	Local $hButton_Close = GUICtrlGetHandle($idButton_Close)

	; Create 2 tooltip controls
	Local $hToolTip1 = _GUIToolTip_Create(0, BitOR($_TT_ghTTDefaultStyle, $TTS_BALLOON)) ; balloon style tooltip
	Local $hToolTip2 = _GUIToolTip_Create(0) ; default style tooltip
	_GUIToolTip_SetMaxTipWidth($hToolTip2, 100) ; this allows multiline tooltips to be used with $hToolTip2

;~ 	$hGUI = 0 ; is OK
	; add tools to the tooltip controls
	_GUIToolTip_AddTool($hToolTip1, $hGUI, "Adds an item to the list", $hButton_Add)
	_GUIToolTip_AddTool($hToolTip1, $hGUI, "Exit the script", $hButton_Close)
	_GUIToolTip_AddTool($hToolTip1, $hGUI, "The listbox", $hMylist)
	_GUIToolTip_AddTool($hToolTip2, $hGUI, "Clears the list", $hButton_Clear)
	_GUIToolTip_AddTool($hToolTip2, $hGUI, "Multiline tooltip" & @CRLF & "for the GUI", $hGUI) ; Multiline ToolTip

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idButton_Add
				GUICtrlSetData($idLst_Mylist, 'The Add button was pressed"|')
			Case $idButton_Clear
				GUICtrlSetData($idLst_Mylist, '')
			Case $idButton_Close, $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Destroy the tooltip controls
	_GUIToolTip_Destroy($hToolTip1)
	_GUIToolTip_Destroy($hToolTip2)
	GUIDelete($hGUI)
EndFunc   ;==>Example
