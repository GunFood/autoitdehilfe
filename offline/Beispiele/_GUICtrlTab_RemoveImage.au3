#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	Local $hGui, $hImage, $idTab

	; Erstellt eine GUI
	$hGui = GUICreate("Tab-Control: Bild entfernen", 400, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 16, 16))
	_GUICtrlTab_SetImageList($idTab, $hImage)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1", 0)
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2", 1)
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3", 2)

	; Entfernt das zweite Bild
	MsgBox($MB_SYSTEMMODAL, "Information", "Entfernt das zweite Bild in der Liste")
	_GUICtrlTab_RemoveImage($idTab, 1)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
