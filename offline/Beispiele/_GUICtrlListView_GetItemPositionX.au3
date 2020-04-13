#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iX, $iY, $idListView

	GUICreate("ListView: Ermittelt die Itemposition X", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Ermittelt die Position für Item 2
	$iX = _GUICtrlListView_GetItemPositionX($idListView, 1)
	$iY = _GUICtrlListView_GetItemPositionY($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Position für Item 2 : [%d, %d]", $iX, $iY))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
