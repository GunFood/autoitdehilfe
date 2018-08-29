#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iI, $iTimer, $idListView

	; Erstellt eine GUI
	GUICreate("ListView: Fügt ein Item aus einem Array hinzu", 500, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt eine Spalte hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)
	_GUICtrlListView_AddColumn($idListView, "SubItems 1", 100)
	_GUICtrlListView_AddColumn($idListView, "SubItems 2", 100)
	_GUICtrlListView_AddColumn($idListView, "SubItems 3", 100)

	_GUICtrlListView_SetItemCount($idListView, 5000)

	; 1. Spalte wird befüllt
	Local $aItems[5000][1]
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
	Next
	$iTimer = TimerInit()
	_GUICtrlListView_AddArray($idListView, $aItems)
	MsgBox($MB_SYSTEMMODAL, "Information", "Füllzeit: " & TimerDiff($iTimer) / 1000 & " Sekunden")

	_GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($idListView)) ; Items die mit UDF Funktionen hinzugefügt wurden können auch mit UDF Funktionen wieder gelöscht werden

	; 4. Spalte wird befüllt
	Dim $aItems[5000][4]
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
		$aItems[$iI][3] = "Item " & $iI & "-3"
	Next
	$iTimer = TimerInit()
	_GUICtrlListView_AddArray($idListView, $aItems)
	MsgBox($MB_SYSTEMMODAL, "Information", "Füllzeit: " & TimerDiff($iTimer) / 1000 & " Sekunden")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
