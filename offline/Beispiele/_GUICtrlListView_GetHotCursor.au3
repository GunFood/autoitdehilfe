#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt das 'Hot'-Cursor Handle", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 3", 100)

	; Zeigt das 'Hot'-Cursor Handle
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des 'Hot'-Cursors: 0x" & Hex(_GUICtrlListView_GetHotCursor($idListView)) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlListView_GetHotCursor($idListView)) & " IsHwnd = " & IsHWnd(_GUICtrlListView_GetHotCursor($idListView)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
