#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Wählt alles ab", 400, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3")

	; Wählt das zweite Tab Item aus
	_GUICtrlTab_SetCurSel($idTab, 1)

	; Setzt die Tab Auswahl zurück
	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt die Tab Auswahl zurück")
	_GUICtrlTab_DeselectAll($idTab, False)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
