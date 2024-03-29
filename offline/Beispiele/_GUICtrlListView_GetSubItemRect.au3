#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Ermittelt Informationen über das begrenzende Rechteck eines Items (v" & @AutoItVersion & ")", 700, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 1")
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 1")
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($idListview, "Zeile 3: Spalte 1")

	; Zeigt Informationen über das begrenzende Rechteck von Item 2
	Local $aRect = _GUICtrlListView_GetSubItemRect($idListview, 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Begrenzendes Rechteck von Item 2 : [%d, %d, %d, %d]", $aRect[0], $aRect[1], $aRect[2], $aRect[3]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
