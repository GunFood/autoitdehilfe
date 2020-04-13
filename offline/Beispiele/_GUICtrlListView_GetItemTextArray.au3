#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aItem, $sText, $idListView

	GUICreate("ListView: Ermittelt den Itemtext (Array)", 400, 300)

	$idListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $idListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $idListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $idListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $idListView)
	GUICtrlCreateListViewItem("Zeile5|Daten5|mehr5", $idListView)

	GUISetState(@SW_SHOW)

	; Ermittelt den Text von Item 2
	$aItem = _GUICtrlListView_GetItemTextArray($idListView, 1)
	For $i = 1 To $aItem[0]
		$sText &= StringFormat("spalte[%2d] %s", $i, $aItem[$i]) & @CRLF
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Text von Item 2 (alle Spalten): " & @CRLF & @CRLF & $sText)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
