; == Beispiel 2: _GUICtrlListView_SetItemText() mit $iSubItem = - 1

#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListview
	GUICreate("ListView Elementtext setzen", 400, 300)
	$idListview = GUICtrlCreateListView("Item        |subitem        |subitem        ", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt Zeile 0 hinzu
	GUICtrlCreateListViewItem("Item 0|SubItem1|SubItem2", $idListview)
	MsgBox($MB_TOPMOST, "", "Bevor der gesamte Text auf einmal geändert wird")

	; Ändert den ganzen Text auf einmal in Zeile 0
	_GUICtrlListView_SetItemText($idListview, 0, "Item 0_alt|SubItem1_alt|SubItem2_alt", -1)
	MsgBox($MB_TOPMOST, "Parameter $iSubItem = - 1", "Der gesamte Text wurde auf einmal geändert.")

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
