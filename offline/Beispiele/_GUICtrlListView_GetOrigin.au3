#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aOrigin, $hImage, $idListView

	GUICreate("ListView: Ermittelt den Ursprung der aktuellen Ansicht", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUICtrlSetStyle($idListView, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListView, $hImage, 0)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1", 0)
	_GUICtrlListView_AddItem($idListView, "Item 2", 1)
	_GUICtrlListView_AddItem($idListView, "Item 3", 2)

	; Ermittelt den Ursprung der aktuellen Ansicht
	$aOrigin = _GUICtrlListView_GetOrigin($idListView)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Erfolg: %s Ursprung: X=%d, Y=%d", @extended = 1, $aOrigin[0], $aOrigin[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
