#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("ComboBoxEx: Setzt und ermittelt die Itemhöhe (v" & @AutoItVersion & ")", 500, 300)
	Local $hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
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

	For $x = 0 To 8
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : String", $x), $x, $x)
	Next

	MemoWrite("Setzt die Itemhöhe: " & _GUICtrlComboBoxEx_SetItemHeight($hCombo, -1, 18))
	MemoWrite("Itemhöhe: " & _GUICtrlComboBoxEx_GetItemHeight($hCombo, -1))
	MemoWrite("Setzt die Itemhöhe: " & _GUICtrlComboBoxEx_SetItemHeight($hCombo, 0, 20))
	MemoWrite("Itemhöhe: " & _GUICtrlComboBoxEx_GetItemHeight($hCombo, 0))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
