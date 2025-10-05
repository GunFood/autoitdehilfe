#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Setrzt und ermittelt den Bilderindex (v" & @AutoItVersion & ")", 500, 300)

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
	Local $ahItem[6], $hRandomImage
	For $x = 0 To _GUIImageList_GetImageCount($hImage) - 1
		$hRandomImage = $x ;Random(0, 5, 1)
		$ahItem[$x] = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x), $hRandomImage, $hRandomImage)
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	Local $hRandomItem = 2    ; Random(0, UBound($ahItem) - 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item %d Bilderindex? %s", $hRandomItem, _GUICtrlTreeView_GetImageIndex($idTreeView, $ahItem[$hRandomItem])))
	_GUICtrlTreeView_SelectItem($idTreeView, $ahItem[$hRandomItem])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
