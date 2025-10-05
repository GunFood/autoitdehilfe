#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Ermittelt die Anzahl von Items, die sich auf der gleichen Ebene befinden (v" & @AutoItVersion & ")", 700, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~ 	_GUICtrlTreeView_SetUnicodeFormat($idTreeView, False)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidTVi_Item[100], $aidTVi_Child[100], $iRand, $iChildRand, $iYItem
	$iRand = 6
	For $x = 0 To $iRand
		$aidTVi_Item[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		$iChildRand = 3 ;Random(0, 3, 1)
		For $y = 0 To $iChildRand
			$aidTVi_Child[$iYItem] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $aidTVi_Item[$x])
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	$iRand = 5 ;Random(0, 9)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Items auf der gleichen Ebene wie Item Index %d: %d", $iRand, _GUICtrlTreeView_GetSiblingCount($idTreeView, $aidTVi_Item[$iRand])))

	$iRand = 7 ;Random(0, 12)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Items auf der gleichen Ebene wie Item Index %d: %d", $iRand, _GUICtrlTreeView_GetSiblingCount($idTreeView, $aidTVi_Child[$iRand])))
	_GUICtrlTreeView_Expand($idTreeView, _GUICtrlTreeView_GetParentHandle($idTreeView, $aidTVi_Child[$iRand]))
	_GUICtrlTreeView_SelectItem($idTreeView, $aidTVi_Child[$iRand])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
