#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt den Index des obersten sichtbaren Items", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListView)
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	; Wählt Item 50 aus
	_GUICtrlListView_SetItemSelected($idListView, 49)
	_GUICtrlListView_EnsureVisible($idListView, 49)
	MsgBox($MB_SYSTEMMODAL, "Information", "obersten sichtbarer Index: " & _GUICtrlListView_GetTopIndex($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
