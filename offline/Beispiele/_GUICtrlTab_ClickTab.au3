#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

Example()

Func Example()
	Local $idTab

	; GUI erstellen
	GUICreate("Tab-Control: Tab anklicken", 400, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Tabs hinzufügen
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3")

	; Maus zu Tab 2 bewegen und dort 1 mal klicken
	_GUICtrlTab_ClickTab($idTab, 1, "left", True, 1, 100)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
