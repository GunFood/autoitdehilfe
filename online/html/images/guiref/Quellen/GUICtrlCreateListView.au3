#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Example()

Func Example()
	Local $listview, $button, $item1, $item2, $item3, $input1, $msg

	GUICreate("Listview Eintr&auml;ge", 220, 250, 100, 200, -1, $WS_EX_ACCEPTFILES)

	$listview = GUICtrlCreateListView("Spalte1  |Spalte2|Spalte3", 10, 10, 200, 70)
	$button = GUICtrlCreateButton("Wert?", 75, 170, 70, 20)
	$item1 = GUICtrlCreateListViewItem("Eintrag2|Spalte22|Spalte23", $listview)
	$item2 = GUICtrlCreateListViewItem("Eintrag1|Spalte12|Spalte13", $listview)
	$item3 = GUICtrlCreateListViewItem("Eintrag3|Spalte32|Spalte33", $listview)
	$input1 = GUICtrlCreateInput("", 20, 200, 150)
	GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; Erlaubt drag&drop
	GUISetState()
	GUICtrlSetData($item2, "EINTRAG1")
	GUICtrlSetData($item3, "||SPALTE33")
	GUICtrlDelete($item1)

	Do
		$msg = GUIGetMsg()

		Select
			Case $msg = $button
				MsgBox(0, "Listview Eintr&auml;ge", GUICtrlRead(GUICtrlRead($listview)), 2)
			Case $msg = $listview
				MsgBox(0, "Listview", "angeklickt=" & GUICtrlGetState($listview), 2)
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
