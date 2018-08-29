#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $ahItem[11], $idTmp_item, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Setzt das Children-Flag", 400, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To 3
		$ahItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 0 To 2
			$idTmp_item = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $ahItem[$x])
		Next
	Next
	$ahItem[4] = GUICtrlCreateTreeViewItem(StringFormat("Schaust du nach mir?", $x), $idTmp_item)
	For $x = 5 To 9
		$ahItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $ahItem[$x])
		Next
	Next
	$ahItem[10] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 10), $idTreeView)
	_GUICtrlTreeView_EndUpdate($idTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Hat Item 0 Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $ahItem[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Hat Item 10 Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $ahItem[10]))
	_GUICtrlTreeView_SetChildren($idTreeView, $ahItem[10])
	MsgBox($MB_SYSTEMMODAL, "Information", "Hat Item 10 Children? " & _GUICtrlTreeView_GetChildren($idTreeView, $ahItem[10]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
