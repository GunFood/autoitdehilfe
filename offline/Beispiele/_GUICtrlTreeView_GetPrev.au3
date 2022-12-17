#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Ermittelt den Vorgänger (v" & @AutoItVersion & ")", 400, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidItem[10], $iYItem = 0
	For $x = 0 To 3
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $iYItem), $aidItem[$x])
			$iYItem += 1
		Next
	Next
	$aidItem[4] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", 4), $idTreeView)
	For $x = 5 To 9
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $iYItem), $aidItem[$x])
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	Local $iRand = Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Vorgänger von Index %d: %s", $iRand, _GUICtrlTreeView_GetPrev($idTreeView, $aidItem[$iRand])))
	_GUICtrlTreeView_SelectItem($idTreeView, _GUICtrlTreeView_GetPrev($idTreeView, $aidItem[$iRand]))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
