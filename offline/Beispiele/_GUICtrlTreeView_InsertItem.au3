#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_hImage, $g_hStateImage

Example()

Func Example()
	GUICreate("TreeView: Item einfügen (v" & @AutoItVersion & ")", 400, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($idTreeView, False)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aidItem[10], $aidChildItem[30], $iYItem = 0
	For $x = 0 To 9
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		For $y = 1 To 3
			$aidChildItem[$iYItem] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Child", $iYItem), $aidItem[$x])
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	Local $iRand = Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Eingefügt nach dem Index %d: %s", $iRand, _GUICtrlTreeView_InsertItem($idTreeView, "Inserted Item", 0, $aidItem[$iRand])))

	$iRand = Random(0, 29, 1)
	Local $hInsert = _GUICtrlTreeView_InsertItem($idTreeView, "Eingefügtes Item", _GUICtrlTreeView_GetParentHandle($idTreeView, $aidChildItem[$iRand]), $aidChildItem[$iRand])
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Eingefügt nach dem Child-Index %d: %s", $iRand, $hInsert))

	$hInsert = _GUICtrlTreeView_InsertItem($idTreeView, "Eingefügtes erstes Child-Item", _GUICtrlTreeView_GetParentHandle($idTreeView, $aidChildItem[$iRand]), $TVI_FIRST)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Eingefügter erster Child-Index %d : %s", $iRand, $hInsert))
	_GUICtrlTreeView_SelectItem($idTreeView, $hInsert)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
