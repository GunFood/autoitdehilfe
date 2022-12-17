#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("ImageList: Setzt und ermittel die aktuelle Hintergrundfarbe (v" & @AutoItVersion & ")", 600, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))

	Local $iStylesEx = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES)
	_GUICtrlListView_SetExtendedListViewStyle($idListview, $iStylesEx)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	MsgBox($MB_SYSTEMMODAL, "Information", "Hintergrundfarbe: " & _GUIImageList_GetBkColor($hImage))
	_GUIImageList_SetBkColor($hImage, 0x0000FF)
	MsgBox($MB_SYSTEMMODAL, "Information", "Hintergrundfarbe: " & _GUIImageList_GetBkColor($hImage))

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 3: Spalte 1", 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 4: Spalte 1", 3)
	_GUICtrlListView_AddItem($idListview, "Zeile 5: Spalte  1", 4)
	_GUICtrlListView_AddSubItem($idListview, 4, "Zeile 5: Spalte 2", 1, 3)
	_GUICtrlListView_AddItem($idListview, "Zeile 6: Spalte 1", 5)
	_GUICtrlListView_AddSubItem($idListview, 5, "Zeile 6: Spalte 2", 1, 4)
	_GUICtrlListView_AddSubItem($idListview, 5, "Zeile 6: Spalte 3", 2, 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
