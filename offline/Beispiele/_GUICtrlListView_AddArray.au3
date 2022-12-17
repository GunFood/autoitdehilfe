#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ListView: Fügt ein Item aus einem Array hinzu (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Fügt eine Spalte hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 100)
	_GUICtrlListView_AddColumn($idListview, "SubItems 1", 100)
	_GUICtrlListView_AddColumn($idListview, "SubItems 2", 100)
	_GUICtrlListView_AddColumn($idListview, "SubItems 3", 100)

	_GUICtrlListView_SetItemCount($idListview, 5000)

	; 1. Spalte wird befüllt
	Local $aItems[5000][1]
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
	Next
	Local $hTimer = TimerInit()
	_GUICtrlListView_AddArray($idListview, $aItems)
	MsgBox($MB_SYSTEMMODAL, "Information", "Füllzeit: " & TimerDiff($hTimer) / 1000 & " Sekunden")

	_GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($idListview)) ; Items die mit UDF Funktionen hinzugefügt wurden können auch mit UDF Funktionen wieder gelöscht werden
	_GUICtrlListView_DeleteAllItems($idListview) ; Items die mit UDF Funktionen hinzugefügt wurden können auch mit UDF Funktionen wieder gelöscht werden

	; 4. Spalte wird befüllt
	Dim $aItems[5000][4]
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
		$aItems[$iI][3] = "Item " & $iI & "-3"
	Next
	Local $hTimer2 = TimerInit()
	_GUICtrlListView_AddArray($idListview, $aItems)
	MsgBox($MB_SYSTEMMODAL, "Information", "Füllzeit: " & TimerDiff($hTimer2) / 1000 & " Sekunden")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
