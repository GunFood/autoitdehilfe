#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Ermittelt den inkrementellen Suchstring (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($idTreeView, False)

	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUICtrlTreeView_SetNormalImageList($idTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $aText[6] = ["AutoIt", "Freeware", "BASIC-artig", "Skript", "Sprache", "Automatisierung"]
	For $x = 0 To _GUIImageList_GetImageCount($hImage) - 1
		_GUICtrlTreeView_Add($idTreeView, 0, $aText[$x], $x, $x)
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	Send($aText[Random(0, 5, 1)])
	MsgBox($MB_SYSTEMMODAL, "Information", "Inkrementeller Suchstring: " & _GUICtrlTreeView_GetISearchString($idTreeView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
