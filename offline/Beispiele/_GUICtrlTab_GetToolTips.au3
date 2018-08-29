#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hTool, $idTab

	; Erstellt eine GUI
	$hGui = GUICreate("Tab-Control: Ermittelt die ToolTips", 400, 300)
	$idTab = _GUICtrlTab_Create($hGui, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3")

	; Ermittelt/Setzt die ToolTips
	$hTool = _GUIToolTip_Create($idTab)
	_GUICtrlTab_SetToolTips($idTab, $hTool)

	MsgBox($MB_SYSTEMMODAL, "Information", "ToolTip Handle: 0x" & _GUICtrlTab_GetToolTips($idTab) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlTab_GetToolTips($idTab)) & " IsHwnd = " & IsHWnd(_GUICtrlTab_GetToolTips($idTab)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
