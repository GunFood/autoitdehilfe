#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hImage, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Ermittelt die minimal erlaubte Breite der ListBox", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 100)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
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

	For $x = 0 To 8
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)), $x, $x)
	Next

	; Ermittelt die minimal erlaubte Breite der ListBox
	MemoWrite("minimal erlaubte Breite......: " & _GUICtrlComboBoxEx_GetDroppedWidth($hCombo))

	Sleep(500)

	; Zeigt das Dropdown
	_GUICtrlComboBoxEx_ShowDropDown($hCombo, True)

	Sleep(500)

	; Versteckt das Dropdown
	_GUICtrlComboBoxEx_ShowDropDown($hCombo)

	; Setzt die minimal erlaubte Breite der ListBox
	_GUICtrlComboBoxEx_SetDroppedWidth($hCombo, 500)

	Sleep(500)

	; Ermittelt die minimal erlaubte Breite der ListBox
	MemoWrite("minimal erlaubte Breite......: " & _GUICtrlComboBoxEx_GetDroppedWidth($hCombo))

	Sleep(500)

	; Zeigt das Dropdown
	_GUICtrlComboBoxEx_ShowDropDown($hCombo, True)

	Sleep(500)

	; Versteckt das Dropdown
	_GUICtrlComboBoxEx_ShowDropDown($hCombo)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
