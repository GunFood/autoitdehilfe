#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aInfo, $idListView

	GUICreate("ListView: Spalten ausrichten", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 3", 100)

	; Spalten ändern
	$aInfo = _GUICtrlListView_GetColumn($idListView, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])
	_GUICtrlListView_JustifyColumn($idListView, 0, 2)
	$aInfo = _GUICtrlListView_GetColumn($idListView, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
