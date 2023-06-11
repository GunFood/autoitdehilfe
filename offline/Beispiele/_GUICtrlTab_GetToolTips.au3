#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt die ToolTips (v" & @AutoItVersion & ")", 500, 300)
	Local $hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 2")

	; Ermittelt/Setzt die ToolTips
	Local $hTool = _GUIToolTip_Create($hTab)
	_GUICtrlTab_SetToolTips($hTab, $hTool)

	MsgBox($MB_SYSTEMMODAL, "Information", "ToolTip Handle: 0x" & _GUICtrlTab_GetToolTips($hTab) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlTab_GetToolTips($hTab)) & " IsHwnd = " & IsHWnd(_GUICtrlTab_GetToolTips($hTab)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
