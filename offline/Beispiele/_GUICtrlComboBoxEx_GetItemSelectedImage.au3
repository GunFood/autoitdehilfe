#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI und eine ComboBox
	Local $hGUI = GUICreate("ComboBoxEx: Setzt und ermittelt den Bildindex für den markierten Zustand eines Items (v" & @AutoItVersion & ")", 700, 300)
	Local $hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState(@SW_SHOW)

	; Imagelist erstellen
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

	; ComboBox füllen
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	Local $iImage
	For $x = 0 To 149
		$iImage = Random(0, 8, 1)
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : String", $x), $iImage, $iImage)
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Dem ersten Item (Index 0) das zweite Bild (Index 1) der Liste zuweisen
	_GUICtrlComboBoxEx_SetItemImage($hCombo, 0, 1)

	; Einrückungen festlegen
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 1, 1)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 2, 1)

	; Wenn das erste Item (Index 0) markiert ist, wird ihm das vierte Bild (Index 3) der Liste zugewiesen
	_GUICtrlComboBoxEx_SetItemSelectedImage($hCombo, 0, 3)

	; Ausgabe des Bildindexes, der verwendet wird, wenn das Item markiert ist
	MsgBox($MB_SYSTEMMODAL, "Information", "Bildindex im ausgewählten Zustand für Item 0: " & _GUICtrlComboBoxEx_GetItemSelectedImage($hCombo, 0))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
