#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Sicherstellen, dass ein Item sichtbar ist", 400, 300)
	$idListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	_GUICtrlListView_SetColumnWidth($idListView, 0, 100)
	_GUICtrlListView_SetExtendedListViewStyle($idListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState(@SW_SHOW)

	_GUICtrlListView_BeginUpdate($idListView)
	For $i = 1 To 100
		GUICtrlCreateListViewItem("Item " & $i, $idListView)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Es wird Item 50 sichtbar gemacht")
	_GUICtrlListView_EnsureVisible($idListView, 49)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
