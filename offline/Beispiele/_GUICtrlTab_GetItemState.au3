#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt den Itemstatus (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266, $TCS_BUTTONS)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt den Status von Tab 1
	_GUICtrlTab_SetItemState($idTab, 1, $TCIS_BUTTONPRESSED)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Tab 1 Status: " & _ExplainItemState(_GUICtrlTab_GetItemState($idTab, 1)))

	; Ermittelt/Setzt den Status von Tab 2
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Tab 2 Status: " & _ExplainItemState(_GUICtrlTab_GetItemState($idTab, 2)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example

Func _ExplainItemState($iState)
	Local $sText = ""
	If $iState = 0 Then $sText &= "Es ist kein Status für dieses Item gesetzt" & @CRLF
	If BitAND($iState, $TCIS_BUTTONPRESSED) Then $sText &= "Button gedrückt" & @CRLF
	If BitAND($iState, $TCIS_HIGHLIGHTED) Then $sText &= "Button hervorgehoben"
	Return $sText
EndFunc   ;==>_ExplainItemState
