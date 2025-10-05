#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("TreeView: Setzt und ermittelt den festgelegten Wert (v" & @AutoItVersion & ")", 500, 300)
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $hTreeView = _GUICtrlTreeView_Create($hGUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($hTreeView, False)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	Local $ahItem[10], $ahItemChild[30], $iYIndex = 0, $iParam = 1
	For $x = 0 To 9
		$ahItem[$x] = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		_GUICtrlTreeView_SetItemParam($hTreeView, $ahItem[$x], $iParam)
		$iParam += 1
		For $y = $iYIndex To $iYIndex + 2
			$ahItemChild[$y] = _GUICtrlTreeView_AddChild($hTreeView, $ahItem[$x], StringFormat("[%02d] Neues Item", $y))
			_GUICtrlTreeView_SetItemParam($hTreeView, $ahItemChild[$y], $iParam)
			$iParam += 1
		Next
		$iYIndex += 3
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	Local $iRand = 2     ;Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Param/ID für Index %d: %s", $iRand, _GUICtrlTreeView_GetItemParam($hTreeView, $ahItem[$iRand])))
	$iRand = 12 ;Random(0, 29, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Param/ID für child Index %d: %s", $iRand, _GUICtrlTreeView_GetItemParam($hTreeView, $ahItemChild[$iRand])))
	_GUICtrlTreeView_SelectItem($hTreeView, $ahItemChild[$iRand])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
