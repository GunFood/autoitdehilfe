#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aItem, $idListView

	GUICreate("ListView: Setzt und ermittelt das Item (v" & @AutoItVersion & ")", 500, 300)

	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	GUICtrlCreateListViewItem("Zeile 0", $idListView)
	GUICtrlCreateListViewItem("Zeile 1", $idListView)
	GUICtrlCreateListViewItem("Zeile 2", $idListView)

	; Setzt den Text von dem Item 1
	$aItem = _GUICtrlListView_GetItem($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 Text: " & $aItem[3])

	; Ändert Item 1
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 wird geändert")
	_GUICtrlListView_SetItem($idListView, "Neues Item 1", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
