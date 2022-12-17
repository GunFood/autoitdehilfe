#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Attribute der Spalte ermitteln (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("col0|col1|col2", 2, 2, 394, 268)
	$idListview = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($idListview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_CHECKBOXES))
	_GUICtrlListView_SetColumnWidth($idListview, 0, 100)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	GUICtrlCreateListViewItem("Index0|Daten0|mehr0", $idListview)
	GUICtrlCreateListViewItem("Index1|Daten1|mehr1", $idListview)
	GUICtrlCreateListViewItem("Index2|Daten2|mehr2", $idListview)
	GUICtrlCreateListViewItem("Index3|Daten3|mehr3", $idListview)
	GUICtrlCreateListViewItem("Index4|Daten4|mehr4", $idListview)

	; Ändert die Attribute einer Spalte
	Local $aInfo = _GUICtrlListView_GetColumn($idListview, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 0 Breite: " & $aInfo[4])
	_GUICtrlListView_SetColumn($idListview, 0, "New Spalte 0", 150)
	$aInfo = _GUICtrlListView_GetColumn($idListview, 0)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 0 Breite: " & $aInfo[4])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
