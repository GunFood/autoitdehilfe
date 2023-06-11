#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example() ; Ein ListView Control erstellt mit der ListView UDF.

Func Example()
	Local $aItems[10][3]

	Local $hGUI = GUICreate("(UDF) ListView: Löscht alle Items (v" & @AutoItVersion & ")", 400, 300)
	Local $hListView = _GUICtrlListView_Create($hGUI, "Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)

	; Zeigt die GUI
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($hListView, False)

	; 3 Spalten laden
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
	Next

	_GUICtrlListView_AddArray($hListView, $aItems)

	MsgBox($MB_SYSTEMMODAL, "Information", "Löscht alle Items")

	; Verwendet das Handle eines mit der UDF erstellen ListViews
	_GUICtrlListView_DeleteAllItems($hListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Löscht die GUI und alle Controls
	GUIDelete()
EndFunc   ;==>Example
