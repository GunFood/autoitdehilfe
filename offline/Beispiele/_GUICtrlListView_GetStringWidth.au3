#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt die Breite eines Strings", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Ermittelt die Breite eines Strings
	MsgBox($MB_SYSTEMMODAL, "Information", 'Breite eines Strings": ' & _GUICtrlListView_GetStringWidth($idListView, "Test"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
