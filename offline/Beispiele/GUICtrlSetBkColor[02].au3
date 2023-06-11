#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit einem Listview.
	Local $hGUI = GUICreate("Farbige ListView Items", 250, 170, 100, 200, -1)
	Local $idListview = GUICtrlCreateListView("col1|col2|col3", 10, 10, 230, 150)

	; Wechselt zwischen der Hintergrundfarbe des Listview und der Hintergrundfarbe des Listviewelements.
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_LV_ALTERNATE)

	; Setzt die Hintergrundfarbe für das Listview.
	; Ungerade Listviewelemente werden mit der Hintergrundfarbe des Listview angezeigt,
	; gerade mit der Hintergrundfarbe des Listviewelements.
	GUICtrlSetBkColor(-1, $COLOR_AQUA)

	; Erstellt Listviewelemente und setzt die Hintergrundfarbe für jedes.
	GUICtrlCreateListViewItem("item1|col12|col13", $idListview)

	; Die folgende Zeile könnte gelöscht werden, da hier die Hintergrundfarbe vom Listview verwendet wird.
	GUICtrlSetBkColor(-1, $COLOR_GREEN)
	GUICtrlCreateListViewItem("item2|col22|col23", $idListview)
	GUICtrlSetBkColor(-1, $COLOR_GREEN)
	GUICtrlCreateListViewItem("item3|col32|col33", $idListview)

	; Die folgende Zeile könnte gelöscht werden, da hier die Hintergrundfarbe vom Listview verwendet wird.
	GUICtrlSetBkColor(-1, $COLOR_GREEN)

	; Wechselt die Farbe eines einzelnen Listviewelements.
	GUICtrlCreateListViewItem("Now|change|color", $idListview)
	GUICtrlSetBkColor(-1, $COLOR_LIME)
	GUICtrlCreateListViewItem("item5|col52|col53", $idListview)

	; Die folgende Zeile könnte gelöscht werden, da hier die Hintergrundfarbe vom Listview verwendet wird.
	GUICtrlSetBkColor(-1, $COLOR_GREEN)
	GUICtrlCreateListViewItem("item6|col62|col63", $idListview)
	GUICtrlSetBkColor(-1, $COLOR_GREEN)
	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Steuerelemente
	GUIDelete($hGUI)
EndFunc   ;==>Example
