#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $bFormat, $idTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt das Unicode Format", 400, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3")

	; Ermittelt/Setzt das Unicode Format
	$bFormat = _GUICtrlTab_GetUnicodeFormat($idTab)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & $bFormat)
	_GUICtrlTab_SetUnicodeFormat($idTab, Not $bFormat)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & _GUICtrlTab_GetUnicodeFormat($idTab))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
