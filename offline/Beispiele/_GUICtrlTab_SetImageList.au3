#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	Local $hGui, $hImage, $idTab

	; Erstellt eine GUI
	$hGui = GUICreate("Tab-Control: setzt die Imagelist", 400, 300)
	$idTab = _GUICtrlTab_Create($hGui, 2, 2, 396, 296)
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

	; Zeigt das Handle der Imagelist
	MsgBox($MB_SYSTEMMODAL, "Information", "Vorheriges Handle der Imageliste: 0x" & Hex($hImage) & @CRLF & _
			"IsPtr = " & IsPtr($hImage) & " IsHwnd = " & IsHWnd($hImage))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
