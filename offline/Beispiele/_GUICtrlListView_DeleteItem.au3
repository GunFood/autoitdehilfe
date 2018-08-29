#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView Item Deletion", 400, 500)
    Local $idListView = GUICtrlCreateListView("Spalte 1               |Spalte 2      |Spalte 3      ", 10, 10, 380, 480, $LVS_SHOWSELALWAYS)
    GUISetState(@SW_SHOW)

    For $i = 0 To 9
        GUICtrlCreateListViewItem("Native Item " & $i & "|Item " & $i & "-1|Item " & $i & "-2", $idListView)
    Next
    For $i = 10 To 20
        _GUICtrlListView_AddItem($idListView, "UDF Item " & $i, -1, 1000 + $i)
        _GUICtrlListView_AddSubItem($idListView, $i, "Item " & $i & "-1", 1)
        _GUICtrlListView_AddSubItem($idListView, $i, "Item " & $i & "-2", 2)
    Next

	; Übergibt die Control-ID eines nativ erstellten ListViews um beide nativ- und UDF-erstellten Items zu löschen
	MsgBox($MB_SYSTEMMODAL, "Item löschen", "Löschen von UDF erstelltem Item 12")
	_GUICtrlListView_DeleteItem($idListView, 12)

	MsgBox($MB_SYSTEMMODAL, "Einzeln", "Löschen von nativ erstelltem Item 5")
    _GUICtrlListView_DeleteItem($idListView, 5)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete()
EndFunc   ;==>Example
