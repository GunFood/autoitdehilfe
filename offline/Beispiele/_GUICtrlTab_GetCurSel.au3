#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt und ermittelt den aktuell ausgewählten Tab (v" & @AutoItVersion & ")", 600, 300)
	Local $idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt den aktuell ausgewählten Tab
	_GUICtrlTab_SetCurSel($idTab, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Aktuell ausgewählter Tab: " & _GUICtrlTab_GetCurSel($idTab))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
