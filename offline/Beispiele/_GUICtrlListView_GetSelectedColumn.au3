#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Setzt und ermittelt die ausgewählte Spalte (v" & @AutoItVersion & ")", 500, 300)
	$idListView = GUICtrlCreateListView("Spalte 0|Spalte 1|Spalte 2", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile0|Daten0|mehr0", $idListView)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $idListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $idListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $idListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $idListView)
	GUISetState(@SW_SHOW)

	; Wählt Spalte 1 aus
	_GUICtrlListView_SetSelectedColumn($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Ausgewählte Spalte: " & _GUICtrlListView_GetSelectedColumn($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
