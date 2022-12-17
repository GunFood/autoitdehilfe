#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example_UDF_Created()

Func Example_UDF_Created()
	Local $hGUI = GUICreate("(UDF) ListView: Setzt und ermittelt die Callback-Maske (v" & @AutoItVersion & ")", 600, 300)

	Local $hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlListView_SetCallBackMask($hListView, 32)
	MsgBox($MB_SYSTEMMODAL, "Information", "Callback-Maske: " & _GUICtrlListView_GetCallbackMask($hListView))

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xC0C0C0, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF00FF, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFFFF00, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)
	_GUICtrlListView_SetImageList($hListView, $hImage, 2)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 0", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)

	; Fügt die Items mit der Callback-Maske hinzu
	_GUICtrlListView_AddItem($hListView, "Item 0", 0)
	_GUICtrlListView_AddItem($hListView, "Item 1", 1)
	_GUICtrlListView_AddItem($hListView, "Item 2", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created
