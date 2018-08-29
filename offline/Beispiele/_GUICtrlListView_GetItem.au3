#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aItem, $idListView

	GUICreate("ListView: Item ermitteln", 400, 300)

	$idListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUICtrlCreateListViewItem("Zeile 1", $idListView)
	GUICtrlCreateListViewItem("Zeile 2", $idListView)
	GUICtrlCreateListViewItem("Zeile 3", $idListView)

	; Setzt den Text von dem Item 2
	$aItem = _GUICtrlListView_GetItem($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 2 Text: " & $aItem[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
