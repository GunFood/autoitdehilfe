#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt die Einrückung (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 0", 0)
	_GUICtrlListView_AddItem($idListview, "Item 1", 1)
	_GUICtrlListView_AddItem($idListview, "Item 2", 2)

	; Items einrücken
	_GUICtrlListView_SetItemIndent($idListview, 1, 1)
	_GUICtrlListView_SetItemIndent($idListview, 2, 2)
	MsgBox($MB_SYSTEMMODAL, "Information", "Einrückung von Item 1: " & _GUICtrlListView_GetItemIndent($idListview, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
