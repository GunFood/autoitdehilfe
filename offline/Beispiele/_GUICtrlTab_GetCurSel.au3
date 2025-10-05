#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt den aktuell ausgewählten Tab (v" & @AutoItVersion & ")", 600, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt den aktuell ausgewählten Tab
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Setzt die aktuellen Auswahl: #1")
	_GUICtrlTab_SetCurSel($idTab, 1)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Aktuell ausgewählter Tab: " & _GUICtrlTab_GetCurSel($idTab))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
