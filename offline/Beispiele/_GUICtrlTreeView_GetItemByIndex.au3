#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Ermittelt ein Item durch dessen Index (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUICtrlTreeView_SetNormalImageList($idTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $ahItem[4]
	For $x = 0 To 3
		$ahItem[$x] = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Item", $x))
		For $y = 0 To 2
			_GUICtrlTreeView_AddChild($idTreeView, $ahItem[$x], StringFormat("[%02d] Child Item", $y))
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	; $hItem = -1 Erlaubt das Abrufen des Handles für ein Hauptelement.
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 Handle: " & _GUICtrlTreeView_GetItemByIndex($idTreeView, -1, 1))

	Local $hChildItem = _GUICtrlTreeView_GetItemByIndex($idTreeView, $ahItem[3], 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 3, Child Index 1 Handle: " & $hChildItem)
	_GUICtrlTreeView_SelectItem($idTreeView, $hChildItem)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
