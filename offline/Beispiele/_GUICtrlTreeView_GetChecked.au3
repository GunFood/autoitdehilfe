#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $aidItem[6], $hRandomItem, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Ermittelt, ob die Checkbox eines Items markiert ist", 500, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To UBound($aidItem) - 1
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x + 1), $idTreeView)
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	$hRandomItem = Random(0, UBound($aidItem) - 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d markiert? %s", $hRandomItem, _GUICtrlTreeView_GetChecked($idTreeView, $aidItem[$hRandomItem])))
	_GUICtrlTreeView_SetChecked($idTreeView, $aidItem[$hRandomItem])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d markiert? %s", $hRandomItem, _GUICtrlTreeView_GetChecked($idTreeView, $aidItem[$hRandomItem])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
