#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Nächstes Item ermitteln (v" & @AutoItVersion & ")", 400, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidTVi_Item[10]
	For $x = 0 To 3
		$aidTVi_Item[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $y), $aidTVi_Item[$x])
		Next
	Next
	$aidTVi_Item[4] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 4), $idTreeView)
	For $x = 5 To 9
		$aidTVi_Item[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $y), $aidTVi_Item[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Index 2, Nächstes: " & _GUICtrlTreeView_GetNext($idTreeView, $aidTVi_Item[2]))
	_GUICtrlTreeView_SelectItem($idTreeView, _GUICtrlTreeView_GetNext($idTreeView, $aidTVi_Item[2]))

	MsgBox($MB_SYSTEMMODAL, "Information", "Index 4, Nächstes: " & _GUICtrlTreeView_GetNext($idTreeView, $aidTVi_Item[4]))
	_GUICtrlTreeView_SelectItem($idTreeView, _GUICtrlTreeView_GetNext($idTreeView, $aidTVi_Item[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
