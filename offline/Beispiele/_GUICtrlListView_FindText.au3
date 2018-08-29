#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Global $iI, $idListView

	; Erstellt eine GUI
	GUICreate("ListView: Text suchen", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListView)
	For $iI = 1 To 49
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_AddItem($idListView, "Zielitem")
	For $iI = 51 To 100
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	; Suche nach dem Zielitem
	$iI = _GUICtrlListView_FindText($idListView, "zIeL")
	MsgBox($MB_SYSTEMMODAL, "Information", "Ziel-Item Index: " & $iI)
	_GUICtrlListView_EnsureVisible($idListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
