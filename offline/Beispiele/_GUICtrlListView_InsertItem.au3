#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Item einfügen", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte einfügen
	_GUICtrlListView_InsertColumn($idListView, 0, "Spalte 1", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_InsertItem($idListView, "Item 1", 0)
	_GUICtrlListView_InsertItem($idListView, "Item 2", 1)
	_GUICtrlListView_InsertItem($idListView, "Item 3", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
