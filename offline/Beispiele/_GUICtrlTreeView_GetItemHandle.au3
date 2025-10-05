#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Ermittelt das Handle eines Items (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	Local $vTreeview = $idTreeView
;~ 	$vTreeview = GUICtrlGetHandle($idTreeView) ; um mit Handles zu arbeiten
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($vTreeview, False)

	_GUICtrlTreeView_BeginUpdate($vTreeview)
	Local $ahItem[10], $ahItemChild[30], $iYIndex = 0
	For $x = 0 To 9
		$ahItem[$x] = _GUICtrlTreeView_Add($vTreeview, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = $iYIndex To $iYIndex + 2
			$ahItemChild[$y] = _GUICtrlTreeView_AddChild($vTreeview, $ahItem[$x], StringFormat("[%02d] Neues Child Item", $y))
		Next
		$iYIndex += 3
	Next
	_GUICtrlTreeView_EndUpdate($vTreeview)

	Local $iRand = Random(0, 9, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Handle für Index %d: %s\r\nIsPtr = %d IsHWnd = %d", $iRand, _GUICtrlTreeView_GetItemHandle($vTreeview, $ahItem[$iRand]), _
			IsPtr(_GUICtrlTreeView_GetItemHandle($vTreeview, $ahItem[$iRand])), IsHWnd(_GUICtrlTreeView_GetItemHandle($vTreeview, $ahItem[$iRand]))))
	$iRand = Random(0, 29, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Handle für Child Index %d: %s", $iRand, _GUICtrlTreeView_GetItemHandle($vTreeview, $ahItemChild[$iRand])))
	_GUICtrlTreeView_SelectItem($vTreeview, $ahItemChild[$iRand])
	Sleep(1000)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item Handle für Root Index: %s", _GUICtrlTreeView_GetItemHandle($vTreeview, Null)))
	_GUICtrlTreeView_SelectItem($vTreeview, Null)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
