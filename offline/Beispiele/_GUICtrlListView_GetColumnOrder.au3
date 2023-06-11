#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt die Spaltenreihenfolge (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("Column 0|Column 1|Column 2|Column 3", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Setzt die Spaltenreihenfolge
	MsgBox($MB_SYSTEMMODAL, "Information", "Änderung der Spaltenreihenfolge")

	_GUICtrlListView_SetColumnOrder($idListview, "3|2|0|1")

	; Ermittelt die Spaltenreihenfolge
	Local $a_Order = _GUICtrlListView_GetColumnOrderArray($idListview)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Spaltenreihenfolge: [%d, %d, %d, %d]", $a_Order[1], $a_Order[2], $a_Order[3], $a_Order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
