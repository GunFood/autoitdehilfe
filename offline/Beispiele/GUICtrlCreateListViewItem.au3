#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("Listview Einträge", 220, 250, 100, 200, -1, $WS_EX_ACCEPTFILES)
	GUISetBkColor(0x00E0FFFF) ; Ändert die Hintergrundfarbe

	Local $idListview = GUICtrlCreateListView("Spalte1  |Spalte2|Spalte3", 10, 10, 200, 150) ;,$LVS_SORTDESCENDING)
	Local $idButton = GUICtrlCreateButton("Wert?", 75, 170, 70, 20)
	Local $idItem1 = GUICtrlCreateListViewItem("Eintrag2|Spalte22|Spalte23", $idListview)
	Local $idItem2 = GUICtrlCreateListViewItem("Eintrag1|Spalte12|Spalte13", $idListview)
	Local $idItem3 = GUICtrlCreateListViewItem("Eintrag3|Spalte32|Spalte33", $idListview)
	GUICtrlCreateInput("", 20, 200, 150)
	GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; Erlaubt drag&drop
	GUISetState(@SW_SHOW)
	GUICtrlSetData($idItem2, "EINTRAG1")
	GUICtrlSetData($idItem3, "||SPALTE33")
	GUICtrlDelete($idItem1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idButton
				MsgBox($MB_SYSTEMMODAL, "Listview Einträge", GUICtrlRead(GUICtrlRead($idListview)), 2)
			Case $idListview
				MsgBox($MB_SYSTEMMODAL, "Listview", "angeklickt=" & GUICtrlGetState($idListview), 2)
		EndSwitch
	WEnd
EndFunc   ;==>Example
