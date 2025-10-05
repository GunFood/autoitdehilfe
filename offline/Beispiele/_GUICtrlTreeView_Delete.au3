#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Löschen (v" & @AutoItVersion & ")", 400, 300)

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
	Local $hItem, $iImage
	For $x = 0 To 5
		$ahItem = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x), $iImage, $iImage)
		For $y = 0 To 3
			$iImage = Random(0, 5, 1)
			_GUICtrlTreeView_AddChild($idTreeView, $ahItem, StringFormat("[%02d] Neues Child", $y), $iImage, $iImage)
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Löscht Item " & $x - 1)
	_GUICtrlTreeView_Delete($idTreeView, $ahItem)

	MsgBox($MB_SYSTEMMODAL, "Information", "Löscht Item 0")
	_GUICtrlTreeView_Delete($idTreeView)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
