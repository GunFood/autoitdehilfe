#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGUI = GUICreate("(UDF) ListView: Erstellt eine Imagelist für das bestimmte Item (v" & @AutoItVersion & ")", 600, 300)

	Local $hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 494, 118)
	$g_idMemo = GUICtrlCreateEdit("", 2, 124, 496, 174, 0)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($hListView, False)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Rot", 0)
	_GUICtrlListView_AddItem($hListView, "Grün", 1)
	_GUICtrlListView_AddItem($hListView, "Blau", 2)

	; Erstellt eine Imagelist für das bestimmte Item
	Local $aDrag = _GUICtrlListView_CreateDragImage($hListView, 0)
	_GUICtrlListView_DrawDragImage($hListView, $aDrag)

	MemoWrite("Drag Image Handle = 0x" & Hex($aDrag[0]) & " IsPtr = " & IsPtr($aDrag[0]) & " IsHWnd = " & IsHWnd($aDrag[0]))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				_GUICtrlListView_DrawDragImage($hListView, $aDrag)
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Löscht die Imagelist
	_GUIImageList_Destroy($aDrag[0])

	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
