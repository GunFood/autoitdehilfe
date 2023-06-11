#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt und ermittelt das Unicode Format (v" & @AutoItVersion & ")", 420, 300)
	Local $idTab = GUICtrlCreateTab(2, 2, 416, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt das Unicode Format
	Local $bFormat = _GUICtrlTab_GetUnicodeFormat($idTab)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & $bFormat)
	_GUICtrlTab_SetUnicodeFormat($idTab, Not $bFormat)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & _GUICtrlTab_GetUnicodeFormat($idTab))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
