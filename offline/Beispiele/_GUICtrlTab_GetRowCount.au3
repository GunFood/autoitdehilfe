#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt die aktuelle Anzahl von Zeilen", 500, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_MULTILINE)
	GUISetState(@SW_SHOW)

	; Tabs hinzufügen
	For $x = 0 To 10
		_GUICtrlTab_InsertItem($idTab, $x, "Tab " & $x + 1)
	Next

	; Ermittelt die aktuelle Anzahl von Zeilen
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von Zeilen: " & _GUICtrlTab_GetRowCount($idTab))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
