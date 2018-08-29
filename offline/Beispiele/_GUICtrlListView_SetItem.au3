#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Item setzen", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	GUICtrlCreateListViewItem("Item 1", $idListView)
	GUICtrlCreateListViewItem("Item 2", $idListView)
	GUICtrlCreateListViewItem("Item 3", $idListView)

	; Item 2 ändern
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 ändern")
	_GUICtrlListView_SetItem($idListView, "Neues Item 2", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
