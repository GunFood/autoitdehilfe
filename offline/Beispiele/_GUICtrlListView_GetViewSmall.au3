#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt, ob sich der Ansichtsmodus im Modus 'kleine Icons' befindet", 600, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	; Setzt die Ansicht
	_GUICtrlListView_SetView($idListView, 3)
	MsgBox($MB_SYSTEMMODAL, "Information", "Ansicht 'kleine Icons': " & _GUICtrlListView_GetViewSmall($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
