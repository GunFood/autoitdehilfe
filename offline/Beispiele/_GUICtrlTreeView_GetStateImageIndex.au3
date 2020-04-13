#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $hImage

Example()

Func Example()
	Local $aidItem[10], $aidChildItem[30], $iYItem = 0, $idTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView: Ermittelt den Index des Statusbildes aus der Imagelist", 550, 300)

	$idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_CreateStateImageList()
	_GUICtrlTreeView_SetStateImageList($idTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	For $x = 0 To 9
		$aidItem[$x] = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		_GUICtrlTreeView_SetStateImageIndex($idTreeView, $aidItem[$x], 1)
		For $y = 1 To 3
			$aidChildItem[$iYItem] = _GUICtrlTreeView_AddChild($idTreeView, $aidItem[$x], StringFormat("[%02d] Neues Child", $y))
			_GUICtrlTreeView_SetStateImageIndex($idTreeView, $aidChildItem[$iYItem], 1)
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	_GUICtrlTreeView_SelectItem($idTreeView, $aidItem[0])
	_GUICtrlTreeView_SetStateImageIndex($idTreeView, $aidItem[0], 2)

	MsgBox($MB_SYSTEMMODAL, "Information", "Index des Statusbildes für Item 0: " & _GUICtrlTreeView_GetStateImageIndex($idTreeView, $aidItem[0]))
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _CreateStateImageList()
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 4)
EndFunc   ;==>_CreateStateImageList
