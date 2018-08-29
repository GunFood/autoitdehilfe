#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iStylesEx = BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES), $idListView

	GUICreate("ListView: Setzt das 'hot' Item", 400, 300)

	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	$idListView = GUICtrlGetHandle($idListView)
	_GUICtrlListView_SetExtendedListViewStyle($idListView, $iStylesEx)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 3", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Zeile 1: Spalte 1")
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($idListView, "Zeile 2: Spalte 1")
	_GUICtrlListView_AddSubItem($idListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($idListView, "Zeile 3: Spalte 1")

	; Setzt das 'hot' Item
	_GUICtrlListView_SetHotItem($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Hot Item: " & _GUICtrlListView_GetHotItem($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
