#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Spalten ausrichten  (v" & @AutoItVersion & ")", 400, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 120)

	; Spalten ändern
	Local $aInfo = _GUICtrlListView_GetColumn($idListview, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])
	_GUICtrlListView_JustifyColumn($idListview, 0, 2)
	$aInfo = _GUICtrlListView_GetColumn($idListview, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Ausrichtung: " & $aInfo[0])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
