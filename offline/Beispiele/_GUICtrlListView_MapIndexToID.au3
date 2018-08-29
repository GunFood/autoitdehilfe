#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iID, $idListView

	GUICreate("ListView: Bildet die ID eines Items als Index ab", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte hinzufügen
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Zeigt die ID für Item 2
	$iID = _GUICtrlListView_MapIndexToID($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Index zu ID: " & $iID)
	MsgBox($MB_SYSTEMMODAL, "Information", "ID zu Index: " & _GUICtrlListView_MapIDToIndex($idListView, $iID))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
