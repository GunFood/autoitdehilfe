#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>

Example_UDF_Created()

Func Example_UDF_Created()

	Local $hGUI, $hImage, $aDrag, $hListView

	$hGUI = GUICreate("(UDF) ListView: Zeichnet das zu ziehende Bild", 400, 300)

	$hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
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

	; Zeichnet das zu ziehende Bild
	$aDrag = _GUICtrlListView_CreateDragImage($hListView, 0)
	_GUICtrlListView_DrawDragImage($hListView, $aDrag)

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
EndFunc   ;==>Example_UDF_Created
