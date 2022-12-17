#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("TTab-Control: Setzt und ermittelt das Itembild (v" & @AutoItVersion & ")", 500, 300)
	Local $idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 16, 16))
	_GUICtrlTab_SetImageList($idTab, $hImage)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2")

	; Ermittelt/Setzt das Bild von Tab 1
	_GUICtrlTab_SetItemImage($idTab, 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Tab 1 Bildindex: " & _GUICtrlTab_GetItemImage($idTab, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
