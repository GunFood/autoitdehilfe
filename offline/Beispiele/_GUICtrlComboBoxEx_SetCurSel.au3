#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $hImage, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Markiert das Item mit dem angegebenen Index", 500, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 494, 300, BitOR($CBS_SIMPLE, $WS_VSCROLL, $WS_BORDER))
	GUISetState(@SW_SHOW)

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
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

	_GUICtrlComboBoxEx_InitStorage($hCombo, 100, 200)

	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	For $x = 0 To 99
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallsstring", $x), Random(0, 8, 1), Random(0, 8, 1), Random(0, 8, 1))
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Setzt den Index des momentan markierten Items
	_GUICtrlComboBoxEx_SetCurSel($hCombo, Random(0, 99, 1))

	; Ermittelt den Index des momentan markierten Items
	MsgBox(8256, "Information", "Index des markierten Items: " & _GUICtrlComboBoxEx_GetCurSel($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
