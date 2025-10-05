#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_hImage, $g_hStateImage

Example()

Func Example()
	GUICreate("TreeView: Gibt Informationen über den Ort eines Punktes (v" & @AutoItVersion & ")", 600, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($idTreeView, False)

	_CreateNormalImageList()
	_GUICtrlTreeView_SetNormalImageList($idTreeView, $g_hImage)

	_CreateStateImageList()
	_GUICtrlTreeView_SetStateImageList($idTreeView, $g_hStateImage)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $ahItem[10], $aidChildItem[30], $iYItem = 0
	For $x = 0 To 9
		$ahItem[$x] = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x), 4, 5)
		_GUICtrlTreeView_SetStateImageIndex($idTreeView, $ahItem[$x], 1)
		For $y = 1 To 3
			$aidChildItem[$iYItem] = _GUICtrlTreeView_AddChild($idTreeView, $ahItem[$x], StringFormat("[%02d] Neues Child", $y), 0, 3)
			_GUICtrlTreeView_SetStateImageIndex($idTreeView, $aidChildItem[$iYItem], 1)
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	_GUICtrlTreeView_SelectItem($idTreeView, $ahItem[0])
	_GUICtrlTreeView_SetStateImageIndex($idTreeView, $ahItem[0], 2)

	Local $iYRand = Random(0, 268, 1)
	Local $iXRand = Random(0, 396, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Hit TestEx (%d, %d): %s", $iXRand, $iYRand, _GetHitString(_GUICtrlTreeView_HitTestEx($idTreeView, $iXRand, $iYRand))))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _GetHitString($tHitTest)
	Local $iFlags = DllStructGetData($tHitTest, "Flags")
	Select
		Case BitAND($iFlags, $TVHT_NOWHERE) <> 0
			Return "Im Anwendungsbereich, aber unterhalb des letzten Items"
		Case BitAND($iFlags, $TVHT_ONITEMICON) <> 0
			Return "Über dem Bild, das mit einem Item verknüpft ist"
		Case BitAND($iFlags, $TVHT_ONITEMLABEL) <> 0
			Return "Über dem Text, der mit einem Item verknüpft ist"
		Case BitAND($iFlags, $TVHT_ONITEMINDENT) <> 0
			Return "Über der Einrückung, die mit einem Item verknüpft ist"
		Case BitAND($iFlags, $TVHT_ONITEMBUTTON) <> 0
			Return "Über dem Button, der mit einem Item verknüpft ist"
		Case BitAND($iFlags, $TVHT_ONITEMRIGHT) <> 0
			Return "Im Bereich rechts neben einem Item"
		Case BitAND($iFlags, $TVHT_ONITEMSTATEICON) <> 0
			Return "Über dem Status-Icon eines Items, das sich in einem benutzerdefinierten Zustand befindet"
		Case BitAND($iFlags, $TVHT_ABOVE) <> 0
			Return "Oberhalb des Anwendungsbereichs"
		Case BitAND($iFlags, $TVHT_BELOW) <> 0
			Return "Unterhalb des Anwendungsbereichs"
		Case BitAND($iFlags, $TVHT_TORIGHT) <> 0
			Return "Links neben dem Anwendungsbereich"
		Case BitAND($iFlags, $TVHT_TOLEFT) <> 0
			Return "Rechts neben dem Anwendungsbereich"
	EndSelect
EndFunc   ;==>_GetHitString

Func _CreateNormalImageList()
	$g_hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($g_hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($g_hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($g_hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($g_hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($g_hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($g_hImage, "shell32.dll", 146)
EndFunc   ;==>_CreateNormalImageList

Func _CreateStateImageList()
	$g_hStateImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($g_hStateImage, "shell32.dll", 3)
	_GUIImageList_AddIcon($g_hStateImage, "shell32.dll", 4)
EndFunc   ;==>_CreateStateImageList
