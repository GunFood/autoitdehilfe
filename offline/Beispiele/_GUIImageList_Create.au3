#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WinAPIGdi.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idListview, $hImage
	Local $iStylesEx = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)

	GUICreate("Imagelist: Erstellen", 400, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($idListview, $iStylesEx)
	GUISetState(@SW_SHOW)

	; Bilder laden
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0x0000FF, 11, 11))
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Spalte hinzufügen
	_GUICtrlListView_AddColumn($idListview, "Items", 120)

	; Items hinzufügen
	_GUICtrlListView_AddItem($idListview, "Item 1", 0)
	_GUICtrlListView_AddItem($idListview, "Item 2", 1)
	_GUICtrlListView_AddItem($idListview, "Item 3", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
