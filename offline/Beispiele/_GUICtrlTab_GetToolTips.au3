#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt die ToolTips (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $idTab = _GUICtrlTab_Create($hGUI, 2, 2, 446, 266)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt die ToolTips
	Local $hTool = _GUIToolTip_Create($idTab)
	_GUICtrlTab_SetToolTips($idTab, $hTool)

	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "ToolTip Handle: 0x" & _GUICtrlTab_GetToolTips($idTab) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlTab_GetToolTips($idTab)) & " IsHwnd = " & IsHWnd(_GUICtrlTab_GetToolTips($idTab)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
