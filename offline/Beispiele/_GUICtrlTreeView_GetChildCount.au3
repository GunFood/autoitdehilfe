#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $aidItem[10], $iRand, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt die Anzahl der Childs", 400, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To 9
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 0 To Random(1, 20, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $aidItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	$iRand = Random(0, 9)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Anzahl der Childs für den Itemindex %d: %d", $iRand, _GUICtrlTreeView_GetChildCount($idTreeView, $aidItem[$iRand])))
	_GUICtrlTreeView_Expand($idTreeView, $aidItem[$iRand])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
