#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt und ermittelt den erweiterten Stil (v" & @AutoItVersion & ")", 500, 300)
	Local $idTab = GUICtrlCreateTab(2, 2, 396, 296, BitOR($TCS_BUTTONS, $TCS_FLATBUTTONS))
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt den erweiterten Stil
	_GUICtrlTab_SetExtendedStyle($idTab, $TCS_EX_FLATSEPARATORS)
	MsgBox($MB_SYSTEMMODAL, "Information", "Erweiterte Stile: 0x" & Hex(_GUICtrlTab_GetExtendedStyle($idTab)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
