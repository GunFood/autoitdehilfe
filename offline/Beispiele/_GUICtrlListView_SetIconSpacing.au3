#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $idListView

	; Erstellt eine GUI
	GUICreate("ListView: Setzt den Abstand zwischen Icons", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUICtrlSetStyle($idListView, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListView, $hImage, 0)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1", 0)
	_GUICtrlListView_AddItem($idListView, "Item 2", 1)
	_GUICtrlListView_AddItem($idListView, "Item 3", 2)

	; Ändert den Abstand zwischen Icons
	MsgBox($MB_SYSTEMMODAL, "Information", "Ändert den Abstand zwischen Icons")
	_GUICtrlListView_SetIconSpacing($idListView, 32, 32)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
