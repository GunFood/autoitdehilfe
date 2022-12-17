#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt den Foucs des Item und ermittelt, ob das Item den Fokus besitzt (v" & @AutoItVersion & ")", 700, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 0", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 0: Spalte 0", 0)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 0: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 0: Spalte 2", 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 0", 1)
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 1: Spalte 1", 1)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 0", 2)

	; Item 1 erhält den Fokus
	_GUICtrlListView_SetItemFocused($idListview, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 hat den Fokus: " & _GUICtrlListView_GetItemFocused($idListview, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
