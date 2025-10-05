#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Ermittelt das hervorgehobene Item", 400, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266, $TCS_BUTTONS)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Tab 1 hervorheben")
	; Tab 1 hervorheben
	_GUICtrlTab_HighlightItem($idTab, 1)

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
