#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idListview, $hImage1, $hImage2
	Local $iStylesEx = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)

	GUICreate("Imagelist: Löschen", 400, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($idListview, $iStylesEx)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage1 = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage1, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage1, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage1, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0x0000FF, 11, 11))
	_GUICtrlListView_SetImageList($idListview, $hImage1, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 1", 0)
	_GUICtrlListView_AddItem($idListview, "Item 2", 1)
	_GUICtrlListView_AddItem($idListview, "Item 3", 2)

	MsgBox($MB_SYSTEMMODAL, "Information", "Es wird nun eine neue Imagelist erstellt")

	; Eine neue Imagelist erstellen
	$hImage2 = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage2, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0x0000FF, 11, 11))
	_GUIImageList_Add($hImage2, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage2, _WinAPI_CreateSolidBitmap(GUICtrlGetHandle($idListview), 0xFF0000, 11, 11))
	_GUICtrlListView_SetImageList($idListview, $hImage2, 1)

	MsgBox($MB_SYSTEMMODAL, "Information", "Löschen der ersten Imagelist")

	; Erste Imagelist löschen
	_GUIImageList_Destroy($hImage1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
