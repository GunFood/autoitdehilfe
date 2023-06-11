#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iX, $iY, $idListView

	GUICreate("ListView: Ermittelt den horizontalen Abstand zwischen den Items", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Zeigt den Abstand zwischen den Items
	$iX = _GUICtrlListView_GetItemSpacingX($idListView)
	$iY = _GUICtrlListView_GetItemSpacingY($idListView)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Abstand zwischen den Items: X=%d, Y=%d", $iX, $iY))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
