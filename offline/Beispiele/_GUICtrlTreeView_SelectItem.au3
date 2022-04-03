#AutoIt3Wrapper_UseX64=Y
#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Item auswählen (v" & @AutoItVersion & ")", 400, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

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

	Local $iRand = 6
	_GUICtrlTreeView_SelectItem($idTreeView, $aidItem[$iRand])
	MsgBox($MB_SYSTEMMODAL, "Information", "Tree für Index " & $iRand & ": " & _GUICtrlTreeView_GetTree($idTreeView, $aidItem[$iRand]))
	$iRand = 5
	_GUICtrlTreeView_SelectItem($idTreeView, $aidChildItem[$iRand])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
