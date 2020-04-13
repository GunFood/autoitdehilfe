#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Die Anzahl von Items ermitteln, welche vertikal in das sichtbare Feld eingepasst werden können", 400, 300)
	$idListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($idListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES))
	GUISetState(@SW_SHOW)

	; Zeigt die Anzahl von Items, welche vertikal in das sichtbare Feld eingepasst werden können
	MsgBox($MB_SYSTEMMODAL, "Information", "Items pro Seite: " & _GUICtrlListView_GetCounterPage($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
