#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("ListView: Ermittelt ToolTips", 400, 300)
	Local $hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 0")
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")

	; Zeigt das Handle des Tooltips
	Local $hToolTip = _GUICtrlListView_GetToolTips($hListView)
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips: 0x" & Hex($hToolTip) & @CRLF & _
			"IsPtr = " & IsPtr($hToolTip) & " IsHWnd = " & IsHWnd($hToolTip))
	Local $hPrevTooltips = _GUICtrlListView_SetToolTips($hListView, $hToolTip)
	MsgBox($MB_SYSTEMMODAL, "Information", "Vorheriges Handle des ToolTips: 0x" & Hex($hPrevTooltips) & @CRLF & _
			"IsPtr = " & IsPtr($hPrevTooltips) & " IsHWnd = " & IsHWnd($hPrevTooltips))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
