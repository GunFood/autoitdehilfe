#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("ComboBoxEx: Ermittelt Item-Attribute (v" & @AutoItVersion & ")", 500, 300)
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

	; Setzt den Itemabstand (Einrückung)
	_GUICtrlComboBoxEx_SetItemIndent($hCombo, 1, 1)

	; Erzeugt die Struktur
	Local $tItem = DllStructCreate($tagCOMBOBOXEXITEM)
	; Setzt die Maske für das Gewünschte
	DllStructSetData($tItem, "Mask", BitOR($CBEIF_IMAGE, $CBEIF_INDENT, $CBEIF_LPARAM, $CBEIF_SELECTEDIMAGE, $CBEIF_OVERLAY))
	; Setzt den Index des gewünschten Items
	DllStructSetData($tItem, "Item", 3)

	_GUICtrlComboBoxEx_GetItemEx($hCombo, $tItem)
	Local $sText
	Local $iLen = _GUICtrlComboBoxEx_GetItemText($hCombo, 1, $sText)
	MemoWrite("Item Text: " & $sText)
	MemoWrite("Länge des Item-Textes ......................: " & $iLen)
	MemoWrite("Anzahl der Bildbreiten bis zur Einrückung ..: " & DllStructGetData($tItem, "Indent"))
	MemoWrite("0-basierender Itembilderindex ..............: " & DllStructGetData($tItem, "Image"))
	MemoWrite("0-basierender Itemstatusbilderindex ........: " & DllStructGetData($tItem, "SelectedImage"))
	MemoWrite("0-basierender Itembilder-Overlay-Index: ....: " & DllStructGetData($tItem, "OverlayImage"))
	MemoWrite("Anwendungsspezifischer Wert ................: " & DllStructGetData($tItem, "Param"))

	; Ändert Item 1
	MsgBox($MB_SYSTEMMODAL, "Information", "Ändert Item 1")
	$tItem = DllStructCreate($tagCOMBOBOXEXITEM)
	DllStructSetData($tItem, "Mask", $CBEIF_INDENT)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "Indent", 2)

	_GUICtrlComboBoxEx_SetItemEx($hCombo, $tItem)

	; Zegit das Dropdown
	_GUICtrlComboBoxEx_ShowDropDown($hCombo, True)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
