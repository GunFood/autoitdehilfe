#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example1()

Func Example1()
	GUICreate("ListView: Löscht alle Items", 400, 500)
	Local $idListView = GUICtrlCreateListView("Spalte 1               |Spalte 2      |Spalte 3      ", 10, 10, 380, 480, $LVS_SHOWSELALWAYS)

	; Zeigt die GUI
	GUISetState(@SW_SHOW)

	; 3 Spalten laden
	For $iI = 0 To 9
		GUICtrlCreateListViewItem("Item " & $iI & "|Item " & $iI & "-1|Item " & $iI & "-2", $idListView)
	Next

	For $i = 10 To 20
		_GUICtrlListView_AddItem($idListView, "UDF Item " & $i, -1, 1000 + $i)
		_GUICtrlListView_AddSubItem($idListView, $i, "Item " & $i & "-1", 1)
		_GUICtrlListView_AddSubItem($idListView, $i, "Item " & $i & "-2", 2)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Löscht alle Items")

	; Verwendet die ControlID des erstellten ListViews
	_GUICtrlListView_DeleteAllItems($idListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Löscht die obige GUI und alle Controls
	GUIDelete()
EndFunc   ;==>Example1
