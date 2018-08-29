#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>


Example()

Func Example()
	Local $idListview, $iMsg, $iIndex

	GUICreate("ListView: Prüfen, ob das Item sichtbar ist", 235, 250, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; Ändert die Hintergrundfarbe

	$idListview = GUICtrlCreateListView("Spalte 1  |Spalte 2|Spalte 3  ", 10, 10, 215, 150);,$LVS_SORTDESCENDING)
	For $x = 1 To 30
		GUICtrlCreateListViewItem("Eintrag " & $x & "|Spalte " & $x & "2|Spalte " & $x & "3", $idListview)
	Next
	GUISetState(@SW_SHOW)

	$iIndex = Random(0, 29, 1)
	MsgBox(8192 + 64, "Information", "Eintrag " & $iIndex & " ist sichtbar: " & _GUICtrlListView_IsItemVisible($idListview, $iIndex))

	Do
		$iMsg = GUIGetMsg()
	Until $iMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
