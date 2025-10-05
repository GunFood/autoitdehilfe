#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Setzt und ermittelt Children (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidTVi_Item[5], $iY = -1
	For $x = 0 To 3
		$aidTVi_Item[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 0 To 2
			$iY += 1
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $iY), $aidTVi_Item[$x])
		Next
	Next
	$aidTVi_Item[4] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 4), $idTreeView)
	_GUICtrlTreeView_EndUpdate($idTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Item 0 hat Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $aidTVi_Item[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 4 hat Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $aidTVi_Item[4]))

	MsgBox($MB_SYSTEMMODAL, "Set Children", "Item 0 ? " & _GUICtrlTreeView_SetChildren($idTreeView, $aidTVi_Item[0]))
	MsgBox($MB_SYSTEMMODAL, "Set Children", "Item 4 ? " & _GUICtrlTreeView_SetChildren($idTreeView, $aidTVi_Item[4]))

	MsgBox($MB_SYSTEMMODAL, "Reset Children", "Item 0 ? " & _GUICtrlTreeView_SetChildren($idTreeView, $aidTVi_Item[0], False) & @TAB)
	MsgBox($MB_SYSTEMMODAL, "Reset Children", "Item 4 ? " & _GUICtrlTreeView_SetChildren($idTreeView, $aidTVi_Item[4], False) & @TAB)

	MsgBox($MB_SYSTEMMODAL, "Information", "Item 0 hat Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $aidTVi_Item[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 4 hat Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $aidTVi_Item[4]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
