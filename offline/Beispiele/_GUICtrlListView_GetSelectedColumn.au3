#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>



Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt die ausgewählte Spalte", 400, 300)
	$idListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $idListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $idListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $idListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $idListView)
	GUICtrlCreateListViewItem("Zeile5|Daten5|mehr5", $idListView)
	GUISetState(@SW_SHOW)

	; Wählt Spalte 2 aus
	_GUICtrlListView_SetSelectedColumn($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Ausgewählte Spalte: " & _GUICtrlListView_GetSelectedColumn($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
