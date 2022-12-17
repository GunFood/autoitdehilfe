#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt den Itemstatus (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)

	Local $iStylesEx = BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)
	_GUICtrlListView_SetExtendedListViewStyle($idListview, $iStylesEx)
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
	_GUICtrlListView_AddColumn($idListview, "Spalte 0", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 0: Spalte 0", 0)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 0: Spalte 1", 1, 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 0: Spalte 2", 2, 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 0", 1)
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 1: Spalte 1", 1, 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 0", 2)

	; Status von Item 0 ermitteln
	_GUICtrlListView_SetItemState($idListview, 0, $LVIS_FOCUSED, $LVIS_FOCUSED)
	MsgBox($MB_SYSTEMMODAL, "Information", "Status von Item 0: " & _GUICtrlListView_GetItemState($idListview, 0, $LVIS_FOCUSED))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
