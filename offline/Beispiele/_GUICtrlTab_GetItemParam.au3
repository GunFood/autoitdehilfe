; == Mit UDF erstelltes Beispiel
#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt Itemparameter (v" & @AutoItVersion & ")", 500, 300)
	Local $hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
;~ 	Local $hTab = GUICtrlCreateTab(2, 2, 396, 296) ; mit der integrierten Funktion erstellt
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 2")

	; Ermittelt/Setzt Parameter für Tab 0
	_GUICtrlTab_SetItemParam($hTab, 0, 1234)
	MsgBox($MB_SYSTEMMODAL, "Information", "Parameter für Tab 0: " & _GUICtrlTab_GetItemParam($hTab, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
