#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local Local $hGUI = GUICreate("Tab: Setzt und ermittelt den aktuellen Fokus (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266)
	_MemoMsgBoxStatus() ; Status-Erstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt den aktuellen Fokus, ermittelt den Text des Tab-Items
	_Memo_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Setzt den aktuellen Fokus: #1")
	_GUICtrlTab_SetCurFocus($idTab, 1)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Ermittelt den aktuellen Fokus: " & _GUICtrlTab_GetCurFocus($idTab))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
