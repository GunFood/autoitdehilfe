#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aItem, $idTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt den Parameter des Items", 420, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3")

	; Ermittelt/Setzt den Parameter des Tab 1
	_GUICtrlTab_SetItem($idTab, 0, -1, -1, -1, 1234)
	$aItem = _GUICtrlTab_GetItem($idTab, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Tab 1 Parameter: " & $aItem[3])

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
