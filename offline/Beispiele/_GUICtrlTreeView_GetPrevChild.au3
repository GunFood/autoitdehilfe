#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Ermittelt das vorherige Child (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidItem[10]
	For $x = 0 To 3
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To 4
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $y), $aidItem[$x])
		Next
	Next
	$aidItem[4] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 4), $idTreeView)
	For $x = 5 To 9
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $y), $aidItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	Local $hLastChild = _GUICtrlTreeView_GetLastChild($idTreeView, $aidItem[2])
	_GUICtrlTreeView_SelectItem($idTreeView, $hLastChild)
	MsgBox($MB_SYSTEMMODAL, "Information", "Index 2, vorheriges Child: " & _GUICtrlTreeView_GetPrevChild($idTreeView, $hLastChild))
	_GUICtrlTreeView_SelectItem($idTreeView, _GUICtrlTreeView_GetPrevChild($idTreeView, $hLastChild))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
