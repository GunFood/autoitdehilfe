#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Ermittelt die Spaltenreihenfolge (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("Spalte 0|Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	Local $a_Order[5] = [4, 3, 2, 0, 1]
	; Setzt die Spaltenreihenfolge
	MsgBox($MB_SYSTEMMODAL, "Information", "Änderung der Spaltenreihenfolge")

	_GUICtrlListView_SetColumnOrderArray($idListview, $a_Order)

	; Ermittelt die Spaltenreihenfolge
	$a_Order = _GUICtrlListView_GetColumnOrderArray($idListview)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Spaltenreihenfolge: [%d, %d, %d, %d]", $a_Order[1], $a_Order[2], $a_Order[3], $a_Order[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
