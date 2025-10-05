#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Setzt und ermittelt, ob das Item den Fokus hat (v" & @AutoItVersion & ")", 600, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidTVi_Item[6]
	For $x = 0 To UBound($aidTVi_Item) - 1
		$aidTVi_Item[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x + 1), $idTreeView)
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	Local $hRandomItem = Random(0, UBound($aidTVi_Item) - 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Hat Item %d den Fokus? %s", $hRandomItem, _GUICtrlTreeView_GetFocused($idTreeView, $aidTVi_Item[$hRandomItem])))
	_GUICtrlTreeView_SetFocused($idTreeView, $aidTVi_Item[$hRandomItem])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Hat Item %d den Fokus? %s", $hRandomItem, _GUICtrlTreeView_GetFocused($idTreeView, $aidTVi_Item[$hRandomItem])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
