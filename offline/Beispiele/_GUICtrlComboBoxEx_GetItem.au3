#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hImage, $aItem, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Setzt und ermittelt Attribute eines Items (v" & @AutoItVersion & ")", 600, 300)
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
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : String", $x), $x, $x)
	Next

	; Setzt den Einrückwert der Items 1 und 3
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 1, 1)

	$aItem = _GUICtrlComboBoxEx_GetItem($hCombo, 3)
	MemoWrite("Item Text: " & $aItem[0])
	MemoWrite("Länge des Item-Textes ......................: " & $aItem[1])
	MemoWrite("Anzahl der Bilderbreiten bis zur Einrückung : " & $aItem[2])
	MemoWrite("0-basierender Itembilderindex ..............: " & $aItem[3])
	MemoWrite("0-basierender Itemstatusbilderindex ........: " & $aItem[4])
	MemoWrite("0-basierender Itembilder-Overlay-Index: ....: " & $aItem[5])
	MemoWrite("Anwendungsspezifischer Wert ................: " & $aItem[6])


	; Ändert Item 1
	MsgBox($MB_SYSTEMMODAL, "Information", "Ändert Item 1")
	_GUICtrlComboBoxEx_SetItem($hCombo, "Neues Item 1", 1)

	; Zegit das Dropdown
	_GUICtrlComboBoxEx_ShowDropDown($hCombo, True)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
