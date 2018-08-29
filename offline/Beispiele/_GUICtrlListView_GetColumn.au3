#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aInfo, $idListView

	GUICreate("ListView: Attribute der Spalte ermitteln", 400, 300)
	$idListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($idListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_CHECKBOXES))
	_GUICtrlListView_SetColumnWidth($idListView, 0, 100)
	GUISetState(@SW_SHOW)

	GUICtrlCreateListViewItem("Index0|Daten1|mehr1", $idListView)
	GUICtrlCreateListViewItem("Index1|Daten2|mehr2", $idListView)
	GUICtrlCreateListViewItem("Index2|Daten3|mehr3", $idListView)
	GUICtrlCreateListViewItem("Index3|Daten4|mehr4", $idListView)
	GUICtrlCreateListViewItem("Index4|Daten5|mehr5", $idListView)

	; Ändert die Attribute einer Spalte
	$aInfo = _GUICtrlListView_GetColumn($idListView, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Breite: " & $aInfo[4])
	_GUICtrlListView_SetColumn($idListView, 0, "New Spalte 1", 150)
	$aInfo = _GUICtrlListView_GetColumn($idListView, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Breite: " & $aInfo[4])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
