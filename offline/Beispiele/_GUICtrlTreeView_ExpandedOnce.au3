#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $aidItem[5], $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Wurde die Itemliste der Child-Items mindestens einmal aufgeklappt?", 600, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To 4
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $aidItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Item 0 aufklappen")
	_GUICtrlTreeView_Expand($idTreeView, $aidItem[0])

	MsgBox($MB_SYSTEMMODAL, "Information", "Item 0 zuklappen")
	_GUICtrlTreeView_Expand($idTreeView, $aidItem[0], False)

	MsgBox($MB_SYSTEMMODAL, "Information", "Wurde Item 0 mindestens einmal aufgeklappt? " & _GUICtrlTreeView_ExpandedOnce($idTreeView, $aidItem[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Wurde Item 1 mindestens einmal aufgeklappt? " & _GUICtrlTreeView_ExpandedOnce($idTreeView, $aidItem[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
