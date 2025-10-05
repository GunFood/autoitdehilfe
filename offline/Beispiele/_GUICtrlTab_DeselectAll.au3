#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <TabConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Wählt alles ab - v(" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266, $TCS_BUTTONS)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Wählt das zweite Tab Item aus
	_GUICtrlTab_SetCurSel($idTab, 1)

	; Setzt die Tab Auswahl zurück
	_Memo_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Setzt die Tab Auswahl zurück")
	_GUICtrlTab_DeselectAll($idTab, False)

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
