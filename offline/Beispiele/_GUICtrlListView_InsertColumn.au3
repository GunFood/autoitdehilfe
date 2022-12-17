#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	GUICreate("ListView: Spalte einfügen (v" & @AutoItVersion & ")", 400, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Spalten einfügen
	_GUICtrlListView_InsertColumn($idListview, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($idListview, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($idListview, 2, "Spalte 3", 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
