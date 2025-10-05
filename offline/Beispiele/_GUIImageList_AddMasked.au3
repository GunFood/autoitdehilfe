#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $idListview, $hImage

	GUICreate("Imagelist: AddMasked", 400, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_AddMasked($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0xFF0000, 11, 11))
	_GUIImageList_AddMasked($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x00FF00, 11, 11))
	_GUIImageList_AddMasked($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x0000FF, 11, 11))
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 1", 0)
	_GUICtrlListView_AddItem($idListview, "Item 2", 1)
	_GUICtrlListView_AddItem($idListview, "Item 3", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
