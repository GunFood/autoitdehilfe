#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aInfo, $hImage, $idListView

	GUICreate("ListView: Ermittelt Informationen einer Gruppe", 400, 300)

	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListView), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListView), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListView), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 3", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($idListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($idListView, "Zeile 3: Spalte 1", 2)

	; Gruppen erstellen
	_GUICtrlListView_EnableGroupView($idListView)
	_GUICtrlListView_InsertGroup($idListView, -1, 1, "Gruppe 1", 1) ; Text zentriert
	_GUICtrlListView_InsertGroup($idListView, -1, 2, "Gruppe 2") ; Text linksbündig
	_GUICtrlListView_SetItemGroupID($idListView, 0, 1)
	_GUICtrlListView_SetItemGroupID($idListView, 1, 2)
	_GUICtrlListView_SetItemGroupID($idListView, 2, 2)

	; Ändert Informationen einer Gruppe
	$aInfo = _GUICtrlListView_GetGroupInfo($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Bisheriger Text der ersten Gruppe: " & $aInfo[0])
	_GUICtrlListView_SetGroupInfo($idListView, 1, "Neue Gruppe 1") ; Text linksbündig

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
