#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Fügt einen neues Child am Anfang hinzu (v" & @AutoItVersion & ")", 500, 300)

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

	Local $hItem, $iImage
	For $x = 0 To 4
		$iImage = Random(0, 5, 1)
		$ahItem = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x), $iImage, $iImage)
		For $y = 1 To 3
			$iImage = Random(0, 4, 1)
			_GUICtrlTreeView_AddChild($idTreeView, $ahItem, StringFormat("[%02d] Neues Child", $y), $iImage, $iImage)
		Next
		_GUICtrlTreeView_AddChildFirst($idTreeView, $ahItem, "[00] Erstes Child", 5, 5)
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	_GUICtrlTreeView_ClickItem($idTreeView, $hItem, "left", False, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
