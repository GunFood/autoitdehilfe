#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hToolTip, $idListView

	$hGui = GUICreate("ListView: Ermittelt ToolTips", 400, 300)
	$hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Zeigt das Handle des Tooltips
	$hToolTip = _GUICtrlListView_GetToolTips($idListView)
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips: 0x" & Hex($hToolTip) & @CRLF & _
			"IsPtr = " & IsPtr($hToolTip) & " IsHWnd = " & IsHWnd($hToolTip))
	_GUICtrlListView_SetToolTips($idListView, $hToolTip)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
