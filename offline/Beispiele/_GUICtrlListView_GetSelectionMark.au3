#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt die Markierung (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 0", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 0")
	_GUICtrlListView_AddItem($idListview, "Item 1")
	_GUICtrlListView_AddItem($idListview, "Item 2")

	; Wählt mehrere Items aus
	_GUICtrlListView_SetSelectionMark($idListview, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Markierung: " & _GUICtrlListView_GetSelectionMark($idListview))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
