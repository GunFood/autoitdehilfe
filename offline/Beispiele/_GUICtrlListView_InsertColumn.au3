#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Spalte einfügen", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalten einfügen
	_GUICtrlListView_InsertColumn($idListView, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($idListView, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($idListView, 2, "Spalte 3", 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
