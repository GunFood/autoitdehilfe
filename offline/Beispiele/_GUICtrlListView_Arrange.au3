#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Anordnen", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_InsertColumn($idListView, 0, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	; Bewegt Item 2
	_GUICtrlListView_SetView($idListView, 3)
	_GUICtrlListView_SetItemPosition($idListView, 1, 100, 100)

	MsgBox($MB_SYSTEMMODAL, "Information", "Items anordnen")
	_GUICtrlListView_Arrange($idListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
