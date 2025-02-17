#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt den anwendungsspezifischen Wert eines Items (v" & @AutoItVersion & ")", 700, 300)
	Local $idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 0")
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")

	; Setzt den Parameter von Item 1
	_GUICtrlListView_SetItemParam($idListView, 1, 1234)
	; Ermittelt den Parameter von Item 2 und zeigt ihn an
	MsgBox(8256, "Information", "Parameter von Item 1: " & _GUICtrlListView_GetItemParam($idListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
