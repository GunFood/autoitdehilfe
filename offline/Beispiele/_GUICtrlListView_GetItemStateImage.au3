#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt das dargestellte Statusbild (v" & @AutoItVersion & ")", 600, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($idListview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)
	_GUICtrlListView_SetImageList($idListview, $hImage, 2)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($idListview, "Zeile 3: Spalte 1", 2)

	; Setzt das dargestellte Statusbild für Item 2
	_GUICtrlListView_SetItemStateImage($idListview, 1, 1)
;~ 	MsgBox($MB_SYSTEMMODAL, "Information", "Dargestelltes Statusbild für Item 2: " & _GUICtrlListView_GetItemStateImage($idListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
