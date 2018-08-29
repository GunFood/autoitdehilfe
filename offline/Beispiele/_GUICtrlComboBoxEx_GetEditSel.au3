#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hImage, $aSel, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Ermittelt die Position des Startzeichens und des Endzeichens der aktuellen Markierung", 800, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 70, BitOR($CBS_SIMPLE, $WS_VSCROLL, $WS_BORDER))
	$g_idMemo = GUICtrlCreateEdit("", 2, 72, 396, 226, 0)
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

	; Fügt Strings hinzu
	For $x = 0 To 8
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)), $x, $x)
	Next

	; Wählt einen String in der Liste einer ComboBox aus
	_GUICtrlComboBoxEx_SetCurSel($hCombo, Random(0, 8, 1))

	; Wählt Zeichen im Edit-Control einer ComboBox aus
	_GUICtrlComboBoxEx_SetEditSel($hCombo, 0, 4)

	; Ermittelt die Position des Startzeichens und des Endzeichens der aktuellen Markierung in einem Edit-Control einer ComboBox
	$aSel = _GUICtrlComboBoxEx_GetEditSel($hCombo)
	MemoWrite(StringFormat("Ausgewähltes Item: [%d][%d]", $aSel[0], $aSel[1]))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
