#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt die Spaltenbreite (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("Column 0|Column 1|Column 2", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlListView_SetColumnWidth($idListview, 0, 100)

	; Ändert die Breite von Spalte 0
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 0 Breite: " & _GUICtrlListView_GetColumnWidth($idListview, 0))
	_GUICtrlListView_SetColumnWidth($idListview, 0, 150)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 0 Breite: " & _GUICtrlListView_GetColumnWidth($idListview, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
