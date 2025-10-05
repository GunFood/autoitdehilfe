#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Ermittelt die Anzahl von Item", 400, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Zeigt die Anzahl der Tabs
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Anzahl der Tabs: " & _GUICtrlTab_GetItemCount($idTab))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.= $GUI_EVENT_CLOSE
EndFunc   ;==>Example
