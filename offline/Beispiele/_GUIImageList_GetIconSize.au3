#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hImage, $aSize, $idListview

	GUICreate("ImageList: Icongröße ermitteln", 400, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 394, 199, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	$g_idMemo = GUICtrlCreateEdit("", 2, 200, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	$hImage = _GUIImageList_Create(32, 32, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 2: Spalte 2", 1, 2)

	; Zeigt die Icongröße in der Imagelist
	$aSize = _GUIImageList_GetIconSize($hImage)
	MemoWrite("Bilderbreite: " & $aSize[0])
	MemoWrite("Bilderhöhe  : " & $aSize[1])

	MsgBox($MB_SYSTEMMODAL, "Information", "Es wird die Icongröße geändert")

	_GUIImageList_SetIconSize($hImage, 16, 16)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	$aSize = _GUIImageList_GetIconSize($hImage)
	MemoWrite("Bilderbreite: " & $aSize[0])
	MemoWrite("Bilderhöhe  : " & $aSize[1])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
