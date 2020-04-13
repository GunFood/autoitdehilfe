#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $a_Order, $idListView

	GUICreate("ListView: Reihenfolge der Spalten ermitteln", 400, 300)
	$idListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($idListView, $LVS_EX_HEADERDRAGDROP)
	_GUICtrlListView_SetColumnWidth($idListView, 0, 100)
	_GUICtrlListView_SetColumnWidth($idListView, 1, 100)
	_GUICtrlListView_SetColumnWidth($idListView, 2, 100)
	_GUICtrlListView_SetColumnWidth($idListView, 3, 100)
	GUISetState(@SW_SHOW)

	_GUICtrlListView_SetColumnOrder($idListView, "3|2|0|1")

	$a_Order = StringSplit(_GUICtrlListView_GetColumnOrder($idListView), "|")
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Reihenfolge der Spalten: [%d, %d, %d, %d]", $a_Order[1], $a_Order[2], $a_Order[3], $a_Order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
