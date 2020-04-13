#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Setzt den Itemtext", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Setzt Item 2 Text
	_GUICtrlListView_SetItemText($idListView, 1, "Neues Item 2")
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 Text: " & _GUICtrlListView_GetItemText($idListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
