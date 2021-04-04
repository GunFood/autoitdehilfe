; == Beispiel 2 zum Sortieren nur mit Stufe 1

#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $aidItem[10], $iX = 9, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView sortieren", 400, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To 3
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neuer Eintrag", $iX), $idTreeView)
		$iX -= 1
	Next
	_GUICtrlTreeView_Expand($idTreeView)
	_GUICtrlTreeView_EndUpdate($idTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Sortiert")
	_GUICtrlTreeView_Sort($idTreeView)
	_GUICtrlTreeView_SelectItem($idTreeView, $aidItem[9])

	; Schleife, bis der Benutzer beendet
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
