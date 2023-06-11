#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt die Indizes der markierten Items", 500, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 0")
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")

	; Wählt mehrere Items aus
	_GUICtrlListView_SetItemSelected($idListView, 0)
	_GUICtrlListView_SetItemSelected($idListView, 2)
	MsgBox($MB_SYSTEMMODAL, "Information", "Indizes der markierten Items: " & _GUICtrlListView_GetSelectedIndices($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
