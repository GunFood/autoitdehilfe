#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("ComboBoxEx: Setzt und ermittelt den Index des Icons in der Imagelist über dem sich die Maus befinden soll bzw. befindet (v" & @AutoItVersion & ")", 940, 300)
	Local $hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 434, 100)
	GUISetState(@SW_SHOW)

	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0x0000FF, 16, 16))
	_GUICtrlComboBoxEx_SetImageList($hCombo, $hImage)

	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	Local $iImage
	For $x = 0 To 149
		$iImage = Random(0, 8, 1)
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : String", $x), $iImage, $iImage)
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)
	_GUICtrlComboBoxEx_SetItemImage($hCombo, 0, 1)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 1, 1)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 2, 1)
	_GUICtrlComboBoxEx_SetItemOverlayImage($hCombo, 2, 6)
	MsgBox($MB_SYSTEMMODAL, "Information", "Ausgewähltes Item: " & _GUICtrlComboBoxEx_GetItemOverlayImage($hCombo, 0))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
