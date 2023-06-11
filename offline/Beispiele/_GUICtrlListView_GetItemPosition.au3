#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Ermittelt die Itemposition (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)


	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 0")
	_GUICtrlListView_AddItem($idListview, "Item 1")
	_GUICtrlListView_AddItem($idListview, "Item 2")

	; Ermittelt die Position von Item 2
	Local $aPos = _GUICtrlListView_GetItemPosition($idListview, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item 1 Position : [%d, %d]", $aPos[0], $aPos[1]))

	; Setzt die Iconansicht
	_GUICtrlListView_SetView($idListview, 3)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 verschieben")
	_GUICtrlListView_SetItemPosition($idListview, 1, 100, 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
