#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hGui, $hListview, $hImage
	Local $iStylesEx = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)

	$hGui = GUICreate("ImageList: Icon hinzufügen", 400, 300)
	$hListview = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($hListview, $iStylesEx)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlListView_SetImageList($hListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($hListview, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($hListview, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($hListview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($hListview, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($hListview, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($hListview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($hListview, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_AddItem($hListview, "Zeile 3: Spalte 1", 2)
	_GUICtrlListView_AddItem($hListview, "Zeile 4: Spalte 1", 3)
	_GUICtrlListView_AddItem($hListview, "Zeile 5: Spalte 1", 4)
	_GUICtrlListView_AddSubItem($hListview, 4, "Zeile 5: Spalte 2", 1, 3)
	_GUICtrlListView_AddItem($hListview, "Zeile 6: Spalte 1", 5)
	_GUICtrlListView_AddSubItem($hListview, 5, "Zeile 6: Spalte 2", 1, 4)
	_GUICtrlListView_AddSubItem($hListview, 5, "Zeile 6: Spalte 3", 2, 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
