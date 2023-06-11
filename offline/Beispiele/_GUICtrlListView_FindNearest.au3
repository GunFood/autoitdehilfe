#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ListView: Findet das nächste Item (v" & @AutoItVersion & ")", 400, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUICtrlSetStyle($idListview, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListview), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListview), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListview), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListview, $hImage, 0)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 1", 0)
	_GUICtrlListView_AddItem($idListview, "Item 2", 1)
	_GUICtrlListView_AddItem($idListview, "Item 3", 2)

	; Findet das Item, welches sich am nächsten bei der bestimmten Position befindet
	Local $iIndex = _GUICtrlListView_FindNearest($idListview, 100, 10)
	MsgBox($MB_SYSTEMMODAL, "Information", "Das nächste Item [100, 10]: " & $iIndex)

	$iIndex = _GUICtrlListView_FindNearest($idListview, 200, 10)
	MsgBox($MB_SYSTEMMODAL, "Information", "Das nächste Item [200, 10]: " & $iIndex)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
