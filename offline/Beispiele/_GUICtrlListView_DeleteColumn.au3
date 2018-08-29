#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Löscht eine Spalte", 400, 300)

	$idListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $idListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $idListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $idListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $idListView)
	GUICtrlCreateListViewItem("Zeile5|Datena5|mehr5", $idListView)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Eine Spalte löschen")
	_GUICtrlListView_DeleteColumn($idListView, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
