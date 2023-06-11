#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Setzt und ermittelt, ob das Item dargestellt wird, als wäre es in einer Ausschneide Operation", 700, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 0", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Zeile 0: Spalte 0", 0)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 0: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 0: Spalte 2", 2)
	_GUICtrlListView_AddItem($idListView, "Zeile 1: Spalte 0", 1)
	_GUICtrlListView_AddSubItem($idListView, 1, "Zeile 1: Spalte 1", 1)
	_GUICtrlListView_AddItem($idListView, "Zeile 2: Spalte 0", 2)

	; Item 1 ausschneiden
	_GUICtrlListView_SetItemCut($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 ausschneiden: " & _GUICtrlListView_GetItemCut($idListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
