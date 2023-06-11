#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView markierte Items löschen", 400, 500)
	Local $idListView = GUICtrlCreateListView("Spalte 1               |Spalte 2      |Spalte 3      ", 10, 10, 380, 480, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($idListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState(@SW_SHOW)

	For $i = 0 To 9
        GUICtrlCreateListViewItem("Native Item " & $i & "|Item " & $i & "-1|Item " & $i & "-2", $idListView)
    Next
    For $i = 10 To 20
        _GUICtrlListView_AddItem($idListView, "UDF Item " & $i, -1, 1000 + $i)
        _GUICtrlListView_AddSubItem($idListView, $i, "Item " & $i & "-1", 1)
        _GUICtrlListView_AddSubItem($idListView, $i, "Item " & $i & "-2", 2)
    Next

	MsgBox($MB_SYSTEMMODAL, "Ausgewählt", "Eines oder mehrere Items auswählen" & @CRLF & "Dann 'OK' drücken")

	; Übergibt die Control-ID eines nativ erstellten ListViews um beide nativ- und UDF-erstellten Items zu löschen
	_GUICtrlListView_DeleteItemsSelected($idListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete()
EndFunc   ;==>Example
