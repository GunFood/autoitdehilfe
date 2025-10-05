#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idTab

	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Ermittelt die aktuelle Anzahl von Zeilen", 500, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266, $TCS_MULTILINE)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Tabs hinzufügen
	For $x = 0 To 10
		_GUICtrlTab_InsertItem($idTab, $x, "Tab " & $x)
	Next

	; Ermittelt die aktuelle Anzahl von Zeilen
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von Zeilen: " & _GUICtrlTab_GetRowCount($idTab))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
