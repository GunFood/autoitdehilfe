#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Setzt und ermittelt die Anzahl der Items (v" & @AutoItVersion & ")", 500, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt Items hinzu
	_GUICtrlListView_SetItemCount($idListView, 100)
	_GUICtrlListView_BeginUpdate($idListView)
	For $x = 0 To 4
		GUICtrlCreateListViewItem("Item " & $x, $idListView)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl der Items: " & _GUICtrlListView_GetItemCount($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
