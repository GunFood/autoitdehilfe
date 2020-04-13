#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Setzt die Spaltenbreite", 400, 300)
	$idListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Ändert die Breite von Spalte 1
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Breite: " & _GUICtrlListView_GetColumnWidth($idListView, 0))
	_GUICtrlListView_SetColumnWidth($idListView, 0, 150)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Breite: " & _GUICtrlListView_GetColumnWidth($idListView, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
