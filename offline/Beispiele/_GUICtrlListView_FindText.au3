#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ListView: Text suchen (v" & @AutoItVersion & ")", 400, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListview)
	Local $iI
	For $iI = 1 To 49
		_GUICtrlListView_AddItem($idListview, "Item " & $iI)
	Next
	_GUICtrlListView_AddItem($idListview, "Zielitem")
	For $iI = 51 To 100
		_GUICtrlListView_AddItem($idListview, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListview)

	; Suche nach dem Zielitem
	$iI = _GUICtrlListView_FindText($idListview, "zIeL")
	MsgBox($MB_SYSTEMMODAL, "Information", "Ziel-Item Index: " & $iI)
	_GUICtrlListView_EnsureVisible($idListview, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
