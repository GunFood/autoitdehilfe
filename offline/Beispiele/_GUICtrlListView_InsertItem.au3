#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	GUICreate("ListView: Item einfügen (v" & @AutoItVersion & ")", 400, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Spalte einfügen
	_GUICtrlListView_InsertColumn($idListview, 0, "Spalte 1", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_InsertItem($idListview, "Item 1", 0)
	_GUICtrlListView_InsertItem($idListview, "Item 2", 1)
	_GUICtrlListView_InsertItem($idListview, "Item 3", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
