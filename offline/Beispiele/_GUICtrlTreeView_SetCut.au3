#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idTmp_item[6], $hRandomItem, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Legt fest, ob das Item dargestellt wird, als wäre es Teil einer Ausschneide-/ Einfüge-Operation", 800, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To UBound($idTmp_item) - 1
		$idTmp_item[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x + 1), $idTreeView)
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	$hRandomItem = Random(0, UBound($idTmp_item) - 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Ist Item %d Teil einer Ausschneide-/ Einfüge-Operation %s", $hRandomItem, _GUICtrlTreeView_GetCut($idTreeView, $idTmp_item[$hRandomItem])))
	_GUICtrlTreeView_SetCut($idTreeView, $idTmp_item[$hRandomItem])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Ist Item %d Teil einer Ausschneide-/ Einfüge-Operation %s", $hRandomItem, _GUICtrlTreeView_GetCut($idTreeView, $idTmp_item[$hRandomItem])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
