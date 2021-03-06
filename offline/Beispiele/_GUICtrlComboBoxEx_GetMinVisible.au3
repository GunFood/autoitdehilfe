#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hImage, $iImage, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Ermittelt die minimale Anzahl von sichtbaren Items", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 100)
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

	_GUICtrlComboBoxEx_InitStorage($hCombo, 150, 300)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)

	For $x = 0 To 149
		$iImage = Random(0, 8, 1)
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)), $iImage, $iImage)
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	MsgBox($MB_SYSTEMMODAL, "Information", "Minimale Anzahl.: " & _GUICtrlComboBoxEx_GetMinVisible($hCombo))
	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt die minimale Anzahl: " & _GUICtrlComboBoxEx_SetMinVisible($hCombo, 50))
	MsgBox($MB_SYSTEMMODAL, "Information", "Minimale Anzahl.: " & _GUICtrlComboBoxEx_GetMinVisible($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
