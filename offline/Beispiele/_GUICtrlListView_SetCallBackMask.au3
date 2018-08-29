#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example_UDF_Created()

Func Example_UDF_Created()
	Local $hGUI, $hImage, $idListView

	$hGUI = GUICreate("(UDF) ListView: Setzt die Callback-Maske", 400, 300)

	$hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlListView_SetCallBackMask($idListView, 32)
	MsgBox($MB_SYSTEMMODAL, "Information", "Callback-Maske: " & _GUICtrlListView_GetCallbackMask($idListView))

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0x0000FF, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xC0C0C0, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xFF00FF, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xFFFF00, 16, 16))
	_GUICtrlListView_SetImageList($idListView, $hImage, 1)
	_GUICtrlListView_SetImageList($idListView, $hImage, 2)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 3", 100)

	; Fügt die Items mit der Callback-Maske hinzu
	_GUICtrlListView_AddItem($idListView, -1, 0)
	_GUICtrlListView_AddItem($idListView, -1, 1)
	_GUICtrlListView_AddItem($idListView, -1, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created
