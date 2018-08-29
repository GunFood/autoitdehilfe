#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $ahItem[10], $ahItemChild[30], $iYIndex = 0, $iRand, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	$hGui = GUICreate("TreeView: Ermittelt das Handle eines Items", 400, 300)

	$idTreeView = _GUICtrlTreeView_Create($hGui, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To 9
		$ahItem[$x] = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = $iYIndex To $iYIndex + 2
			$ahItemChild[$y] = _GUICtrlTreeView_AddChild($idTreeView, $ahItem[$x], StringFormat("[%02d] Neues Child Item", $y))
		Next
		$iYIndex += 3
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	$iRand = Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Handle für Index %d: %s\r\nIsPtr = %d IsHWnd = %d", $iRand, _GUICtrlTreeView_GetItemHandle($idTreeView, $ahItem[$iRand]), _
			IsPtr(_GUICtrlTreeView_GetItemHandle($idTreeView, $ahItem[$iRand])), IsHWnd(_GUICtrlTreeView_GetItemHandle($idTreeView, $ahItem[$iRand]))))

	$iRand = Random(0, 29, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Handle für Index %d: %s", $iRand, _GUICtrlTreeView_GetItemHandle($idTreeView, $ahItemChild[$iRand])))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
