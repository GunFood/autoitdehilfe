#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $a_Order, $idListView

	GUICreate("ListView: Setzt die Spaltenreihenfolge", 400, 300)
	$idListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt die Spaltenreihenfolge
	MsgBox($MB_SYSTEMMODAL, "Information", "Ändert die Spaltenreihenfolge")
	_GUICtrlListView_SetColumnOrder($idListView, "3|2|0|1")

	; Zeigt die Spaltenreihenfolge
	$a_Order = _GUICtrlListView_GetColumnOrderArray($idListView)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Spaltenreihenfolge: [%d, %d, %d, %d]", $a_Order[1], $a_Order[2], $a_Order[3], $a_Order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
