; == Mit UDF erstelltes Beispiel

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt Itemparameter (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $idTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt Parameter für Tab 0
	_GUICtrlTab_SetItemParam($idTab, 0, 1234)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Parameter für Tab 0: " & _GUICtrlTab_GetItemParam($idTab, 0))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
